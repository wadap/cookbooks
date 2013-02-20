# mroonga attribute
include_attribute "groonga"
include_attribute "paco"
include_attribute "mysql"

default["mroonga"]["version"] = "3.00"
default["mroonga"]["package"] = "mroonga-#{default["mroonga"]["version"]}"
