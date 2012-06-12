require 'test/unit'
require 'poxy_client'
require 'json'

class PoxyClientTest < Test::Unit::TestCase

  def test_version
    assert_equal PoxyClient::VERSION, '0.0.1'
  end

  def test_config_version
    @config = PoxyClient::Configuration.new
    assert_equal @config.retriever_version, PoxyClient::VERSION
  end

  def test_config_block
    PoxyClient.configure do |config|
      config.api_key = "theapi"
      config.bucket_key = "thebuckit"
    end

    @client = PoxyClient
    #params passed for config
    assert_equal @client.configuration.api_key, "theapi"
    assert_equal @client.configuration.bucket_key, "thebuckit"
    #params by default
    assert_equal @client.configuration.destination, "http://localhost"
  end

  def test_whole_thing
    PoxyClient.configure do |config|
      config.origin = "http://localhost:9393"
      config.api_key = "94b142077c2e82522062d834493e66bc1aa0958b3cb44807d53ffca87ba77031"
      config.bucket_key = "f2b34b07d6efa7dca68495c38805597bb6f878a225ade5e6bf95c1317bef1cd3"
      config.destination = "http://localhost:9292/debug"
    end
    response = PoxyClient.retriever.get
    result = []
    requests = JSON.parse(response.body)
    requests.each do |r|
      rp = JSON.parse(r)
      result << PoxyClient.repeater.set(rp)
    end
  end

end