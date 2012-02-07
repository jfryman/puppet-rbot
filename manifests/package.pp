class rbot::package(
  $version
) {
  anchor { 'rbot::package::begin': }


  case $::operatingsystem {
    redhat,centos,oel,fedora: {
      class { 'rbot::package::redhat':
        require => Anchor['rbot::package::begin'],
        before  => Class['rbot::package::gems'],
      }
    }
    ubuntu,debian: {
      class { 'rbot::package::debian':
        require => Anchor['rbot::package::begin'],
        before  => Class['rbot::package::gems'],
      }
    }
  }

  class { 'rbot::package::gems': }
  -> class { 'rbot::package::rbot':
       version => $version,
     }
  -> anchor { 'rbot::package::end': }
}
