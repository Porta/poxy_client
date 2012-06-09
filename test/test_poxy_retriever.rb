require 'test/unit'
require 'poxy_client'


class PoxyRetrieverTest < Test::Unit::TestCase

  def setup
    PoxyClient.configure do |config|
      config.origin = "http://localhost:9393"
    end
    @retriever = PoxyClient.retriever
  end

  def test_retriever_config
    assert_equal @retriever.origin, "http://localhost:9393"
    assert_equal @retriever.mode, "development"
  end

  def test_retriever_get
    response = @retriever.get
    assert_equal response.class, Typhoeus::Response
  end



end