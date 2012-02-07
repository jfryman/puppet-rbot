class rbot::package::debian {
  $packages = [ 'libdb-ruby1.8' ]

  package { $packages: 
    ensure => 'present',
    tag    => 'rbot-deb-packages',
  }
}
