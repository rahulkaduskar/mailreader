echo "stoping all services"
SCRIPTLINK=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPTLINK")
echo $SCRIPT_DIR
sh "$SCRIPT_DIR/stop_services.sh"

echo "Starting mail_room"
nohup mail_room -c ./config/mail_room.yml 1>/dev/null 2>/dev/null &
echo $! > tmp/pids/mail_room.pid

echo "Starting websocket server"

nohup wsr 1>/dev/null 2>/dev/null &
echo $! > tmp/pids/websocket_server.pid


echo "Starting sidekiq"

nohup bundle exec sidekiq 1>/dev/null 2>/dev/null &
echo $! > tmp/pids/sidekiq.pid
echo "Started all other services"
exit 1