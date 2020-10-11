# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::roles::web::apache
class ecmf::roles::web::apache(
  Optional[String[1]] $base = undef,
  Optional[String[1]] $before_base = undef,
  Optional[String[1]] $after_base = undef,
  Optional[String[1]] $apache = undef,
  Optional[String[1]] $before_apache = undef,
  Optional[String[1]] $after_apache = undef,
) {
  echo {"Apply ${name}": withpath => false,}
  easy_type::ordered_steps([
    'ecmf::base',
    'ecmf::profile::web::apache'
  ])
}
