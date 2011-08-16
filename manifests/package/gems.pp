class rbot::package::gems {
  Exec {
    path => '/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/rvm/bin',
  }
  
  package { 'gettext-ruby':
    ensure   => 'present',
    name     => 'gettext',
    provider => 'gem',
  }
}