require 'test/unit'
require 'poxy_client'
require 'json'

class PoxyRepeaterTest < Test::Unit::TestCase
  def setup

    PoxyClient.configure do |config|
      config.destination = "http://home.herokuapp.com/"
    end
    @repeater = PoxyClient.repeater

    #make sure the HOST header is set to the destination host, or the request willl be rejected
    @raw_request = "[{\"method\":\"POST\",\"headers\":{\"HOST\":\"localhost:9292\",\"CONNECTION\":\"keep-alive\",\"ORIGIN\":\"localhost:9292\",\"USER_AGENT\":\"Don Gato y su Pandilla\",\"ACCEPT\":\"*/*\",\"ACCEPT_ENCODING\":\"gzip,deflate,sdch\",\"ACCEPT_LANGUAGE\":\"en-US,en;q=0.8\",\"ACCEPT_CHARSET\":\"ISO-8859-1,utf-8;q=0.7,*;q=0.3\",\"COOKIE\":\"rumba\",\"VERSION\":\"HTTP/1.1\"},\"query_string\":\"urlparam=1&url_param=2\",\"params\":{\"postparam\":\"uno\",\"post_param\":\"dos\"},\"body\":\"\"}]"
    @json_request = JSON.parse(@raw_request)
  end


  def test_repeater_config
    assert_equal @repeater.destination, "http://home.herokuapp.com/"
  end

  def test_repeater_set
    responses = @repeater.set(@json_request)

	  #assert_equal response[0].class, HTTPI::Response
    assert_equal responses.first.code, 200 #poxy will respond with a 200, since it's a "receive" bucket
    assert responses.first.body.include?('Don Gato y su Pandilla'), "Don Gato not present" 
    
  end

end
