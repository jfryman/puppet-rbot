class rbot::config(
  $version         = '',
  $auth_password   = '', 
  $reply_with_nick = '',
  $address_prefix  = '',
  $nick_postfix    = '',
  $core_language   = '',
  $ssl             = '',
  $irc_password    = '',
  $bind_host       = '',
  $plugin_dir      = '',
  $servers,
  $nickname,
  $ident,
  $channels
) {
    
  File {
    owner  => $rbot::params::rt_uid,
    group  => $rbot::params::rt_gid,    
  }
  ## TODO: This stuff should really be moved into LDAP
  ## JDF (20110812)
  user { $rbot::params::rt_uid:
    ensure     => present,
    comment    => 'RBot Service Account',
    uid        => '999',
    gid        => '999',
    shell      => '/bin/bash',
    managehome => 'true',
  }
  group { $rbot::params::rt_gid:
    ensure => 'present',
    gid    => '999',
  }
  file { "${rbot::params::rt_homedir}/.rbot":
    ensure => directory,
  }
  file { "${rbot::params::rt_homedir}/.rbot/conf.yaml.SEED":
    ensure  => file,
    content => template('rbot/conf.yaml.erb'),
  }
  file { '/etc/init.d/rbot':
    ensure  => file,
    mode    => '0755',
    content => template('rbot/rbot-init.erb'),
  }
  exec { 'seed-rbot-config':
    command => "cp ${rbot::params::rt_homedir}/.rbot/conf.yaml.SEED ${rbot::params::rt_homedir}/.rbot/conf.yaml",
    path    => "/bin:/sbin:/usr/bin:/usr/sbin",
    creates => "${rbot::params::rt_homedir}/.rbot/conf.yaml",
    require => File["${rbot::params::rt_homedir}/.rbot/conf.yaml.SEED"],
  }
}