require 'test/unit'
require 'poxy_client'


class PoxyRetrieverTest < Test::Unit::TestCase

  def setup
    PoxyClient.configure do |config|
      config.origin = "http://poxy.porta.sh"
      config.api_key = "c2a2923ae87c5b2d25953ce0c9157b9cfcc61881ccb9e1823e571acea4c6fc19"
      config.bucket_key = "2b6efa89aa530bb965ff4a791f92a3db87965c67308eef2e9026d170ccd5314e"
    end
    @retriever = PoxyClient.retriever
  end

  def test_retriever_config
    assert_equal @retriever.origin, "http://poxy.porta.sh"
    assert_equal @retriever.mode, "development"
  end

  def test_retriever_get
    response = @retriever.get(:all)
    assert_equal response.class, Typhoeus::Response
  end

  


end