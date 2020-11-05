# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
<<<<<<< HEAD:manifests/profile/identity/implementation.pp
#   include ecmf::profile::identity::implementation
class ecmf::profile::identity::implementation {
  fail "Specify an implementation in your hiera data with key: 'ecmf::roles::identity::implementation'"
=======
#   include ecmf::base::client::patching
class ecmf::base::agent::patching {
  warning "Specify an implementation in your hiera data with key: 'ecmf::base::generic::patching'"
>>>>>>> [core] Add farcade classes for Oracle, WebLogic and MQ:manifests/base/agent/patching.pp
}
