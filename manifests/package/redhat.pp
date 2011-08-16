class rbot::package::redhat {
  $packages = [ 'db4', 'db4-utils', 'ruby-bdb', 'gettext', 'gettext-devel']
  
  package { $packages: 
    ensure => 'present',
    tag    => 'rbot-rpm-packages',
  }
}