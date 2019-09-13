function iswsl() {
  version=$(uname -a)
  if [[ $version =~ Microsoft ]]; then
    return
  fi

  false
}
