module FakeSms
	Message = Struct.new(:number, :message)
	@messages = []

	def self.send_sms(number: num, message: msg)
		@messages << Message.new(number, message)
	end

	def self.messages
		@messages
	end
end
