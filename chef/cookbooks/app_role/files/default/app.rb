require 'sinatra'
require 'json'
require 'socket'

# on boot, update the zookeeper config
old_config = JSON.load(open('/opt/smartstack/synapse/config.json'))
old_config["services"]["hello_service"]["discovery"]["hosts"] = [ENV["ZOOKEEPER_PORT"].gsub("tcp://", "")]
f = open('/opt/smartstack/synapse/config.json', 'w')
JSON.dump(old_config, f)
f.close
`service synapse restart`

get '/' do
  # Get the hello value from the service
end
