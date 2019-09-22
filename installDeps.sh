#!/bin/bash

source ./Scripts/getDistro.sh
machine=$(./Scripts/machine.sh)

if [[ $OS == 'Arch Linux' ]]; then
  sh -c "$(./archDependencies.sh)"
fi

if [[ $OS == 'Ubuntu' ]]; then
  sh -c "$(./ubuntuDependencies.sh)"
fi

if [ $machine = "Mac" ]; then
  sh -c "$(./macDependencies.sh)"
fi
