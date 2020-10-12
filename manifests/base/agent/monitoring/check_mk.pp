# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::base::agent::monitoring::check_mk
class ecmf::base::agent::monitoring::check_mk(
  String[1] $filestore,
  String[1] $package,
) {
  echo {"Apply ${name}": withpath => false,}

  easy_type::debug_evaluation()

  class { 'check_mk':
    filestore => $filestore,
    package   => $package,
  }
}
