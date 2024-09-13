# Function to set prompt color based on command success
function set_prompt {
  if [ $? -eq 0 ]; then
    PROMPT='%F{white}%B╭ %D{%T} - %F{reset}%B%F{green}%n %F{reset}%B%F{blue}%3~%F{reset}
%F{white}%B╰ %F{green}$ %F{reset}'
  else
    PROMPT='%F{white}%B╭ %D{%T} - %F{reset}%B%F{green}%n %F{reset}%B%F{blue}%3~%F{reset}
%F{white}%B╰ %F{red}$ %F{reset}'
  fi
}

# Set the prompt initially and update it before each command
set_prompt
precmd_functions+=(set_prompt)

export PROMPT_DIRTRIM=2
export BASH_SILENCE_DEPRECATION_WARNING=1

# History setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# zsh config for autocompletion and syntax highlighting
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# alias 
alias vim=nvim
alias la='ls -a'
alias proj='cd ~/Documents/projects' 
alias uni='cd ~/Documents/University'
alias 'yay update'='sudo yay -Sua'
alias 'pacman update'='sudo pacman -Syu'

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
