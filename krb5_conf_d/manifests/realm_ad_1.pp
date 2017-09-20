class krb5_conf_d::realm_ad_1 (
	$realm = undef,
	$admin_server_1 = undef,
	$admin_server_2 = undef,
	$kdc_1 = undef,
	$kdc_2 = undef,
	$kdc_3 = undef,
	$kpasswd_protocol = undef,
	$auth_to_local_1 = undef,
	$auth_to_local_2 = undef,
	$auth_to_local_3 = undef,
	) {

  include '::krb5_conf_d'

  if ($realm != "") {
    file { "realm_$realm.conf":
      ensure  => file,
      path    => "/etc/krb5.conf.d/realm_$realm.conf",
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('krb5_conf_d/realm.conf.erb'),
    }
  }
}
