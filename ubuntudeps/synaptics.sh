sudo bash -c 'cat << EOF > /usr/share/X11/xorg.conf.d/50-synaptics.conf
Section "InputClass"
    Identifier "touchpad catchall"
    Driver "synaptics"
    MatchIsTouchpad "on"
    MatchDevicePath "/dev/input/event*"
    Option "TapButton1" "1"
    Option "TapButton2" "2"
    Option "TapButton3" "3"
    Option "HorizTwoFingerScroll" "on"
    Option "VertTwoFingerScroll" "on"
    Option "PalmDetect" "1"
    Option "PalmMinWidth" "4"
    Option "PalmMinZ" "75"
EndSection
EOF'
