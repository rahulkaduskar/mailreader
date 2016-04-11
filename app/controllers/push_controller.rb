class PushController  < WebsocketRails::BaseController

	def user_connected
		
		p 'user connected'

		send_message :user_info, {:user => "jkhkhkjhk"}
	end

	def incoming_message
		p 'incoming_message'
		broadcast_message '', :new, { :text => "dsfdsfdsf"}
	end

end