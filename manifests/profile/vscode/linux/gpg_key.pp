class ecmf::profile::vscode::linux::gpg_key(
    Enum['dpkg','apt']                   $provider = 'apt',
)
{
  case $provider {
    'apt': {
      $tmp_dir = lookup('ecmf::profile::vscode::tmp_dir')
      $microsoft_gpg_key_path= lookup('ecmf::profile::vscode::gpg_key::microsoft_gpg_key_path')
      file {"${tmp_dir}/microsoft.asc":
        ensure => present,
        source => lookup('ecmf::profile::vscode::gpg_key::source'),
      }
      #TODO: make this exec indepotent, and add cleanup after
      exec{'dearmor key':
        path    => '/bin',
        command => "gpg --dearmor ${tmp_dir}/microsoft.asc",
        require => File["${tmp_dir}/microsoft.asc"],
      }
      file {$microsoft_gpg_key_path:
        ensure => present,
        owner  => 'root',
        mode   => '0644',
        source => "${tmp_dir}/microsoft.asc.gpg",
      }
    }
  }
}
