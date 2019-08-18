#!/bin/bash

machine=$(./Scripts/machine.sh)

if [ $machine = "Linux" ]; then
  sh -c "$(./archDependencies.sh)"
fi

if [ $machine = "Mac" ]; then
  sh -c "$(./macDependencies.sh)"
fi
