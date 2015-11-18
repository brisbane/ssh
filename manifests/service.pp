class ssh::service () inherits ssh::params 
{
  service { $ssh_service:
    name       => $ssh_service,
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => Package['openssh-server'],
  }
}
