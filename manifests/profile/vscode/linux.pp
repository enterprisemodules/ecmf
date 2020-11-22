class ecmf::profile::vscode::linux(
    Enum['dpkg','apt']                   $provider = 'apt',
)
{
  case $provider{
    'dpkg': {
      class { 'ecmf::profile::vscode::linux::dpkg':}
    }
    'apt': {
      class { 'ecmf::profile::vscode::linux::gpg_key':}
      class { 'ecmf::profile::vscode::linux::apt':}
    }
  }
}
