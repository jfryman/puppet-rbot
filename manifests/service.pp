class rbot::service {
  service { 'rbot':
    ensure  => 'running',
    start   => '/etc/init.d/rbot start',
    stop    => '/etc/init.d/rbot stop',
    pattern => 'launch_here.rb'
  }
}