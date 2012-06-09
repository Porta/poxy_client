module PoxyClient
  class Retriever


    attr_reader :api_key
    attr_reader :bucket_key
    attr_reader :origin
    attr_reader :mode
    attr_reader :retriever_version

    REQUESTS_URI = '/api/v1/requests'.freeze

    def initialize(options = {})
      [ :api_key,
        :bucket_key,
        :origin,
        :mode,
        :retriever_version
      ].each do |option|
        instance_variable_set("@#{option}", options[option])
      end

    end


    def get
      #TODO: move to a factory
      @connector = PoxyClient::Connector.new
      @connector.connect do |request|
        request.target = url,
        request.method = :post,
        request.params = {:bucket_key => @bucket_key, :api_key => @api_key}
      end
      @connector.response
      #Do something with response
    end


    protected

    def url
      @origin << REQUESTS_URI
    end


  end
end