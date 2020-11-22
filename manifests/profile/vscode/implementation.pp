# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::profile::database::postgres
class ecmf::profile::vscode::implementation(
  Optional[String[1]] $sysctl = undef,
  Optional[String[1]] $before_sysctl = undef,
  Optional[String[1]] $after_sysctl = undef,
  Optional[String[1]] $limits = undef,
  Optional[String[1]] $before_limits = undef,
  Optional[String[1]] $after_limits = undef,
  Optional[String[1]] $packages = undef,
  Optional[String[1]] $before_packages = undef,
  Optional[String[1]] $after_packages = undef,
  Optional[String[1]] $firewall = undef,
  Optional[String[1]] $before_firewall = undef,
  Optional[String[1]] $after_firewall = undef,
  Optional[String[1]] $software = undef,
  Optional[String[1]] $before_software = undef,
  Optional[String[1]] $after_software = undef,
  Optional[String[1]] $databases = undef,
  Optional[String[1]] $before_databases = undef,
  Optional[String[1]] $after_databases = undef,
  Optional[String[1]] $roles = undef,
  Optional[String[1]] $before_roles = undef,
  Optional[String[1]] $after_roles = undef,
  Optional[String[1]] $grants = undef,
  Optional[String[1]] $before_grants = undef,
  Optional[String[1]] $after_grants = undef,
){
  easy_type::debug_evaluation()

  echo {"Apply ${name}": withpath => false,}
  if $facts['os']['family'] != 'Windows' {
    easy_type::ordered_steps([
      ['ecmf::profile::vscode::packages', {'implementation' => 'easy_type::profile::packages'}],
      'ecmf::profile::vscode::software',
    ])
  } else {
    easy_type::ordered_steps([
      'ecmf::profile::vscode::software',
    ])
  }
}
