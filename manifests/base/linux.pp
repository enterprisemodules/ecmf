# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::base::linux
class ecmf::base::linux(
  Optional[String[1]] $sysctl = undef,
  Optional[String[1]] $before_sysctl = undef,
  Optional[String[1]] $after_sysctl = undef,
  Optional[String[1]] $limits = undef,
  Optional[String[1]] $before_limits = undef,
  Optional[String[1]] $after_limits = undef,
  Optional[String[1]] $packages = undef,
  Optional[String[1]] $before_packages = undef,
  Optional[String[1]] $after_packages = undef,
) {
  echo {"Apply ${name}": withpath => false,}
  easy_type::ordered_steps([
    ['ecmf::base::linux::sysctl', { 'implementation' => 'easy_type::profile::sysctl' }],
    ['ecmf::base::linux::limits', { 'implementation' => 'easy_type::profile::limits' }],
    ['ecmf::base::linux::packages',{ 'implementation' => 'easy_type::profile::packages' }],
  ])
}
