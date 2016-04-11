#!/bin/bash -e

echo "stoping mail_room"
mail_room_pid_file="tmp/pids/mail_room.pid"

echo $mail_room_pid_file
if [ -f $mail_room_pid_file ]
then
	if [ -s $mail_room_pid_file ]
	then
		echo "killing"
		kill -15 $(cat tmp/pids/mail_room.pid) && rm -f tmp/pids/mail_room.pid
	fi
fi

echo "stoping websocket server"
websocket_server_pid_file="tmp/pids/websocket_server.pid"

if [ -f $websocket_server_pid_file ]; then
	if [ -s $websocket_server_pid_file ]; then
		echo "killing"
		kill -15 $(cat tmp/pids/websocket_server.pid) && rm -f tmp/pids/websocket_server.pid 
	fi
fi

echo "stoping sidekiq"
sidekiq_pid_file="tmp/pids/sidekiq.pid"

if [ -f $sidekiq_pid_file ];then 
	if [ -s $sidekiq_pid_file ]; then
		echo "killing"
		kill -15 $(cat tmp/pids/sidekiq.pid) && rm -f tmp/pids/sidekiq.pid 
	fi
fi
exit 1