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

def gaussian(mean, stddev)
  theta = 2 * Math::PI * Kernel.rand
  rho = Math.sqrt(-2 * Math.log(1 - Kernel.rand))
  scale = stddev * rho
  y = mean + scale * Math.sin(theta)
  return y
end

get '/' do
  sleep gaussian(0.3775, 0.01118)

  'Hello'
end

get '/health' do
  'OK'
end
