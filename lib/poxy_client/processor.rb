module PoxyClient
  class Processor

    def initialize(options = {})

    end

    def parse(content)
      @response = ""
      if ( content.respond_to?(:body) )
        @response = JSON.parse(content.body)
      else
        @response = JSON.parse(content)
      end
      @response.each_with_index do |head, i|
        @response[i]['headers']['X-FORWARDED-FOR'] = @response[i]['headers']['HOST']
      end
      @response
    end

    def response
      @response
    end


  end
end
