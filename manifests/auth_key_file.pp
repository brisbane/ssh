class auth_key_file {
  
       @concat {'/root/.ssh/authorized_keys':
            owner => root,
            group => root,
             mode  => '0644',
            }
  }
