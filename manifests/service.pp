class sshd::service () inherits ssh::params
{
  service { 'sshd':
    name       => 'sshd',
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe => Package['openssh'],
  }

