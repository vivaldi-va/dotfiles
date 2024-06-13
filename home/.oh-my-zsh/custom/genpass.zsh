function genpass() {
  if [  $# -lt 1 ]; then
    echo "Usage: \n \
      $0 <charlen>" >&2
    exit
  fi

  tr -dc A-Za-z0-9 </dev/urandom | head -c $1; echo
}
