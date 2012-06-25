module PoxyClient
  class Repeater

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
      json_array.each do |params|
        @connector.connect do |request|
          request.method = params["method"]
          request.url = @destination
          request.headers = params["headers"]
          request.body = params["params"]
        end
        @result << @connector.response
      end
      @result
    end

  end
end