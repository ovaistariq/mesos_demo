#
# Cookbook Name:: marathon
# Recipe:: service
#

template 'marathon-init' do
  path   '/etc/init/marathon.conf'
  source 'upstart.erb'
  variables(wrapper: ::File.join(node['marathon']['home'], 'wrapper'))
end

# Marathon master service definition
service 'marathon' do
  case node['marathon']['init']
  when 'systemd'
    provider Chef::Provider::Service::Systemd
  when 'sysvinit_debian'
    provider Chef::Provider::Service::Init::Debian
  when 'upstart'
    provider Chef::Provider::Service::Upstart
  end
  supports status: true, restart: true
  subscribes :restart, 'template[marathon-init]'
  subscribes :restart, 'template[marathon-wrapper]'
  action [:enable, :start]
end
