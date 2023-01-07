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
alias be='cd ~/Documents/ReactNativeApps/BrassExcerpts'
alias sp='cd ~/Documents/ReactNativeApps/ScalePractice'
alias br='cd ~/Documents/ReactNativeApps/BrassRoutines'
alias kr='cd ~/Documents/ReactNativeApps/KmrtRadio'
alias bp='cd ~/Documents/ReactWebsites/bedtimeproject.org'
alias bps='cd ~/Documents/ReactWebsites/btp-sanity'
alias rc='cd ~/Documents/HtmlWebsites/reloadcincy.com'
alias ab='cd ~/Documents/HtmlWebsites/alexanderburdiss.com'
alias sb='cd ~/Documents/HtmlWebsites/stigmon-burdiss'
alias sr='cd ~/Documents/HtmlWebsites/shelbyready.com'
alias uvco='cd ~/Documents/HtmlWebsites/uvcorchestra.com'

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
  echo "%F{116}%~%f"
}
gitStatus() {
  echo "%F{030}${vcs_info_msg_0_}%f"
}
gitDirtyMark () {
  # [[ -z $(git status --porcelain) ]] || echo "%F{162}*%f"

  if git rev-parse --git-dir > /dev/null 2>&1; then
    # Outputs a series of indicators based on the status of the
    # working directory:
    # + changes are staged and ready to commit
    # * unstaged changes are present
    # ? untracked files are present
    # S changes have been stashed
    # P local commits need to be pushed to the remote
    gitStatus="$(git status --porcelain 2>/dev/null)"
    output=''
    [[ -n $(egrep '^[MADRC]' <<<"$gitStatus") ]] && output="$output+"
    [[ -n $(egrep '^.[MD]' <<<"$gitStatus") ]] && output="$output*"
    [[ -n $(egrep '^\?\?' <<<"$gitStatus") ]] && output="$output?"
    [[ -n $(git stash list) ]] && output="${output}S"
    [[ -n $(git log --branches --not --remotes) ]] && output="${output}P"
    [[ -n $output ]] && output="%F{162}$output%f"
    echo $output
  fi
}
PROMPT='
$(directory)$(gitStatus) $(gitDirtyMark)
%F{162}>%f %F{152}'
RPROMPT="%F{152}%t%f"

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
