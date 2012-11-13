default[:hydra_jetty][:git_repo]     = 'git://github.com/projecthydra/hydra-jetty.git'
default[:hydra_jetty][:git_ref]      = 'master'
default[:hydra_jetty][:user]         = 'jetty'
default[:hydra_jetty][:group]        = 'jetty'
default[:hydra_jetty][:dir]          = '/var/jetty'
default[:hydra_jetty][:log]          = '/var/log/jetty.log'
default[:hydra_jetty][:start_file]   = 'start.jar'
default[:hydra_jetty][:java]         = '/usr/bin/java'
default[:hydra_jetty][:java_options] = [
  '-XX:+CMSPermGenSweepingEnabled',
  '-XX:+CMSClassUnloadingEnabled',
  '-XX:PermSize=64M',
  '-XX:MaxPermSize=128M'
]
