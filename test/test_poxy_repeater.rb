require 'test/unit'
require 'poxy_client'


class PoxyRepeaterTest < Test::Unit::TestCase

  def setup
    PoxyClient.configure do |config|
      config.destination = "http://localhost:9393/repeater"
    end
    @repeater = PoxyClient.repeater
  end


  def test_repeater_config
    assert_equal @repeater.destination, "http://localhost:9393/repeater"
  end



end