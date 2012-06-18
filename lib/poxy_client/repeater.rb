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

    def set(json_request)
      #TODO: move to a factory
      @connector = PoxyClient::Connector.new()
      @connector.connect do |request|
        request.method = json_request["method"]
        request.url = @destination
        request.headers = json_request["headers"]
        request.body = json_request["params"]
      end
      @connector.response
      #Do something with response
    end

  end
end