require 'sinatra'
require 'json'
require 'socket'
require 'open-uri'

# on boot, update the zookeeper config
old_config = JSON.load(open('/opt/smartstack/nerve/config.json'))
old_config["services"]["app_4567"]["zk_hosts"] = [ENV["ZOOKEEPER_PORT"].gsub("tcp://", "")]
old_config["services"]["app_4567"]["host"] = IPSocket.getaddress(Socket.gethostname)
f = open('/opt/smartstack/nerve/config.json', 'w')
JSON.dump(old_config, f)
f.close
`service nerve restart`

# on boot, update the zookeeper config
old_config = JSON.load(open('/opt/smartstack/synapse/config.json'))
old_config["services"]["hello_service"]["discovery"]["hosts"] = [ENV["ZOOKEEPER_PORT"].gsub("tcp://", "")]
f = open('/opt/smartstack/synapse/config.json', 'w')
JSON.dump(old_config, f)
f.close
`service synapse restart`

get '/' do
  open('http://0.0.0.0:9999').read + ' world'
end

get '/health' do
  'OK'
end
