function vims() {
  local dir="$HOME/.nvim/session/${PWD##*/}/Session.vim"
  [ -r "$dir" ] && nvim -S "$dir" || nvim "$@"
}
