class ecmf::profile::vscode::windows (
  Boolean                              $create_desktop_icon           = true, # for windows installer only
  Boolean                              $create_quick_launch_icon      = true, # for windows installer only
  Boolean                              $create_context_menu_files     = true, # for windows installer only
  Boolean                              $create_context_menu_folders   = true, # for windows installer only
  Boolean                              $add_to_path                   = true, # for windows installer only
  String                               $color_theme                   = 'Monokai Dimmed',
  String                               $icon_theme                    = 'vs-seti',
)
{
  $vscode_download_absolute_path = lookup('ecmf::profile::vscode::absolute_path')
  $vscode_download_url           = lookup('ecmf::profile::vscode::source_location')
  class { 'vscode':
    package_ensure                => 'present',
    vscode_download_url           => $vscode_download_url,
    vscode_download_absolute_path => $vscode_download_absolute_path,
    create_desktop_icon           => $create_desktop_icon,
    create_quick_launch_icon      => $create_quick_launch_icon,
    create_context_menu_files     => $create_context_menu_files,
    create_context_menu_folders   => $create_context_menu_folders,
    add_to_path                   => $add_to_path,
    icon_theme                    => $icon_theme,
    color_theme                   => $color_theme,
  }
}
