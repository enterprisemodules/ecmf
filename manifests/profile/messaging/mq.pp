# @summary This is a farcade class for ibm_profile::mq_machine
#
# When selecting MQ as your ecmf messaging implementation,
# we start using ibm_profile for ensuring the state of the MQ
# messaging.
#
#
# @example
#   include ecmf::profile::messaging::mq
#
class ecmf::profile::messaging::mq()
{
  require ::ibm_profile::mq_machine
}
