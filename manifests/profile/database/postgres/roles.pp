# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::profile::database::postgres::roles
class ecmf::profile::database::postgres::roles(
  Hash[String[1], Ecmf::PostgresRole] $list
)
{
  easy_type::debug_evaluation()

  $roles = $list.keys
  if $roles.size > 0 {
    echo {"Defining postgres roles ${roles.join(', ')}": withpath => false,}
  }
  $list.each |$name, $properties| {
    postgresql::server::role { $name:
      password_hash => postgresql::postgresql_password($name, $properties['password']),
    }
    # postgresql::server::database_grant { $name:
    #   privilege => $properties['privilege'],
    #   db        => $database,
    #   role      => $user,
    # }
  }
}
