# Public: Minimize your windows to the application icon, rather than to the
# right hand side of the dock
#
# Examples
#
#   # Set minimize_to_icon to true
#   include osx::dock::minimize_to_icon
#
#


class osx::dock::minimize_to_icon ($minimize_to_icon = true){
  include osx::dock

  boxen::osx_defaults { 'minimize_to_icon':
    domain => 'com.apple.dock',
    key    => 'minimize_to_icon',
    type   => 'bool',
    value  => $minimize-to-icon,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }

}
