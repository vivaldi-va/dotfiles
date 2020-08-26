function diff() {
  if [ $# -lt 2 ]; then
    echo "Usage: \n \
      $0 file1 file2" >&2
    exit 1
  fi

  git diff --no-index $1 $2
}
