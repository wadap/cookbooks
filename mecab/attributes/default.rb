include_attribute "paco"
#
default["mecab"]["version"] = "0.994"
default["mecab"]["package"] = "mecab-#{default["mecab"]["version"]}"
default["mecab"]["root"]    = "/usr/local/#{default["mecab"]["package"]}"
default["mecab"]["config"]  = "#{default["mecab"]["root"]}/bin/mecab-config"
#
default["mecab_dic"]["version"] = "2.7.0-20070801"
default["mecab_dic"]["package"] = "mecab-ipadic-#{default["mecab_dic"]["version"]}"
default["mecab_dic"]["root"]    = "/usr/local/mecab-ipadic"
