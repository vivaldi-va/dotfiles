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


# push a new branch to remote
# alias of `git push -u origin <branch-name>`
function pn() {
  branch=$(git rev-parse --abbrev-ref HEAD)
  git push -u origin ${branch} && \
    echo "pushed ${branch} to origin"
}
