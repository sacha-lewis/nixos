BASE='/home/sachalewis/.nix-profile/bin'

$BASE/xdotool getdisplaygeometry

# Get screen dimensions
SCREEN_WIDTH=$(/run/current-system/sw/bin/xdotool getdisplaygeometry | awk '{print $1}')
SCREEN_HEIGHT=$(/run/current-system/sw/bin/xdotool getdisplaygeometry | awk '{print $2}')

# Function to snap window to left half of the screen
snap_left() {
  $BASE/wmctrl -r :ACTIVE: -e 0,0,0,$(( ($SCREEN_WIDTH / 3) * 2)),$SCREEN_HEIGHT - 200
}

snap_right() {
  $BASE/wmctrl -r :ACTIVE: -e 0,$(( ($SCREEN_WIDTH / 3) * 2)),0,$(($SCREEN_WIDTH / 3)),$SCREEN_HEIGHT
}

snap_top() {
  $BASE/wmctrl -r :ACTIVE: -e 0,0,0,$SCREEN_WIDTH,$(($SCREEN_HEIGHT))
}

snap_bottom() {
  $BASE/wmctrl -r :ACTIVE: -e 0,0,$(($SCREEN_HEIGHT / 2)),$SCREEN_WIDTH,$(($SCREEN_HEIGHT / 2))
}

case "$1" in
  left)
    snap_left
    ;;
  right)
    snap_right
    ;;
  top)
    snap_top
    ;;
  bottom)
    snap_bottom
    ;;
  *)
    echo "Usage: $0 {left|right|top|bottom}"
    exit 1
    ;;
esac
