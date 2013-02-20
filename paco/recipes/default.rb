#
# Cookbook Name:: paco
# Recipe:: default
#
# Copyright 2013, nanapi.inc
#
# All rights reserved - Do Not Redistribute
#
script "install_paco" do
  interpreter "bash"
  user "root"
  cwd node.src
  code <<-EOH
  wget http://downloads.sourceforge.net/project/paco/paco/#{node.paco.version}/#{node.paco.package}.tar.gz
  tar xf #{node.paco.package}.tar.gz
  cd #{node.paco.package}
  ./configure --disable-gpaco
  make
  make install
  make logme
  EOH
end
