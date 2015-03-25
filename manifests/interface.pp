# Allow interface
define ufw::interface($to='any') {

  exec { "ufw-allow-${name}":
    command  => "ufw allow in on ${name} to ${to}",
    path     => '/usr/sbin:/bin:/usr/bin',
    provider => 'posix',
    unless   => "ufw status | grep -qE '^Anywhere on ${name}",
    require  => Exec['ufw-default-deny'],
    before   => Exec['ufw-enable'],
  }
}
