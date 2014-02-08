require 'test/unit'
require 'poxy_client'
require 'json'

class PoxyProcessorTest < Test::Unit::TestCase
  def setup
    @raw_request = "[{\"method\":\"POST\",\"headers\":{\"HOST\":\"localhost:9393\",\"CONNECTION\":\"keep-alive\",\"ORIGIN\":\"localhost:9393\",\"USER_AGENT\":\"Don Gato y su Pandilla\",\"ACCEPT\":\"*/*\",\"ACCEPT_ENCODING\":\"gzip,deflate,sdch\",\"ACCEPT_LANGUAGE\":\"en-US,en;q=0.8\",\"ACCEPT_CHARSET\":\"ISO-8859-1,utf-8;q=0.7,*;q=0.3\",\"COOKIE\":\"rumba\",\"VERSION\":\"HTTP/1.1\"},\"query_string\":\"urlparam=1&url_param=2\",\"params\":{\"postparam\":\"uno\",\"post_param\":\"dos\"},\"body\":\"\"}]"
    @parsed_request = PoxyClient.processor.parse(@raw_request)
  end


end