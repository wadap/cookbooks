#
# Cookbook Name:: mroonga
# Recipe:: default
#
# Copyright 2013, nanapi.inc
#
# All rights reserved - Do Not Redistribute
#

package "pkgconfig" do
  action :install
end

script "install_mroonga" do
  interpreter "bash"
  user "root"
  cwd node.src
  code <<-EOH
    rm -rf "#{node.src}/#{node.mroonga.package}*"
    wget http://packages.groonga.org/source/mroonga/#{node.mroonga.package}.tar.gz
    tar xf #{node.mroonga.package}.tar.gz
    cd #{node.mroonga.package}
    ./configure \
    PKG_CONFIG_PATH=#{node.groonga.root}/lib/pkgconfig \
    --with-mysql-source=#{node.src}/#{node.mysql.package} \
    --with-mysql-config=#{node.mysql.config}
    make
    #{node.paco.bin} -D make install
  EOH
end
