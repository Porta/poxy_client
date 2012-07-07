require 'test/unit'
require 'poxy_client'
require 'json'

class PoxyClientTest < Test::Unit::TestCase

  def test_version
    assert_equal PoxyClient::VERSION, '0.0.1.pre.1'
  end

  def test_config_version
    @config = PoxyClient::Configuration.new
    assert_equal @config.retriever_version, PoxyClient::VERSION
  end

  def test_config_block
    PoxyClient.configure do |config|
      config.api_key = "test"
      config.bucket_key = "test"
    end

    @client = PoxyClient
    #params passed for config
    assert_equal @client.configuration.api_key, "test"
    assert_equal @client.configuration.bucket_key, "test"
    #params by default
    assert_equal @client.configuration.destination, "http://localhost"
  end


end
