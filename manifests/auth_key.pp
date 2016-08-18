define ssh::auth_key($content="", $order=10) {
  
  if $name != 'undef' {
  include ssh::auth_key_file
  realize Concat['/root/.ssh/authorized_keys']
        concat::fragment{"$name":
          target  => "/root/.ssh/authorized_keys",
          source => "puppet:///$site_files/$name",
#          source => "puppet:///modules/serve_files/$name",
        }
      }
  
}
