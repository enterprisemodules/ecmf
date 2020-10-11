# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::base::generic
class ecmf::base::generic(
  Optional[String[1]] $monitoring = undef,
  Optional[String[1]] $before_monitoring = undef,
  Optional[String[1]] $after_monitoring = undef,
  Optional[String[1]] $backup = undef,
  Optional[String[1]] $before_backup = undef,
  Optional[String[1]] $after_backup = undef,
  Optional[String[1]] $patching = undef,
  Optional[String[1]] $before_patching = undef,
  Optional[String[1]] $after_patching = undef,
) {
  echo {"Apply ${name}": withpath => false,}
  easy_type::ordered_steps([
    'ecmf::base::client::monitoring',
    'ecmf::base::client::backup',
    'ecmf::base::client::patching',
  ])
}
