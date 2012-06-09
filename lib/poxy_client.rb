require "poxy_client/version"
require "poxy_client/configuration"
require "poxy_client/request"
require "poxy_client/connector"
require "poxy_client/retriever"
require "poxy_client/repeater"

require "typhoeus"

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

    def connector
      @connector ||= PoxyClient::Connector.new(configuration)
    end

  end
end
