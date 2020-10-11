# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::roles::database::mysql
class ecmf::roles::database::mysql(
  Optional[String[1]] $base = undef,
  Optional[String[1]] $before_base = undef,
  Optional[String[1]] $after_base = undef,
  Optional[String[1]] $mysql = undef,
  Optional[String[1]] $before_mysql = undef,
  Optional[String[1]] $after_mysql = undef,
) {
  echo {"Apply ${name}": withpath => false,}
  easy_type::ordered_steps([
    'ecmf::base',
    'ecmf::profile::database::mysql'
  ])
}
