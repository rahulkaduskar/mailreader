how to start/run application:
1. Start rails server=> rails s ( from the rails application root folder)
2. Start mail room, sidekiq  and websocket rails standalone server using the script.
   Go to rails application root folder  and execute sh ./bin/script/stop_services.sh 



To view the mails go to http://localhost:3000/mymail
This page will show latest 20 mails. Once a new mail is received the websocket rails server will push the mail to all clients 
connected. No need to refresh the page new mail will automatically seen at the top.

