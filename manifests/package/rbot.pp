class rbot::package::rbot(
  $version
) {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }
  
  file { '/tmp/rbot.tgz':
    ensure  => absent,
    require => Exec['extract-rbot'],
  }
  file { "${rbot::params::rt_base_dir}/rbot":
    ensure  => symlink,
    target  => "/opt/rbot-${version}",
    require => Exec['extract-rbot'],
  }
  exec { 'download-rbot':
    command => "wget --directory-prefix=/tmp http://ruby-rbot.org/download/rbot-${version}.tgz",
    creates => "/tmp/rbot-${version}.tgz",
    unless  => "which ${rbot::params::rt_working_dir}/setup.rb",
  }
  exec { 'extract-rbot':
    command => "tar zxf /tmp/rbot-${version}.tgz -C ${rbot::params::rt_base_dir}",
    creates => $rbot::params::rt_working_dir,
    require => Exec['download-rbot'],
    unless  => "which ${rbot::params::rt_working_dir}/setup.rb",
  }
}