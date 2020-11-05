# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
<<<<<<< HEAD:manifests/base/windows.pp
#   include ecmf::base::windows
class ecmf::base::windows {
=======
#   include ecmf::base::agent::backup::veeam
class ecmf::base::agent::backup::veeam(
) {
>>>>>>> [core] Add farcade classes for Oracle, WebLogic and MQ:manifests/base/agent/backup/veeam.pp
  echo {"Apply ${name}": withpath => false,}

  easy_type::debug_evaluation()

  class { 'veeamagent': }
}
