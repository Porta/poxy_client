module PoxyClient
  class   Configuration
    OPTIONS = [:api_key, :bucket_key, :origin, :destination, :method, :mode, :retriever_version].freeze

    attr_accessor :api_key
    attr_accessor :bucket_key
    attr_accessor :origin
    attr_accessor :destination
    attr_accessor :method

    attr_accessor :mode
    attr_accessor :retriever_version

    def initialize
      @origin               = 'http://poxy.porta.sh'
      @destination          = 'http://localhost'
      @mode                 = 'development'
      @method               = "post"
      @retriever_version    = VERSION
    end

    def [](option)
      send(option)
    end

    def to_hash
      OPTIONS.inject({}) do |hash, option|
        hash[option.to_sym] = self.send(option)
        hash
      end
    end

    def merge(hash)
      to_hash.merge(hash)
    end

  end
end