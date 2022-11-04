function womaximp() {
  calc "$1*0.77+23"
}

function wooptdiff() {
  if [  $# -lt 2 ]; then
    echo "Usage: \n \
      $0 <skill> <tool quality>" >&2
  fi
  calc "($1+$2)/2-20"
}
