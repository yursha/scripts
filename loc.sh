#!/usr/bin/env sh

# Given a number of git repositories as file paths prints SLOC for each.
# File paths which are not git repositories are ignored.

set -e

for dir in "$@"
do
    if [ ! -d "$dir" ]; then
      echo "Warn: ignoring "[$dir]" - not a directory"
      continue
    fi

    if [ ! -d "$dir/.git" ]; then
      echo "Warn: ignoring "[$dir]" - not a git repository"
      continue
    fi

    loc=$(find "$dir" -path ./.git -prune -o -type f \
                  -exec grep -Iq . {} \; -and -print0 | \
                  xargs -0 wc -l | tail -1 | cut -f2)

    echo "$dir: $loc"
done
