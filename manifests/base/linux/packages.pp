# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::base::linux::packages
class ecmf::base::linux::packages {
  echo {"Apply ${name}": withpath => false,}
}
