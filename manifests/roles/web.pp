# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::roles::web
class ecmf::roles::web(
  Optional[String[1]] $base = undef,
  Optional[String[1]] $before_base = undef,
  Optional[String[1]] $after_base = undef,
  Optional[String[1]] $implementation = undef,
  Optional[String[1]] $before_implementation = undef,
  Optional[String[1]] $after_implementation = undef,
) {
  echo {"Apply ${name}": withpath => false,}
  easy_type::ordered_steps([
    'ecmf::base',
    'ecmf::profile::web::implementation'
  ])
}
