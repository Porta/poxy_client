require 'test/unit'
require 'poxy_client'


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

end