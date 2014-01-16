# Class: ssh
#
# This module manages ssh
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#

class ssh (
  $sshd_parameters = $ssh::params::sshd_parameters,
  $authorized_keys = $ssh::params::authorized_keys,
) inherits ssh::params { 
  
  include ssh::install
  include ssh::service


  ssh::sshd_config { $sshd_parameters: } 
  
  if $enable_authorized_keys {
    ssh::auth_key { $authorized_keys:}
  }
  
  if $enable_tcp_wrapper {
    include tcp_wrapper
  }
}
