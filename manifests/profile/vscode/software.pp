# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::profile::database::postgres::software

#TODO: move windows arguments to windows class, and the same with debian
class ecmf::profile::vscode::software(){

  notify{"os":
    message => "${facts['os']['family']}",
  }
  case $facts['os']['family'] {
    'Windows': {
        class { 'ecmf::profile::vscode::windows':}
    }
    'Debian': {
        class { 'ecmf::profile::vscode::linux':}
    }
    default: {
      notify { 'OS not supported': }
    }
  }

}
