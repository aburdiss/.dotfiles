#! /usr/bin/env bash
#
# A simple script that allows you to quickly search cht.sh, and returns back
# the data in less.
#
# Created by Alexander Burdiss 9/2/22
#

languages="bash css html javascript nodejs php python typescript twig zsh";
core_utils="find man tldr sed awk tr cp ls grep xargs rg ps mv kill lsof less head tail tar cp rm rename jq cat ssh cargo git git-worktree git-status git-commit git-rebase docker docker-compose stow chmod chown make";
selected=$(echo -e "$languages $core_utils" | tr " " "\n" | fzf);

if [[ -z "$selected" ]]; then
  exit 0;
fi

read -p "Search terms: " query;

if echo "$languages" | grep -qs $selected; then
  curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less -R;
else
  curl cht.sh/$selected~$query | less -R;
fi
