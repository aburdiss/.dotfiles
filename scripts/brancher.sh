#! /usr/bin/env bash
#
# A script that handles creating a new branch if one does not exist, or
# switching to an existing one if it does.

RED='\x1b[31m'
NOCOLOR='\x1b[0m'

# You must be in a git repository
if ! git status &>/dev/null; then
    echo -e $RED"Err: Not a git repository"$NOCOLOR;
    exit 1;
fi

branchname=$1

cleanbranches=$(git branch --list | tr "*" " " | tr -d " ");

# You must enter a branch name
if [[ -z "$branchname" ]]; then
  branchname=$(echo $cleanbranches | tr " " "\n" | fzf)
fi

# This catches a control c in the previous fzf command
if [[ -z "$branchname" ]]; then
exit 1;
fi

if ! echo $cleanbranches | grep -qs $branchname; then
  read -p "branch \"$branchname\" doesn't exist. Create it? [yN] " yn;
  if [[ $yn == y* ]]; then
    echo "creating branch \"$branchname\"";
    git branch $branchname;
  else
    branchname=$(echo $cleanbranches | tr " " "\n" | fzf);
  fi
fi

git checkout $branchname
