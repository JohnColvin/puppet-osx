# Public: Sets whether widowns are minimized to the application icon,
# or to the right hand side of the dock.
#
# Examples
#
#   # Set minimize-to-icon to true
#   include osx::dock::minimize-to-icon
#
#


class osx::dock::minimize-to-icon ($minimize-to-icon = 'true'){
  include osx::dock

  boxen::osx_defaults { 'minimize-to-icon':
    domain => 'com.apple.dock',
    key    => 'minimize-to-icon',
    type   => 'boolean',
    value  => '$minimize-to-icon',
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }

}
