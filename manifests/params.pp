class rbot::params {
  $rt_base_dir     = '/opt'
  $rt_version      = '0.9.15' 
  $rt_working_dir  = "${rt_base_dir}/rbot-${rt_version}"
  $rt_uid          = 'rbot'
  $rt_gid          = 'rbot'
  $rt_homedir      = "/home/${rt_uid}"
  
  # RBot Defaults
  $rt_bot_auth_password   = 'rbotauth'
  $rt_bot_reply_with_nick = 'false'
  $rt_bot_address_prefix  = '!'
  $rt_bot_nick_postfix    = ':'
  $rt_bot_core_language   = 'english'
  $rt_plugin_dir          = ['(default)', '(default)/games', '(default)/contrib']
  $rt_bot_ssl             = 'false'
}