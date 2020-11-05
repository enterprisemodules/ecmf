# @summary This is a farcade class for wls_profile
#
# When selecting weblogic as your ecmf jee implementation,
# we start using wls_profile for ensuring the state of the weblogic
# domain.
#
# @example
#   include ecmf::profile::jee::weblogic
#
class ecmf::profile::jee::weblogic()
{
  require ::wls_profile::admin_server
}
