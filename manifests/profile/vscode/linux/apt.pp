class ecmf::profile::vscode::linux::apt(){
  apt::source { 'vscode':
    location => 'https://packages.microsoft.com/repos/code',
    release  => 'stable',
    repos    => 'main',
    include  => {
      'deb' => true,
    },
  }
  package { 'code':
    ensure   => present,
    provider => apt,
    require  => Apt::Source['vscode'],
  }
}
