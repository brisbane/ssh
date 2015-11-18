class ssh::install () inherits ssh::params {

  package { $package_list:
    ensure => installed,
  }
}
