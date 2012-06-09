module PoxyClient
  class Connector

    attr_accessor :request
    attr_accessor :response

    def initialize
      hydra
      self
    end

    def hydra
      @hydra ||= Typhoeus::Hydra.new
    end

    def connect
      yield(request)
      hydra.queue(@request)
      hydra.run
      @response = @request.response
    end

    def request
      @request ||= PoxyClient::Request.new
    end

  end
end