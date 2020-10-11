# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::roles::database::postgres
class ecmf::roles::database::postgres(
  Optional[String[1]] $base = undef,
  Optional[String[1]] $before_base = undef,
  Optional[String[1]] $after_base = undef,
  Optional[String[1]] $postgres = undef,
  Optional[String[1]] $before_postgres = undef,
  Optional[String[1]] $after_postgres = undef,
) {
  echo {"Apply ${name}": withpath => false,}
  easy_type::ordered_steps([
    'ecmf::base',
    'ecmf::profile::database::postgres'
  ])
}
