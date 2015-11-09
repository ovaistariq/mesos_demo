#
# Cookbook Name:: mesos_demo
# Recipe:: docker_host
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

################
# Docker service
################

include_recipe 'apt-docker'

docker_service 'default' do
  host ['unix:///var/run/docker.sock', 'tcp://127.0.0.1:2376']
  version node['docker']['version']
  labels ['environment:mesos_demo', 'executor:marathon']
  install_method 'package'
  action [:create, :start]
end
