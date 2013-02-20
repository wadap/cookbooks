#
include_attribute "paco"
#
default["nanapi"]["root"]        = "/var/nanapi"
default["apache"]["archive_log"] = "/var/log/httpd"
# apache settings
default["apache"]["version"]     = "2.2.23"
default["apache"]["package"]     = "httpd-#{default["apache"]["version"]}"
default["apache"]["root"]        = "/usr/local/apache2.2"
default["apache"]['conf']        = "#{default["apache"]["root"]}/conf"
default["apache"]['extra']       = "#{default["apache"]["conf"]}/extra"
default["apache"]['vhosts']      = "#{default["apache"]["root"]}/vhosts"
default["apache"]["ssl"]["dir"]  = "#{default["apache"]["root"]}/conf/ssl2"
default["apache"]["ssl"]["crt"]  = "#{default["apache"]["ssl"]["dir"]}/ssl.nanapi.jp.crt"
default["apache"]["ssl"]["ca"]   = "#{default["apache"]["ssl"]["dir"]}/inter.crt"
default["apache"]["ssl"]["ssl_key"]  = "#{default["apache"]["ssl"]["dir"]}/ssl.nanapi.jp.nopass.key"
