#
# Cookbook Name:: mecab
# Recipe:: default
#
# Copyright 2013, nanapi.inc
#
# All rights reserved - Do Not Redistribute
#
script "install_mecab" do
  interpreter "bash"
  user "root"
  cwd node.src
  code <<-EOH
  rm -rf #{node.src}/#{node.mecab.package}*
  wget http://mecab.googlecode.com/files/#{node.mecab.package}.tar.gz
  tar xf #{node.mecab.package}.tar.gz
  cd #{node.mecab.package}
  ./configure --prefix=#{node.mecab.root}
  make
  #{node.paco.bin} -D make install
  EOH
end

script "install_mecab_dic" do
  interpreter "bash"
  user "root"
  cwd node.src
  code <<-EOH
  wget http://mecab.googlecode.com/files/#{node.mecab_dic.package}.tar.gz
  tar xf #{node.mecab_dic.package}.tar.gz
  cd #{node.mecab_dic.package}
  ./configure --prefix=#{node.mecab_dic.root} --with-mecab-config=#{node.mecab.config} --with-charset=utf8 --enable-utf8-only
  make
  #{node.paco.bin} -D make install
  EOH
end
