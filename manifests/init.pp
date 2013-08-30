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
  $sshd_parameters = $ssh::params::sshd_parameters
) inherits ssh::params { 
  
  class {'ssh::install' :
  }
  ssh::sshd_config {$sshd_parameters: } 
  ssh::auth_key { $authorized_keys:} 
  class {'ssh::service' :
  }


}
