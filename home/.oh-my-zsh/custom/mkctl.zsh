zmodload zsh/zutil

function mkgp() {
  zparseopts -D -E -F -A opts - \
    h=help -help=help \
    n:=namespace -namespace:=namespace \
    r:=resource -resource:=resource \
    l:=label -label:=label \
    || return 1

  local mkctlEx="microk8s kubectl"
  local namespace="${namespace[-1]:-\"default\"}"
  local resource="${resource[-1]:-pod}"
  local label=""
  local describe=(
    "microk8s kubectl helper to get a \"describe\" for a defined resource in a namespace"
  )
  local usage=(
    "Usage (defaults shown):"
    "\tmkgp [-h|--help]"
    "\tmkgp [-r|--resource pod] [-n|--namespace default] -l|--label"
  )
  local man=(
    "Options:"
    "\t-l --label\n\t\t(required) label to select defined resource"
    "\t-n --namespace\n\t\tresource namespace"
    "\t-r --resource\n\t\tresource type, e.g. pod,svc,deploy,etc."
  )



  if (( $# )); then
    rmidx=$@[(i)(--|-)]
    if [[ -n ${invalid_opt::=${(M)@[0,rmidx-1]#-}} ]]; then
      echo >&2 "Invalid options: $invalid_opt"
      return 1
    fi
    set -- "${@[0,rmidx-1]}" "${@[rmidx+1,-1]}"
  fi

  if (( $#help )); then
    print "${describe}"
    print ""
    print -l $usage
    print -l $man
    return 0
  fi

  if (( !$#label )); then
    echo >&2 "label is required"
    print -l $usage
    return 1
  fi

  local resource_result=$(kubectl -n ${namespace} get ${resource} -l ${opts[-l]} --no-headers -o name|cut -d/ -f2|head -1)

  if [[ -z $resource_result ]]; then
    echo >&2 "no resource of type '${resource}' found in namespace: '${namespace}' with label: '${opts[-l]}'"
    return 1
  fi

  microk8s kubectl -n "${namespace}" describe ${resource} ${resource_result}
}
