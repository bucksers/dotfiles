# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set theme to Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Zsh Plugins
plugins=(
  git
  colored-man-pages
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf
)

# Source Oh My Zsh and plugins
source $ZSH/oh-my-zsh.sh

# Remap accept suggestion to Ctrl+Space for zsh-autosuggestions
bindkey '^ ' autosuggest-accept

# Aliases
alias zshcon="nv ~/.zshrc"
alias nv="nvim"
alias nvcon="nv ~/.config/nvim/init.lua"
alias vi="vim"
alias vicon="nv ~/.vimrc"
alias tm="tmux"
alias tmcon="nv ~/.tmux.conf"
alias n="nnn"
alias rg="ranger"
alias fz="fzf"
alias fzn="fzf_nvim"

# Environment Variables
export EDITOR=/opt/homebrew/bin/nvim
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$PATH:/Users/will/ch-darwin-amd64"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

function fzf_nvim() {
    local file
    file=$(fzf) && nvim "$file"
}

# Conda initialization (managed by conda init)
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Source Powerlevel10k 
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
