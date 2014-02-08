require 'test/unit'
require 'poxy_client'


class PoxyRetrieverTest < Test::Unit::TestCase

  def setup
    PoxyClient.configure do |config|
      config.origin = "https://poxy.apiary.io"
      config.api_key = "3acb90c157c9f968d4e7d8929fd5264cc2c9693fa67a83911412ef9b6bfa95f6"
    end
    @retriever = PoxyClient.retriever
  end

  def test_retriever_config
    assert_equal @retriever.origin, "https://poxy.apiary.io"
    assert_equal @retriever.mode, "development"
  end

  def test_retriever_get
    response = @retriever.get
    assert_equal response.code, 200
    parsed = JSON.parse(response.body)
    expected = {"code" => "200"}
    assert_equal parsed["code"], expected["code"]
  end


  def test_a_few_requests
    response = @retriever.get(:search => "bucket_id: 1")
    parsed = JSON.parse(response.body)
    expected = {"item_count" => 3, "item_class" => "request"}
    assert_equal parsed["item_count"], expected["item_count"]
    assert_equal parsed["item_class"], expected["item_class"]
  end

end