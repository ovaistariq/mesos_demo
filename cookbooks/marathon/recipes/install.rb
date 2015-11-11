#
# Cookbook Name:: marathon
# Recipe:: install
#

include_recipe 'apt'
include_recipe 'java'
include_recipe 'mesos'

group node['marathon']['group'] do
  system true
end

user node['marathon']['user'] do
  comment 'Marathon Framework User'
  gid     node['marathon']['group']
  shell   '/bin/false'
  system  true
end

directory node['marathon']['home'] do
  owner     node['marathon']['user']
  group     node['marathon']['group']
  mode      00755
  recursive true
end

directory "#{node['marathon']['home']}/environment" do
  owner node['marathon']['user']
  group node['marathon']['group']
  mode 00755
  action :create
end

directory node['marathon']['config_dir'] do
  owner node['marathon']['user']
  group node['marathon']['group']
  mode 00755
  action :create
end

directory node['marathon']['log_dir'] do
  owner node['marathon']['user']
  group node['marathon']['group']
  mode 00755
  action :create
end

pkg_location = ::File.join(Chef::Config[:file_cache_path], 'marathon.tgz')

remote_file 'marathon-pkg' do
  path     pkg_location
  source   node['marathon']['source']['url']
  checksum node['marathon']['source']['checksum']
end

execute 'marathon-extract' do
  user    node['marathon']['user']
  group   node['marathon']['group']
  command "/bin/tar -xf #{pkg_location} -C #{node['marathon']['home']}"
  only_if { ::Dir.glob("#{node['marathon']['home']}/*#{node['marathon']['version']}").empty? }
end

# Setup the jar location in the template on the first-run
# ruby_block "datadog-purestorage-attributes" do
#   block do
#     # inject the dynamically created attribute into the template resource
#     tpl = resources(template: 'marathon-wrapper')
#     tpl.variables(
#       :jar => ::Dir.glob("#{node['marathon']['home']}/*#{node['marathon']['version']}/target/*/*.jar").first.to_s
#     )
#   end
#
#   subscribes :create, "execute[marathon-extract]", :immediately
# end

template 'marathon-wrapper' do
  path     ::File.join(node['marathon']['home'], 'wrapper')
  owner    'root'
  group    'root'
  mode     '0755'
  source   'wrapper.erb'
  variables(
    lazy {
      {
        jar:   ::Dir.glob("#{node['marathon']['home']}/*#{node['marathon']['version']}/target/*/*.jar").first.to_s,
        jvm:   node['marathon']['jvm'],
        flags: node['marathon']['flags']
      }
    }
  )
end
