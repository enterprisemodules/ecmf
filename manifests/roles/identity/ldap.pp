# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::roles::identity::ldap
class ecmf::roles::identity::ldap(
  Optional[String[1]] $base = undef,
  Optional[String[1]] $before_base = undef,
  Optional[String[1]] $after_base = undef,
  Optional[String[1]] $ldap = undef,
  Optional[String[1]] $before_ldap = undef,
  Optional[String[1]] $after_ldap = undef,
) {
  echo {"Apply ${name}": withpath => false,}
  easy_type::ordered_steps([
    'ecmf::base',
    'ecmf::profile::identity::ldap'
  ])
}
