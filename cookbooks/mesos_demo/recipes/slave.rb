#
# Cookbook Name:: mesos_demo
# Recipe:: slave
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

include_recipe 'apt'
include_recipe 'mesos::slave'

# Setup the correct zookeeper url for master detection
file '/etc/mesos/zk' do
  owner 'root'
  group 'root'
  mode 0644
  content node['mesos']['master']['flags']['zk']
  action :create
end

node['mesos_demo']['additional_packages'].each do |pkg|
  package pkg do
    action :install
  end
end

# Install and configure docker
include_recipe 'mesos_demo::docker_host'
