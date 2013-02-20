#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, nanapi.inc
#
# All rights reserved - Do Not Redistribute
#

# build apache
script "install_apache" do
  interpreter "bash"
  user "root"
  cwd node.src
  code <<-EOH
  wget http://ftp.tsukuba.wide.ad.jp/software/apache/httpd/#{node.apache.package}.tar.gz
  tar xf ./#{node.apache.package}.tar.gz
  cd ./#{node.apache.package}
  ./configure --enable-mods-shared=most --enable-ssl=shared --enable-proxy=shared --enable-usertrack=shared \
  --enable-proxy-balancer=shared --prefix=#{node.apache.root}
  make
  #{node.paco.bin} -D make install
  EOH
end

# dirs
[node.apache.extra, node.apache.vhosts].each do |v|
  directory v do
    owner "root"
    group "root"
    mode  "0755"
    action :create
    recursive true
  end
end

# conf/httpd.conf
template "#{node.apache.conf}/httpd.conf" do
    user   "root"
    group  "root"
    mode   "0644"
end

# conf/extra/*.conf
%w{httpd-mpm.conf httpd-languages.conf httpd-vhosts.conf image.conf}.each do |v|
  template "#{node.apache.extra}/#{v}" do
    user   "root"
    group  "root"
    mode   "0644"
  end
end

# ssl dir
directory node.apache.ssl.dir do
  owner "root"
  group "root"
  mode   "0755"
  action :create
  recursive true
end

# ssl
[node.apache.ssl.crt, node.apache.ssl.ca, node.apache.ssl.ssl_key].each do |v|
  template v do
    user   "root"
    group  "root"
    mode   "0644"
  end
end

# archive log dir
directory node.apache.archive_log do
  owner "root"
  group "root"
  mode   "0755"
  action :create
  recursive true
end
