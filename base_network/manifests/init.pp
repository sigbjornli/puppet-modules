# == Class: base_network
#
# Full description of class base_network here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'base_network':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class base_network (
	$ensure = "up",
	$if,
	$macaddress,
	$static = true,
	$bond = false,
	$bridge = false,
	$netmask,
	$gateway,
	$ipv6init = false,
	$ipaddress,
	$netmask,
	$gateway,	
	$mtu = "1500",
	$ethtool_opts = "",
	$dns1,
	$dns2,
	$peerdns = true,
	$restart = false,
	$do_notify  = "Class['resolv_conf']",
	) {

  if (($static == true) and ($bond == false) and ($bridge == false) and ($if != "") and ($macaddress != "")) {

    network::if::static { "$if":
	  ensure       => $ensure,
	  ipaddress    => $ipaddress,
	  netmask      => $netmask,
	  gateway      => $gateway,
	  macaddress   => $macaddress,
	  dns1	       => $dns1,
	  dns2	       => $dns2,
	  peerdns      => $peerdns,
	  ipv6init     => $ipv6init,
	  mtu          => $mtu,
	  ethtool_opts => $ethtool_opts,
	  restart      => $restart,
	  notify       => $do_notify,

    }


  }

  class { 'network::global':
    restart => $restart,
    requestreopen => true,
  }


}

