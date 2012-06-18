
module PoxyClient
  class Connector

    attr_accessor :method
    attr_accessor :request
    attr_accessor :response

    def initialize
      HTTPI.adapter = :curb
    end


    def connect
      yield(request)
    end

    def request
      @request ||= HTTPI::Request.new
    end

    def method
      @method ||= @request.method.downcase
    end

    def response
      @response = HTTPI.send(method, @request)
    end

  end
end