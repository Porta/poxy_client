module PoxyClient
  class Connector

    attr_accessor :request
    attr_accessor :response

    def initialize(target)
      hydra
      request(target)
      self
    end

    def hydra
      @hydra ||= Typhoeus::Hydra.new
    end

    def connect
      yield(request)
    end

    def request(target = "")
      @request ||= Typhoeus::Request.new(target)
    end

    def response
      hydra.queue(request)
      hydra.run
      @response = request.response
    end

  end
end