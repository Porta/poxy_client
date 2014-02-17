require 'test/unit'
require 'poxy_client'
require 'json'

class PoxyProcessorTest < Test::Unit::TestCase
  def setup
    @raw_response = '{
    "code": "200",
    "message": "Access to Requests Granted",
    "page": 1,
    "per_page": 50,
    "item_count": 3,
    "item_class": "request",
    "items": [
        {
            "id": 1,
            "bucket_id": 1,
            "starred": false,
            "archived": false,
            "processed": {
                "method": "GET",
                "origin": null,
                "path": "/",
                "params": {
                },
                "uploads": [  ]                
            },
            "raw": {
                "method": "GET",
                "path": "/",
                "headers": {
                    "HOST": "my-bucket-name.poxy.ws",
                    "CONNECTION": "keep-alive",
                    "CACHE_CONTROL": "no-cache",
                    "USER_AGENT": "FooBar",
                    "ACCEPT": "*/*",
                    "ACCEPT_ENCODING": "gzip,deflate,sdch",
                    "ACCEPT_LANGUAGE": "en-US,en;q=0.8,es;q=0.6"
                },
                "query_string": "",
                "params": {},
                "body": "",
                "origin": null
            }
        },
        {
            "id": 2,
            "bucket_id": 1,
            "starred": true,
            "archived": false,
            "processed": {
                "method": "POST",
                "origin": null,
                "path": "/",
                "params": {
                    "uno": "dos",
                    "dos": "tres"
                },
                "uploads": [  ]                
            },
            "raw": {
                "method": "POST",
                "path": "/",
                "headers": {
                    "ACCEPT_LANGUAGE": "en-US,en;q=0.8,es;q=0.6",
                    "CONNECTION": "keep-alive",
                    "ACCEPT_ENCODING": "gzip,deflate,sdch",
                    "ACCEPT": "*/*",
                    "CACHE_CONTROL": "no-cache",
                    "ORIGIN": "",
                    "USER_AGENT": "FooBar",
                    "HOST": "my-bucket-name.poxy.ws"
                },
                "query_string": "",
                "params": {
                    "uno": "dos",
                    "dos": "tres"
                },
                "body": "------WebKitFormBoundaryJchAQzyXrTzJl9eq\r\nContent-Disposition: form-data; name=\"uno\"\r\n\r\ndos\r\n------WebKitFormBoundaryJchAQzyXrTzJl9eq\r\nContent-Disposition: form-data; name=\"dos\"\r\n\r\ntres\r\n------WebKitFormBoundaryJchAQzyXrTzJl9eq--\r\n",
                "origin": ""
            }
        } ,
        {
            "id": 3,
            "bucket_id": 2,
            "starred": false,
            "archived": true,
            "processed": {
                "method": "GET",
                "origin": null,
                "path": "/",
                "params": {
                },
                "uploads": [  ]
            },
            "raw": {
                "method": "GET",
                "path": "/",
                "headers": {
                    "HOST": "another-one.poxy.ws",
                    "CONNECTION": "keep-alive",
                    "CACHE_CONTROL": "no-cache",
                    "USER_AGENT": "FooBar",
                    "ACCEPT": "*/*",
                    "ACCEPT_ENCODING": "gzip,deflate,sdch",
                    "ACCEPT_LANGUAGE": "en-US,en;q=0.8,es;q=0.6"
                },
                "query_string": "",
                "params": {},
                "body": "",
                "origin": null
            }
        }
    ]
}'
    @raw_request = '{
            "id": 1,
            "bucket_id": 1,
            "starred": false,
            "archived": false,
            "processed": {
                "method": "GET",
                "origin": null,
                "path": "/",
                "params": {
                },
                "uploads": [  ]                
            },
            "raw": {
                "method": "GET",
                "path": "/",
                "headers": {
                    "HOST": "my-bucket-name.poxy.ws",
                    "CONNECTION": "keep-alive",
                    "CACHE_CONTROL": "no-cache",
                    "USER_AGENT": "FooBar",
                    "ACCEPT": "*/*",
                    "ACCEPT_ENCODING": "gzip,deflate,sdch",
                    "ACCEPT_LANGUAGE": "en-US,en;q=0.8,es;q=0.6"
                },
                "query_string": "",
                "params": {},
                "body": "",
                "origin": null
            }
        }'

    @parsed_response = PoxyClient.processor.parse(@raw_response)
    @complete_response = PoxyClient.processor.complete_items
    @parsed_request = JSON.parse(@raw_request)
  end

  def test_request_process
    assert_equal @parsed_request["raw"], @parsed_response[0]
  end

  def test_complete_request_process
    assert_equal @parsed_request, @complete_response[0]
  end

end