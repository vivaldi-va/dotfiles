# https://github.com/dylanaraps/pure-bash-bible#run-a-command-in-the-background
#
function bkr() {
  (nohup "$@" &>/dev/null &)
}
