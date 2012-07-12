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
      downcase_headers
      replace_host_from_headers
      puts @request.inspect
      @response = HTTPI.send(method, @request)
    end

    private

    def downcase_headers
      @replace = {}
      @request.headers.each_pair do |k,v|
        @replace.merge!({k.downcase => v})
      end
      @request.headers = @replace
    end

    def replace_host_from_headers
      @request.headers['host'] = @request.url.host
    end

  end

end