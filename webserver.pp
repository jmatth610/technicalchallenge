# Puppet manifest to install and configure Apache web server
node 'webserver' {
  # Ensure Apache package is installed
  package { 'apache2':
    ensure => installed,
  }

  # Ensure Apache service is running and enabled at boot
  service { 'apache2':
    ensure => running,
    enable => true,
    require => Package['apache2'],
  }

  # Ensure the default index.html file is present
  file { '/var/www/html/index.html':
    ensure  => file,
    content => '<html><body><h1>Hello, Puppet!</h1></body></html>',
    require => Package['apache2'],
  }
}

