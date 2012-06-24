require "poxy_client/version.rb"
require "poxy_client/configuration.rb"
require "poxy_client/connector.rb"
require "poxy_client/retriever.rb"
require "poxy_client/repeater.rb"
require "poxy_client/parser.rb"
require "httpi"
require "httpi_request"

module PoxyClient

  class << self

    attr_reader :configuration


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

    def parser
      @parser ||= PoxyClient::Parser.new(configuration)
    end

    def connector
      @connector ||= PoxyClient::Connector.new(configuration)
    end



  end
end
