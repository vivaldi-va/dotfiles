#!/bin/bash

while inotifywait -e modify,create,delete,move -r $1; do
  eval $2
done
