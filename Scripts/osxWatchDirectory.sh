#/bin/bash

if [  $# -lt 2 ]; then
  echo "Usage: \n \
    $0 <path> <command>" >&2
fi

fswatch -0 -or $1 | xargs -0 -n 1 -I {} $2
