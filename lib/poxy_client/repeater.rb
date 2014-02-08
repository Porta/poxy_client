module PoxyClient
  class Repeater

    attr_reader :destination

    def initialize(options = {})
      [ :destination
      ].each do |option|
        instance_variable_set("@#{option}", options[option])
      end
    end

    # Generates and send requests retrieved from the API
    #
    # @param [Array] json_array with parsed requests
    # @return [Array] responses from server to each request
    def set(json_array)
      @result = []
      @connector = PoxyClient::Connector.new()
      json_array.each do |params|
        @connector.connect do |request|
          request.method = params["method"]
          request.url = @destination << '?' << params["query_string"].to_s
          request.headers = params["headers"]
          request.body = params["params"]
        end
        @result << @connector.response
      end
      @result
    end

  end
end