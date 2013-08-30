class ssh::install{

  $package_list = [ 'openssh', 'openssh-clients', 'openssh-server' ]
  package { $package_list:
    ensure => installed,
  }
}
