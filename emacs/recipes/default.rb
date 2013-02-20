#
# Cookbook Name:: emacs
# Recipe:: default
#
# Copyright 2013, nanapi.inc
#
# All rights reserved - Do Not Redistribute
#

# emacs package
package "libtiff-devel" do
  action :install
end

# install emacs from source
script "install_emacs23" do
  interpreter "bash"
  user "root"
  cwd node.src
  code <<-EOH
  wget http://ftp.gnu.org/pub/gnu/emacs/#{node.emacs.package}.tar.gz
  tar xf #{node.emacs.package}.tar.gz
  cd #{node.emacs.package}
  ./configure --with-gif=no --with-x-toolkit=no
  make
  #{node.paco.bin} -D make install
  EOH
end
