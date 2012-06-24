
module PoxyClient
  class Parser

    attr_accessor :requests
    attr_accessor :response

    def initialize(options = {})
      [ :requests
      ].each do |option|
        instance_variable_set("@#{option}", options[option])
      end

    end

    def process(content)
      @response = []
      if ( content.respond_to?(:body) )
        elements = JSON.parse(content.body)
        elements.each do |r|
          @response << JSON.parse(r)
        end
      end
      @response
    end

    def response
      @response
    end


  end
end
