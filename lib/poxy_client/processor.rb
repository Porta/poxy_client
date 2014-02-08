module PoxyClient
  class Processor

    def initialize(options = {})

    end

    # Parse the JSON encoded string from the retriever and generates an Object
    #
    # NOTE: There's a X-FORWARDED-FOR header added here to every request.
    # @param [String] content The JSON encoded string from the retriever.
    # @return [Object] The parsed (and modified) headers
    def parse(content)
      @response = []
      if ( content.respond_to?(:body) )
        @response = JSON.parse(content.body)
      else
        @response = JSON.parse(content)
      end
    end

    def response
      @response
    end


  end
end
