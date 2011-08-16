# RBot Module

James Fryman <james@frymanet.com>

This module manages RBot from within Puppet.

# Quick Start

Install and bootstrap an RBot instance

# Requirements

Ruby Management Module 
- http://github.com/jfryman/puppet-rvm
- http://github.com/jfryman/puppet-ruby
Puppet Labs Standard Library
- http://github.com/puppetlabs/puppetlabs-stdlib

<pre>
  class { 'rbot':
    nickname => 'juicebox',
    servers  => ['irc.frymanet.com'],
    ident    => 'rbot',
    channels => ['#chat'],
   }
</pre>
