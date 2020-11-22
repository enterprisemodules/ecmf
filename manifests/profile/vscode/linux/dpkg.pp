class ecmf::profile::vscode::linux::dpkg () {
  $vscode_download_absolute_path = lookup('ecmf::profile::vscode::absolute_path')
  $vscode_download_url           = lookup('ecmf::profile::vscode::source_location')
  file { $vscode_download_absolute_path:
    ensure => present,
    source => $vscode_download_url,
  }
  #TODO: dpkg provider doesn't seem to be indepotent, we need to fix it
  package { 'Microsoft Visual Studio Code':
    ensure   => present,
    provider => dpkg,
    source   => $vscode_download_absolute_path,
    require  => [File[$vscode_download_absolute_path], Package['libnss3'], Package['libxkbfile1'], Package['libsecret-1-0'], Package['libgtk-3-0'], Package['libxss1'], Package['libgbm1']],
  }
}
