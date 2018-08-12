#!/usr/bin/env bash

# Given a number of source code repositories as file paths prints SLOC for each.
# Only supports Git and Subversion.

set -e

for dir in "$@"
do
    if [ ! -d "$dir" ]; then
      echo "Warn: ignoring "[$dir]" - not a directory"
      continue
    fi

    if [ ! -d "$dir/.git" ] && [ ! -d "$dir/.svn" ]; then
      echo "Warn: ignoring "[$dir]" - not a git or svn repository"
      continue
    fi

    loc=$(find "$dir" -path "$dir"/.git -prune -o -type f \
                  -exec grep -Iq . {} \; -and -print0 | \
                  xargs -0 wc -l | tail -1 | xargs \
                  | cut -d' '  -f1)

    echo "$dir: $loc"
done
