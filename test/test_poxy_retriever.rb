require 'test/unit'
require 'poxy_client'


class PoxyRetrieverTest < Test::Unit::TestCase

  def setup
    PoxyClient.configure do |config|
      config.origin = "http://localhost:9393"
      config.api_key = "94b142077c2e82522062d834493e66bc1aa0958b3cb44807d53ffca87ba77031"
      config.bucket_key = "f2b34b07d6efa7dca68495c38805597bb6f878a225ade5e6bf95c1317bef1cd3"
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