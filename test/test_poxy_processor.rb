require 'test/unit'
require 'poxy_client'
require 'json'

class PoxyProcessorTest < Test::Unit::TestCase
  def setup

    PoxyClient.configure do |config|
      config.destination = "http://postbin.heroku.com/56a0320c"
      config.method = "post"
    end
    @raw_request = "{\"method\":\"POST\",\"headers\":{\"HOST\":\"localhost:9393\",\"CONNECTION\":\"keep-alive\",\"ORIGIN\":\"chrome-extension://fdmmgilgnpjigdojojpjoooidkmcomcm\",\"X_REQUESTED_WITH\":\"sorongotronic\",\"X_CHUPALA\":\"dale\",\"USER_AGENT\":\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.19 (KHTML, like Gecko) Ubuntu/11.10 Chromium/18.0.1025.168 Chrome/18.0.1025.168 Safari/535.19\",\"ACCEPT\":\"*/*\",\"ACCEPT_ENCODING\":\"gzip,deflate,sdch\",\"ACCEPT_LANGUAGE\":\"en-US,en;q=0.8\",\"ACCEPT_CHARSET\":\"ISO-8859-1,utf-8;q=0.7,*;q=0.3\",\"COOKIE\":\"poxy=BAh7DEkiD3Nlc3Npb25faWQGOgZFRiJFMmI3ODc5OTA5YzhkNjFlMjkzMmRj%0AOTk0NTk4OGNjMmE2Njg4M2FiZDRmNzc4NTc5MzgyMDliY2NlM2JhNzUzYUka%0ADXRyYWNraW5nBjsARnsISSIUSFRUUF9VU0VSX0FHRU5UBjsARiItNTk4MjNl%0AZjU1YzI4N2NhYjEyNWFkNzk5ZTIyYTg3NTgzOGQ0NWJlYkkiGUhUVFBfQUND%0ARVBUX0VOQ09ESU5HBjsARiItZWQyYjNjYTkwYTRlNzIzNDAyMzY3YTFkMTdj%0AOGIyODM5Mjg0MjM5OEkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsARiItY2M5%0AZjZmZWM2NTJhNDI1OGJjNmQyOTI4NzA1MjE3OWFiMWUwZDE0N0kiCWNzcmYG%0AOwBGIkVkN2Q1MmQwODhjOTZmYTMwMWE3OGNiYWRiYmU5Y2M4ZWYyNmIzYjll%0AYzdjMTFjNTM1OTkwMzk4ZDAwMDFiNDMwSSIRcmVtZW1iZXJfZm9yBjsARmkD%0AAHUSSSIJVXNlcgY7AEZJIgYxBjsARkkiDHN1Y2Nlc3MGOwBGSSIlWW91IGhh%0AdmUgc3VjY2Vzc2Z1bGx5IHNpZ25lZCB1cC4GOwBGSSIPZmxhc2hfa2luZAY7%0AAEZJIgdvawY7AEY%3D%0A--a86f16283e2e01cde59cffac507ca3f5319be642\",\"VERSION\":\"HTTP/1.1\"},\"query_string\":\"urlparam=1&url_param=2\",\"params\":{\"postparam\":\"uno\",\"post_param\":\"dos\"},\"body\":\"#<Rack::Lint::InputWrapper:0x00000002f87ad0>\"}"
    @parsed_request = PoxyClient.processor.parse(@raw_request)
  end



  def test_parser
    assert_equal JSON.parse(@raw_request), @parsed_request[0]
  end

end