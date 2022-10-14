# .zshrc
# Alexander Burdiss
# Last updated 10/12/22

# Color in the ls command
export CLICOLOR=1
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

# Use NeoVim if installed
if command -v nvim &> /dev/null
then
  alias vim='nvim'
fi

# zsh config helpers
alias zc='vim ~/.zshrc'
alias zs='source ~/.zshrc; echo ".zshrc sourced"'
# M1 Mac stuff
alias intel='arch -x86_64'

# Locations
alias be='cd ~/Documents/ReactNativeApps/BrassExcerpts && pwd'
alias sp='cd ~/Documents/ReactNativeApps/ScalePractice && pwd'
alias br='cd ~/Documents/ReactNativeApps/BrassRoutines && pwd'
alias bp='cd ~/Documents/ReactWebsites/bedtimeproject.org && pwd'
alias bps='cd ~/Documents/ReactWebsites/btp-sanity && pwd'
alias rc='cd ~/Documents/HtmlWebsites/reloadcincy.com && pwd'
alias ab='cd ~/Documents/HtmlWebsites/alexanderburdiss.com && pwd'
alias sb='cd ~/Documents/HtmlWebsites/stigmon-burdiss && pwd'
alias sr='cd ~/Documents/HtmlWebsites/shelbyready.com && pwd'
alias uvco='cd ~/Documents/HtmlWebsites/uppervalleycommunityorchestra.com && pwd'

# Workflow improvements
manprev() { man -t "$1" | open -fa Preview }
alias cs='~/scripts/cht.sh'
alias go='cd $(find ~ ~/Documents ~/Downloads ~/Desktop -mindepth 1 -maxdepth 1 -type d | fzf)'
alias branch='~/scripts/brancher.sh'

# Fun utilities
alias linesofcode='git diff --shortstat `git hash-object -t tree /dev/null`'
alias filecount='find . -type f | wc -l'

# Program setup info
CYPRESS_CRASH_REPORTS=0

# Colors and custom prompt info
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %b'
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
# Colors: Light blue: 116, Dark Blue: 030, Pink: 162, Grey: 152
username() {
  echo "%F{116}%n%f"
}
directory() {
  echo "%F{116}%1~%f"
}
gitStatus() {
  echo "%F{030}${vcs_info_msg_0_}%f"
}
PROMPT='$(directory)$(gitStatus) %F{162}>%f %F{152}'
RPROMPT="%F{152}%t%f"
