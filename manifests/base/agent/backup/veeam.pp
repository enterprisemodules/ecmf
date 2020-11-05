# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::base::agent::backup::veeam
class ecmf::base::agent::backup::veeam(
) {
  echo {"Apply ${name}": withpath => false,}

  easy_type::debug_evaluation()

  class { 'veeamagent': }
}
