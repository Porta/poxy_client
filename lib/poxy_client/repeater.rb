module PoxyClient
  class Repeater

    attr_accessor :request

    attr_reader :destination


    def initialize(options = {})
      [ :destination
      ].each do |option|
        instance_variable_set("@#{option}", options[option])
      end
    end

    def repeat(parameters)

    end

  end
end