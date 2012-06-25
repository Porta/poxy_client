require 'test/unit'
require 'poxy_client'


class PoxyRetrieverTest < Test::Unit::TestCase

  def setup
    PoxyClient.configure do |config|
      config.origin = "http://poxy.porta.sh"
      config.api_key = "test"
      config.bucket_key = "test"
    end
    @retriever = PoxyClient.retriever
  end

  def test_retriever_config
    assert_equal @retriever.origin, "http://poxy.porta.sh"
    assert_equal @retriever.mode, "development"
  end

  def test_retriever_get
    response = @retriever.get(:all)
    assert_equal response.class, HTTPI::Response
  end

  


end