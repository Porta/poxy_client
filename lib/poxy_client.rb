require "poxy_client/version.rb"
require "poxy_client/configuration.rb"
require "poxy_client/retriever.rb"
require "poxy_client/repeater.rb"
require "poxy_client/processor.rb"
require "poxy_client/connector.rb"
require "httpi"
require "httpi_request"

module PoxyClient

  class << self

    #attr_reader :configuration


    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= PoxyClient::Configuration.new
    end

    def retriever
      @retriever ||= PoxyClient::Retriever.new(configuration)
    end

    def repeater
      @repeater ||= PoxyClient::Repeater.new(configuration)
    end

    def processor
      @processor ||= PoxyClient::Processor.new(configuration)
    end

    def connector
      @connector ||= PoxyClient::Connector.new(configuration)
    end

    # Encapsulates the three important operations. Retrieve, Process and Repeat
    # 
    # @params [Symbol] which requests to retrieve from the API.
    # Options are :all, :first, :last, :starred, :unstarred, :archived
    # @result [Array] With the responses received in the destination server.
    def perform(howmany = :all)
      # Retrieve all the available requests from the site API
      requests = PoxyClient.retriever.get(howmany)
      # Parse those requests to JSON.
      parsed = PoxyClient.processor.parse(requests)
      # Repeat the retrieved and parsed requests to (usually) localhost.
      # Check the sample poxy.conf file.
      result = PoxyClient.repeater.set(parsed)
    end

  end
end
