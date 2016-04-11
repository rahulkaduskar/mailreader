WebsocketRails::EventMap.describe do
  #namespace :mail do

    # using a Hash to specify the target
    #subscribe :create, :to => PushController, :with_method => :create

    subscribe :client_connected, :to => PushController, :with_method => :user_connected
   # subscribe :new, :to => PushController, :with_method => :incoming_message
 
  #end
end
