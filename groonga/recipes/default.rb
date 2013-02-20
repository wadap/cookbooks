#
# Cookbook Name:: groonga
# Recipe:: default
#
# Copyright 2013, nanapi.inc
#
# All rights reserved - Do Not Redistribute
#

# include_recipe "mecab"

script "install_groonga" do
  interpreter "bash"
  user "root"
  cwd node.src
  code <<-EOH
  wget http://packages.groonga.org/source/groonga/#{node.groonga.package}.zip
  unzip #{node.groonga.package}.zip
  cd #{node.groonga.package}
  ./configure --prefix=#{node.groonga.root} --with-mecab-config=#{node.mecab.config}
  make
  #{node.paco.bin} -D make install
  EOH
end
