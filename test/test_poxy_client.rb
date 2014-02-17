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
      config.api_key = "3acb90c157c9f"
      config.destination = "http://home.herokuapp.com/"
    end

    @client = PoxyClient
    #params passed for config
    assert_equal @client.configuration.api_key, "3acb90c157c9f"
    #params by default
    assert_equal @client.configuration.destination, "http://home.herokuapp.com/"
  end

  def test_integration
    PoxyClient.configure do |config|
      config.origin = "https://poxy.apiary.io"
      config.api_key = "3acb90c157c9f"
      config.destination = "http://home.herokuapp.com/"
    end

    @client = PoxyClient
    @retriever = PoxyClient.retriever
    @repeater = PoxyClient.repeater
    requests = @retriever.get
    processed = PoxyClient.processor.parse(requests)
    processed.each do |request|
      responses = @repeater.set([request])
      assert_not_nil responses.first.body.match('FooBar')
      assert_equal responses.first.code, 200
    end
  end

  def test_client_perform
    PoxyClient.configure do |config|
      config.origin = "https://poxy.apiary.io"
      config.api_key = "3acb90c157c9f"
      config.destination = "http://home.herokuapp.com/"
    end

    result = PoxyClient.perform(:starred => true)
    assert_not_nil result
  end


end
