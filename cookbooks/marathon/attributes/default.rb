# Marathon package
default['marathon']['version']            = '0.10.1'
default['marathon']['source']['url']      = "http://downloads.mesosphere.com/marathon/v#{node['marathon']['version']}/marathon-#{node['marathon']['version']}.tgz"
default['marathon']['source']['checksum'] = '0c4c78058a26194cf039614e3f88ab4746a534a372cc547e511972909397bf5b'

# Marathon user and directories
default['marathon']['user']                               = 'marathon'
default['marathon']['group']                              = 'marathon'
default['marathon']['home']                               = '/opt/marathon'
default['marathon']['config_dir']                         = '/etc/marathon'
default['marathon']['log_dir']                            = '/var/log/marathon'

default['marathon']['jar_source']                         = 'https://s3.amazonaws.com/dl.imedidata.net/marathon/marathon-0.4.1-SNAPSHOT-jar-with-dependencies.jar'
default['marathon']['java_heap']                          = "#{(node['memory']['total'].to_i - (node['memory']['total'].to_i / 2)) / 1024}m"

# JVM flags
default['marathon']['jvm']["Xmx#{node['marathon']['java_heap']}"] = true

# Marathon command line flags
default['marathon']['flags']['master'] = 'http://localhost'

# Marathon service
default['marathon']['init'] = 'upstart'

default['marathon']['options']['checkpoint']              = nil
default['marathon']['options']['event_subscriber']        = nil
default['marathon']['options']['executor']                = nil
default['marathon']['options']['failover_timeout']        = nil
default['marathon']['options']['ha']                      = nil
default['marathon']['options']['hostname']                = nil
default['marathon']['options']['http_credentials']        = nil
default['marathon']['options']['http_endpoints']          = nil
default['marathon']['options']['http_port']               = nil
default['marathon']['options']['https_port']              = nil
default['marathon']['options']['local_port_max']          = nil
default['marathon']['options']['local_port_min']          = nil
default['marathon']['options']['log_config']              = nil
default['marathon']['options']['master']                  = nil
default['marathon']['options']['mesos_role']              = nil
default['marathon']['options']['ssl_keystore_password']   = nil
default['marathon']['options']['ssl_keystore_path']       = nil
default['marathon']['options']['zk_state']                = nil
default['marathon']['options']['zk_timeout']              = nil

default['marathon']['zookeeper_server_list']              = []
default['marathon']['zookeeper_port']                     = 2181
default['marathon']['zookeeper_marathon_path']            = 'mesos'
default['marathon']['zookeeper_path']                     = 'mesos'

default['marathon']['zookeeper_exhibitor_discovery']      = false
default['marathon']['zookeeper_exhibitor_url']            = nil
