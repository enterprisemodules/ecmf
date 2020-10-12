# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::profile::database::postgres::users
class ecmf::profile::database::postgres::users(
  Hash[String[1], Ecmf::PostgresUser] $list
)
{
  $users = $list.keys
  if $users.size > 0 {
    echo {"Defining postgres users ${users.join(',')}": withpath => false,}
  }
  $list.each |$name, $properties| {
    $elements = $name.split('@')
    $user     = $elements[0]
    $database = $elements[1]

    postgresql::server::role { $user:
      password_hash => postgresql::postgresql_password($name, $properties['password']),
    }

    postgresql::server::database_grant { $name:
      privilege => $properties['privilege'],
      db        => $database,
      role      => $user,
    }
  }
}
