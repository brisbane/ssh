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
) inherits ssh::params { 
  
  
  $package_list = [ 'openssh', 'openssh-clients', 'openssh-server' ]
  package { $package_list:
    ensure => installed,
  }
  ssh::sshd_config {$sshd_parameters: } 


  service { 'sshd':
    name       => 'sshd',
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe => Package['openssh'],
  }
}
