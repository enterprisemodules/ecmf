# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::roles::monitoring::zabbix_server
class ecmf::roles::monitoring::zabbix_server(
  Optional[String[1]] $base = undef,
  Optional[String[1]] $before_base = undef,
  Optional[String[1]] $after_base = undef,
  Optional[String[1]] $zabbix = undef,
  Optional[String[1]] $before_zabbix = undef,
  Optional[String[1]] $after_zabbix = undef,
) {
  echo {"Apply ${name}": withpath => false,}
  easy_type::staged_contain([
    'ecmf::base',
    'ecmf::profile::monitoring::zabbix'
  ])
}
