# Loads Xresources dotfile on boot, mainly for URxvt transparency etc.
xrdb -load ~/.Xresources &

# -R restores the last colorscheme that was in use.
wal -R
