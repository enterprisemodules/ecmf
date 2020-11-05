# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::base::client::monitoring::zabbix
class ecmf::base::agent::monitoring::zabbix(
  Optional[String[1]] $server
) {
  easy_type::debug_evaluation()
  if $server == undef {
    warning('No zabbix server configured. Skipping installation of zabbix agent.')
  } else {
    echo {"Apply ${name}": withpath => false,}

    class { 'zabbix::agent':
      server => $server,
    }

  }

}
