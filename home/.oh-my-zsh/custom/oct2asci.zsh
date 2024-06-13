function oct2txt() {
  echo $1 | sed 's/ //g' | perl -lpe '$_=pack"B*",$_'
}

function txt2oct() {
  echo $1 | perl -lpe '$_=join " ", unpack"(B8)*"'
}
