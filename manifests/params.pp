class ssh::params {
  $sshd_parameters = hiera('ssh::params::sshd_parameters', 'undef')
 }
