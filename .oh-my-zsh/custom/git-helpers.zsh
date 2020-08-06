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

function puf() {
  git pull -r && git fetch --prune
}


function cmgraph() {
  git log --author="Zaccary Price" --author="vivaldi-va" --format="%ad" --date="format:%H"|awk '{n=$1+0;if(H[n]++>max)max=H[n]}END{for(i=0;i<24;i++){printf"%02d -%5d ",i,H[i];for(n=0;n<H[i]/max*50;n++){printf "*"}print""}}'
}
