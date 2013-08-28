# ssh #

ssh module edit sshd_config file through augeas. sshd parameters can be passed through hiera like this

ssh::params::sshd_parameters:
- 'PasswordAuthentication yes'
- 'PermitEmptyPasswords yes'


