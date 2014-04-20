# Public: Sets the dock magnification
#
# magnification - 'yes' 'no'
# magnification-size 16-128
#
# Examples
#
#   # Set magnification to true, with large icons at 128px
#   include osx::dock::magnification
#
#   # ...or set it to customize it!
#   class { 'osx::dock::magnification':
#     magnification => 'true|false'
#     magnification-size => 16-128
#   }
#
#


class osx::dock::magnification ($magnification = 'true', $magnification-size ='128'){
  include osx::dock

  boxen::osx_defaults { 'magnification':
    domain => 'com.apple.dock',
    key    => 'magnification',
    type   => 'boolean',
    value  => '$magnification',
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
  
    boxen::osx_defaults { 'magnification-size':
    domain => 'com.apple.dock',
    key    => 'largesize',
    type   => 'int',
    value  => $magnification-size,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }

}