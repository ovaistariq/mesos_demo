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

# Mesosphere Mesos version.
default['mesos']['version'] = '0.23.0'

# Master configuration
default['mesos']['master']['flags']['authenticate'] = false
default['mesos']['master']['flags']['authenticate_slaves'] = false
default['mesos']['master']['flags']['logging_level'] = 'INFO'
default['mesos']['master']['flags']['quorum'] = 1
default['mesos']['master']['flags']['max_slave_ping_timeouts'] = 10

# Slave configuration
default['mesos']['slave']['flags']['gc_delay'] = '1days'
default['mesos']['slave']['flags']['switch_user'] = true
