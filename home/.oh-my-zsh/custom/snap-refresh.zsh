function snaprefresh() {
  sudo snap refresh --list | awk '{if(NR>1){print $1}}' | xargs -n1 killall 2> /dev/null
  sudo snap refresh
}
