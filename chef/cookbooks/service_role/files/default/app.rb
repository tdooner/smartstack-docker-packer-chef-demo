require 'sinatra'
require 'json'
require 'socket'

# on boot, update the zookeeper config
old_config = JSON.load(open('/opt/smartstack/nerve/config.json'))
old_config["services"]["hello_service_4567"]["zk_hosts"] = [ENV["ZOOKEEPER_PORT"].gsub("tcp://", "")]
old_config["services"]["hello_service_4567"]["host"] = IPSocket.getaddress(Socket.gethostname)
f = open('/opt/smartstack/nerve/config.json', 'w')
JSON.dump(old_config, f)
f.close
`service nerve restart`

get '/' do
  sleep 1

  'Hello'
end

get '/health' do
  'OK'
end
