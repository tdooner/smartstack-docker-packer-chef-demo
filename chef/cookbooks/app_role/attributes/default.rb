default.languages.ruby.default_version = '1.9.1'

# Uses docker run's --link option, which puts an entry in /etc/hosts for
# `zookeeper` pointing to the other dock:
default.zookeeper.smartstack_cluster = ['zookeeper:2181']

default.smartstack.services = {
  'hello_service' => {
    'zk_path' => '/hello',
    'local_port' => '9999',
    'synapse' => {
      'discovery' => { 'method' => 'zookeeper' },
      'haproxy' => {
        'server_options' => 'check inter 1s rise 1 fall 1',
        'listen' => ['mode http', 'option httpchk GET /health']
      }
    },
    'nerve' => {
      'port' => '4567',
      'check_interval' => 3,
      'checks' => [{ 'type' => 'http', 'uri' => '/health', 'timeout' => 2, 'rise' => 1, 'fall' => 1 }]
    }
  }
}

default.nerve.enabled_services = []
default.synapse.enabled_services = ['hello_service']
