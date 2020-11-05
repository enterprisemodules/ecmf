# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::base
class ecmf::base {
  echo {"Apply ${name}": withpath => false,}
  case $::kernel {
    'Linux':   { require ::ecmf::base::linux }
    'Windows': { require ::ecmf::base::windows }
    default:   { fail "${::kernel} not (yet) supported by ecmf."}
  }
  require ::ecmf::base::generic
}
