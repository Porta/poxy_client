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
      @connector = PoxyClient::Connector.new(@destination)
      @connector.connect do |request|
        request.headers = json_request["headers"]
        request.method = json_request["method"]
        request.params = json_request["params"]
        request.body = ""

      end
      @connector.response
      #Do something with response
    end

  end
end