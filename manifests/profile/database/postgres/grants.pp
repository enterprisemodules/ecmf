# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ecmf::profile::database::postgres::grants
class ecmf::profile::database::postgres::grants(
  Hash[String[1], Ecmf::PostgresGrant] $list
)
{
  easy_type::debug_evaluation()

  $grants = $list.keys
  if $grants.size > 0 {
    echo {"Defining postgres grants ${grants.join(', ')}": withpath => false,}
  }
  $list.each |$name, $properties| {
    $entry    = $name.split('@')
    $role     = $entry[0]
    $database = $entry[1]
    postgresql::server::database_grant { $name:
      privilege => $properties['privilege'],
      db        => $database,
      role      => $role,
    }
  }
}
