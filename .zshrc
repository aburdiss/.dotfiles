# export JAVA_HOME=$(/usr/libexec/java_home -v '1.8*')

export ANDROID_HOME=/Users/alexanderburdiss/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Aliases
alias intel='arch -x86_64'
alias be='cd /Users/alexanderburdiss/documents/ReactNativeApps/BrassExcerpts'
alias sp='cd /Users/alexanderburdiss/documents/ReactNativeApps/ScalePractice'
alias br='cd /Users/alexanderburdiss/documents/ReactNativeApps/BrassRoutines'
alias bp='cd /Users/alexanderburdiss/documents/ReactWebsites/the-bedtime-project'
alias bps='cd /Users/alexanderburdiss/documents/ReactWebsites/btp-sanity'
alias rc='cd /Users/alexanderburdiss/documents/HtmlWebsites/reload-cincy'
alias ab='cd /Users/alexanderburdiss/documents/HtmlWebsites/alexander-burdiss'
alias sb='cd /Users/alexanderburdiss/documents/HtmlWebsites/stigmon-burdiss'
alias sr='cd /Users/alexanderburdiss/documents/HtmlWebsites/shelby-ready'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
