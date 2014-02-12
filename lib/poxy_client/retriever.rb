module PoxyClient
  class Retriever


    attr_reader :api_key
    attr_reader :bucket_key
    attr_reader :origin
    attr_reader :mode
    attr_reader :retriever_version

    REQUESTS_URI = '/api/requests?'.freeze

    def initialize(options = {})
      [ :api_key,
        :origin,
        :mode,
        :retriever_version
      ].each do |option|
        instance_variable_set("@#{option}", options[option])
      end
    end


    #Retrieves requests from API.
    # @param [Symbol] how_many which requests to retrieve from the API.
    # Options are :new, :all, :first, :last, :starred, :unstarred, :archived
    # @return [String] A JSON encoded array of requests.
    def get(options = {})
      #TODO: move to a factory
      copy = {}

      if options.has_key? :starred
        copy[:starred] = options[:starred].to_s
      end

      if options.has_key? :archived
        copy[:archived] = options[:archived].to_s
      end

      if options.has_key? :bucket_ids
        copy[:bucket_ids] = options[:bucket_ids]
      end
      if options.has_key? :search
        copy[:search] = options[:search].downcase
      end
      
      if options.has_key? :page
        copy[:page] = options[:page]
      end

      if options.has_key? :per_page
        copy[:per_page] = options[:per_page]
      end

      query = Rack::Utils.build_nested_query(copy)

      @connector = PoxyClient::Connector.new
      @connector.connect do |request|
        request.method = :get
        request.url = build_url(query)
        request.auth.basic(@api_key, "")
      end
      @connector.response
    end


    protected

    def build_url(how_many)
      @origin + REQUESTS_URI + how_many
    end


  end
end
