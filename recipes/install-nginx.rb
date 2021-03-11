#
# Cookbook:: nginx_setup
# Recipe:: install-nginx
#
# Copyright:: 2021, The Authors, All Rights Reserved.

nginx_install 'nginx' do
  source 'repo'
end

nginx_service 'nginx' do
  action :enable
  delayed_action :start
end

nginx_config 'nginx' do
  action :create
  notifies :reload, 'nginx_service[nginx]', :delayed
end
