class ssh::params {
  case $::osfamily {
  debian: {
    $package_list = [ 'openssh-client', 'openssh-server' ]
    $ssh_service  = 'ssh' 
   }
  redhat: {
    $package_list = [ 'openssh', 'openssh-clients', 'openssh-server' ]
    $ssh_service  = 'sshd'
   }
  default: {
    fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
   }

  }

  #This should be a hiera variable, so that we get default with overrides  behaviour
  $sshd_parameters        = hiera('ssh::params::sshd_parameters', [])
  $ssh_parameters         = hiera_hash('ssh::params::ssh_parameters', { })
                                       
  $enable_authorized_keys = hiera('ssh::params::enable_authorized_keys', true)
  #This should be a hiera array variable, so that we get default with additions  behaviour
  $authorized_keys        = hiera_array('ssh::params::authorized_keys', [] )
  
  # Enable or disable tcp_wrapper
  $enable_tcp_wrapper     = hiera ('ssh::params::enable_tcp_wrapper', true)
  $allow                  = hiera_hash ('ssh::params::tcp_wrapper_allow', {})
  $deny                   = hiera ('ssh::params::tcp_wrapper_deny', {}) 
  
}
