#
# Cookbook Name:: mesos_demo
# Attributes:: default
#
# Copyright 2015, Ovais Tariq <me@ovaistariq.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Java
default['java']['jdk_version'] = '7'

# Zookeeper configuration
default['mesos_demo']['zookeeper']['host'] = '192.168.33.10'
default['mesos_demo']['zookeeper']['port'] = '2181'
default['mesos_demo']['zookeeper']['mesos_path'] = 'mesos'
default['mesos_demo']['zookeeper']['marathon_path'] = 'marathon'

# Mesosphere Mesos version.
default['mesos']['version'] = '0.23.0'

# Master configuration
default['mesos']['master']['flags']['authenticate'] = false
default['mesos']['master']['flags']['authenticate_slaves'] = false
default['mesos']['master']['flags']['logging_level'] = 'INFO'
default['mesos']['master']['flags']['quorum'] = 1
default['mesos']['master']['flags']['max_slave_ping_timeouts'] = 10
default['mesos']['master']['flags']['zk'] = "zk://#{node['mesos_demo']['zookeeper']['host']}:#{node['mesos_demo']['zookeeper']['port']}/#{node['mesos_demo']['zookeeper']['mesos_path']}"
default['mesos']['master']['flags']['cluster'] = 'mesos-sandbox'

# Slave configuration
default['mesos']['slave']['flags']['gc_delay'] = '1days'
default['mesos']['slave']['flags']['switch_user'] = true
default['mesos']['slave']['flags']['master'] = "zk://#{node['mesos_demo']['zookeeper']['host']}:#{node['mesos_demo']['zookeeper']['port']}/#{node['mesos_demo']['zookeeper']['mesos_path']}"

# Update slave configuration to specify the use of the Docker containerizer
# The order of the parameters to containerizers is important. It specifies the priority used when choosing the containerizer to launch the task.
default['mesos']['slave']['flags']['containerizers'] = 'docker,mesos'

# Increase the executor timeout to account for the potential delay in pulling a docker image to the slave.
default['mesos']['slave']['flags']['executor_registration_timeout'] = '5mins'

# Marathon configuration
default['marathon']['flags']['master'] = "zk://#{node['mesos_demo']['zookeeper']['host']}:#{node['mesos_demo']['zookeeper']['port']}/#{node['mesos_demo']['zookeeper']['mesos_path']}"
default['marathon']['flags']['zk'] = "zk://#{node['mesos_demo']['zookeeper']['host']}:#{node['mesos_demo']['zookeeper']['port']}/#{node['mesos_demo']['zookeeper']['marathon_path']}"

# Set to at least the executor timeout, in milliseconds, you set on the mesos slaves
default['marathon']['flags']['task_launch_timeout'] = '300000'

default['marathon']['zookeeper_server_list'] = [ node['mesos_demo']['zookeeper']['host'] ]
default['marathon']['zookeeper_port'] = node['mesos_demo']['zookeeper']['port']
default['marathon']['zookeeper_path'] = node['mesos_demo']['zookeeper']['path']
default['marathon']['zookeeper_marathon_path'] = 'marathon'

# Additional packages
default['mesos_demo']['additional_packages'] = %w(curl)

# Docker
default['docker']['version'] = '1.9.0'
