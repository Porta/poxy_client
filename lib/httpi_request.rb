module HTTPI
	class Request
		attr_accessor :method
		
		def method(value = :get)
			@method ||= value.downcase
		end
	end
end
