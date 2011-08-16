class rbot(
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
  include stdlib
  include rbot::params
  
  ## Establish Defaults
  ## This whole thing could be redone with a Puppet Ruby DSL command
  ## and some metaprogramming - JDF (20110815)
  if $version == '' {
    $REAL_version = $rbot::params::rt_version
  } else {
    $REAL_version = $version
  } 
  if $auth_password == '' {
    $REAL_auth_password = $rbot::params::rt_bot_auth_password
  } else {
    $REAL_auth_password = $auth_password
  }
  if $reply_with_nick == '' {
    $REAL_reply_with_nick = $rbot::params::rt_reply_with_nick
  } else {
    $REAL_reply_with_nick = $reply_with_nick
  }
  if $address_prefix == '' {
    $REAL_address_prefix = $rbot::params::rt_bot_address_prefix
  } else {
    $REAL_address_prefix = $address_prefix
  }
  if $nick_postfix == '' {
    $REAL_nick_postfix = $rbot::params::rt_bot_nick_postfix
  } else {
    $REAL_nick_postfix = $nick_postfix
  }
  if $core_language == '' {
    $REAL_core_language = $rbot::params::rt_bot_core_language
  } else {
    $REAL_core_langauge = $core_language
  }

  ### Begin Logic
  class { 'ruby': } 
  -> anchor { 'rbot::begin': } 
  -> class { 'rbot::package': 
       version => $REAL_version,
     } 
  -> class { 'rbot::config': 
       auth_password   => $REAL_auth_password,
       reply_with_nick => $REAL_reply_with_nick,
       address_prefix  => $REAL_address_prefix,
       nick_postfix    => $REAL_nick_postfix,
       core_language   => $REAL_core_language,
       ssl             => $ssl,
       irc_password    => $irc_password,
       bind_host       => $bind_host,
       servers         => $servers,
       channels        => $channels,
       nickname        => $nickname,
       ident           => $ident,
       plugin_dir      => $plugin_dir,
     }
  -> class { 'rbot::service': }
  -> anchor { 'rbot::end': }
}