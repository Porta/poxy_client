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
      config.origin = "http://poxy.porta.sh"
      config.api_key = "c2a2923ae87c5b2d25953ce0c9157b9cfcc61881ccb9e1823e571acea4c6fc19"
      config.bucket_key = "2b6efa89aa530bb965ff4a791f92a3db87965c67308eef2e9026d170ccd5314e"
      config.destination = "http://localhost:9292"
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