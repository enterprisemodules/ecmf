# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::profile::database::postgres::database
class ecmf::profile::database::postgres::database(
  # Hash  $list,
  Hash[String[1], Ecmf::PostgresDatabase] $list
)
{
  $database_names = $list.keys
  if $database_names.size > 0 {
    echo {"Defining postgres databases ${database_names.join(',')}": withpath => false,}
  }
  $list.each |$db, $properties| {
    postgresql::server::db { $db:
      user     => $properties['user'],
      password => postgresql::postgresql_password($properties['user'], $properties['password']),
    }
  }
}
