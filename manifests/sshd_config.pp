define ssh::sshd_config ($ssh_service = $ssh::params::ssh_service) {
  if $name != 'undef' { 
  augeas { $name:
     context => "/files/etc/ssh/sshd_config",
     changes => "set  $name last()+1",
     notify  => Service[$ssh_service],
  }
 }
}
