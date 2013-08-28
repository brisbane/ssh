define ssh::sshd_config {
  if $name != 'undef' { 
  augeas { $name:
     context => "/files/etc/ssh/sshd_config",
     changes => "set  $name last()+1",
     notify  => Service["sshd"],
  }
 }
}
