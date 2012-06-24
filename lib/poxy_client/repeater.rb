module PoxyClient
  class Repeater

    attr_accessor :request

    attr_reader :destination


    def initialize(options = {})
      [ :destination
      ].each do |option|
        instance_variable_set("@#{option}", options[option])
      end
    end

    def set(json_array)
      @result = []
      @connector = PoxyClient::Connector.new()
      json_array.each do |request|
        @connector.connect do |request|
          request.method = request["method"]
          request.url = @destination
          request.headers = request["headers"]
          request.body = request["params"]
        end
        @result << @connector.response
      end
      @result
    end

  end
end