class krb5_conf_d::libdefaults (
	$configure = true,
	$config_file = "libdefaults.conf",
	$dns_lookup_realm = true,
	$dns_lookup_kdc = true,
	$rdns = undef,
	$dns_canonicalize_hostname = true,
	$ticket_lifetime = undef,
	$renew_lifetime = undef,
	$udp_preference_limit = undef,
	$allow_weak_crypto = undef,
	) {

  include '::krb5_conf_d'

  if ($configure == true) {
    file { "libdefaults.conf":
      ensure  => file,
      path    => "/etc/krb5.conf.d/$config_file",
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('krb5_conf_d/libdefaults.conf.erb'),
    }
  }
}
