function diff() {
  if [ $# -lt 2 ]; then
    echo "usage: $0 file1 file2" >&2
  else
    git diff --no-index $1 $2
  fi
}
