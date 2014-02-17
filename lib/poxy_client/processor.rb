module PoxyClient
  class Processor

    def initialize(options = {})

    end

    # Parse the JSON encoded string from the retriever and generates an Object
    #
    # @param [String] content The JSON encoded string from the retriever.
    # @return [Array] The list of items retrieved
    def parse(content)
      @response = []
      if ( content.respond_to?(:body) )
        @response = JSON.parse(content.body)
      else
        @response = JSON.parse(content)
      end
      @complete_items = @response["items"]
      @raw_items = @response["items"].map{|i| i['raw']}
    end

    def response
      @response
    end

    def complete_items
      @complete_items
    end

    def raw_items
      @raw_items
    end

  end
end
