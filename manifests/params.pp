class ssh::params {
  $sshd_parameters = hiera('ssh::params::sshd_parameters', 'undef')
#  $enable_authorized_keys = hiera('ssh::params::enable_authorized_keys', true)
  $authorized_keys = hiera('ssh::params::authorized_keys', 'undef')
 }
