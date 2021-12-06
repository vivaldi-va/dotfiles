function mkdircd() {
  DIR_PATH=$1
  mkdir -p ${DIR_PATH} && cd $_
}
