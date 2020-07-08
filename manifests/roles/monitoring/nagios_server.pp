# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::roles::monitoring::nagios_server
class ecmf::roles::monitoring::nagios_server(
  Optional[String[1]] $base = undef,
  Optional[String[1]] $before_base = undef,
  Optional[String[1]] $after_base = undef,
  Optional[String[1]] $nagios = undef,
  Optional[String[1]] $before_nagios = undef,
  Optional[String[1]] $after_nagios = undef,
) {
  echo {"Apply ${name}": withpath => false,}
  easy_type::staged_contain([
    'ecmf::base',
    'ecmf::profile::monitoring::nagios'
  ])
}
