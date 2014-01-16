define ssh::ssh_config::hostparam ($host) {
  if $name != 'undef' {
  $changes = "set  Host[.='$host']/$name" 
 # notify {"$changes": }
  augeas { $name:
     context => "/files/etc/ssh/ssh_config",
     changes => "$changes",
  }
 }
}

define ssh::ssh_config::host($configs) {

#  notify { "Item ${name} has configs ${configs[$name]} ":}
  augeas { $name:
     context => "/files/etc/ssh/ssh_config",
     changes => "set Host[last() + 1] $name",
      onlyif    => "match Host[.='$name'] size == 0",

  }

  ssh::ssh_config::hostparam { $configs[$name]: host=>$name }  

}

class ssh::ssh_config ( $ssh_parameters = $ssh::params::ssh_parameters) inherits ssh::params{

# Expect parameters in the form 
#  $hash = {
#    "somewhere" => {configs=> [ 'GSSAPIKeyExchange no' , ]}                       
#  }

 # notify { $ssh_parameters : } 
 # $hashDefaults = {
 #   configs => []
 # }

  #Can also do this with create_resources, sort of, but need an extra hiera_hash
  $keyscsv = inline_template("<%= ssh_parameters.keys.join(',') %>")
  $keys = split ($keyscsv, ',' )
  #notify { "$keys are keys": }
  ssh::ssh_config::host {$keys :configs=>  $ssh_parameters}

#  create_resources(ssh::ssh_config::host, $ssh_parameters, $hashDefaults)

}

