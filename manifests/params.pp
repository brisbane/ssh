class ssh::params {
  #This should be a hiera variable, so that we get default with overrides  behaviour
  $sshd_parameters = hiera('ssh::params::sshd_parameters', 'undef')
  #This should be a hiera array variable, so that we get default with additions  behaviour
  $authorized_keys = hiera_array('ssh::params::authorized_keys', [] )
}
