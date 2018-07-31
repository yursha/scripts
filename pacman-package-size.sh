#!/usr/bin/env bash

# Calculates combined install size of a package and all its combined
# dependencies recursively.
#
# Requires `expac` package.

set -e

total_size=0

declare -A seen

query () {
  local own_size=$(expac -S '%m' $1)
  if [[ -z $own_size ]]; then
    return
  fi
  local deps=$(expac -S '%E' $1)
  echo "$1 $(humanize $own_size)"
  total_size=$((total_size + own_size))
  for dep in $deps; do
    if [[ $dep = "glibc" ]] ; then
      continue;
    fi
    if [[ -v "seen[$dep]" ]]; then
      continue;
    fi 
    seen["$dep"]=1
    query $dep
  done
}

humanize () {
  echo "$(numfmt --to=iec-i --suffix=B $1)"
}

query $1

echo "Total $(humanize $total_size)"
