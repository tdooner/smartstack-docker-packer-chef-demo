require 'json'

worker_processes 10
timeout 5
preload_app true

before_fork do |server, worker|
  # on boot, update the zookeeper config
  old_config = JSON.load(open('/opt/smartstack/synapse/config.json'))
  old_config["services"]["app"]["discovery"]["hosts"] = [ENV["ZOOKEEPER_PORT"].gsub("tcp://", "")]
  f = open('/opt/smartstack/synapse/config.json', 'w')
  JSON.dump(old_config, f)
  f.close
  `service synapse restart`
end
