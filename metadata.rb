name             "hydra-jetty"
maintainer       "Dan Brubaker Horst"
maintainer_email "dan.brubaker.horst@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures hydra-jetty"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

supports "centos"

depends "java"
depends "iptables"
