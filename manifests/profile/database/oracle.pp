# @summary This is a farcade class for ora profile
#
# When selecting Oracle as your ecmf database implementation,
# we start using ora_profile for ensuring the state of the Oracle
# database.
#
# When you pass `secured` is `true`, The secured database class
# will be applied. Implying that all of the CIS rules while be enforced as
# well
#
# @example
#   include ecmf::profile::database::oracle
#
class ecmf::profile::database::oracle(
  Boolean $secured = false,
)
{
  if $secured {
    require ::ora_profile::secured_database
  } else {
    require ::ora_profile::database
  }
}
