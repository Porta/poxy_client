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

    def perform(howmany = :all)
      requests = PoxyClient.retriever.get(howmany)
      parsed = PoxyClient.processor.parse(requests)
      result = PoxyClient.repeater.set(parsed)
    end

  end
end
