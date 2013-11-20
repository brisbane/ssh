class ssh::tcp_wrapper inherits ssh::params {
  
  

file { '/etc/hosts.allow':
      path    => '/etc/hosts.allow',
      ensure  => present,
      content  => template("ssh/hosts.allow.erb"),

      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }
file { '/etc/hosts.deny':
      path    => '/etc/hosts.deny',
      ensure  => present,
      content  => template("ssh/hosts.deny.erb"),

      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }
}
  
  
