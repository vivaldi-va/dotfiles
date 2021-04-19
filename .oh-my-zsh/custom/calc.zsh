function calc() {
  if [ $# -lt 1 ]; then
    echo "usage: $0 <expression>" >&2
  else
    echo $1 | bc
  fi
}
