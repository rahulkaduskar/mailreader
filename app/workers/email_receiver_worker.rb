class EmailReceiverWorker
  include Sidekiq::Worker

  def perform(message)
    mail = Mail::Message.new(message)   
    mymail = Mymail.new()
    from = mail.from.first
    mymail.from = from
    mymail.subject = mail.subject
    mymail.message =  mail.html_part.body.decoded
    mymail.message_id = mail.message_id
    mymail.received_at = mail.date.to_time
    mymail.save
    WebsocketRails[:mymails].trigger(:new, mymail)
  end
end