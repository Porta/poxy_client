module PoxyClient
  class Request
    attr_accessor :target
    attr_accessor :method
    attr_accessor :headers
    attr_accessor :body
    attr_accessor :params

    def initialize(options = {})
      [:target, :method, :headers, :body, :params].each do |option|
        instance_variable_set("@#{option}", options[option])
      end
      @request = Typhoeus::Request.new(target,
                                      :body          => @body,
                                      :method        => @method,
                                      :headers       => @headers,
                                      :timeout       => 100, # milliseconds
                                      :cache_timeout => 60, # seconds
                                      :params        => @params)
    end

  end
end