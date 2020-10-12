# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::profile::database::postgres::software
class ecmf::profile::database::postgres::software()
{
  easy_type::debug_evaluation()

  echo {"Apply ${name}": withpath => false,}

  class { 'postgresql::server':
    encoding => 'UTF-8',
  }
}
