# checkout a remote branch
# e.g.
# `cr feature/foo`
function cr() {
  if [  $# -lt 1 ]; then
    echo "Usage: \n \
      $0 <branch name>" >&2
  else
    branch=$1

    git fetch --prune && \
    git checkout -b ${branch} origin/${branch}
  fi
}
