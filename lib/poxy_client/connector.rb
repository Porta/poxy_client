module PoxyClient
  class Connector

    def initialize(options = {})
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