module PoxyClient
  class Processor

    def initialize(options = {})

    end

    def parse(content)
      @response = []
      if ( content.respond_to?(:body) )
        @response = JSON.parse(content.body)
      else
        @response = JSON.parse(content)
      end
      @response
    end

    def response
      @response
    end


  end
end
