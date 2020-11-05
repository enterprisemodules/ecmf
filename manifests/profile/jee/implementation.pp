# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
<<<<<<< HEAD:manifests/profile/web/implementation.pp
#   include ecmf::profile::web::implementation
class ecmf::profile::web::implementation {
  fail "Specify an implementation in your hiera data with key: 'ecmf::roles::web::implementation'"
=======
#   include ecmf::profile::jee::implementation
class ecmf::profile::jee::implementation {
  fail "Specify an implementation in your hiera data with key: 'ecmf::roles::jee::implementation'"
>>>>>>> [core] Add farcade classes for Oracle, WebLogic and MQ:manifests/profile/jee/implementation.pp
}
