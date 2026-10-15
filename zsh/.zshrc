typeset +x FPATH
typeset -U fpath
# 1. OPTIMIZATION FLAG: Bypasses slow security permission checks on OMZ files
ZSH_DISABLE_COMPFIX="true"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Keep the plugin list lean
plugins=(git zsh-autosuggestions docker virtualenv)

# Load Oh My Zsh framework
source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- Paths & Binary Placements ---
export PATH="$PATH:/Users/matthew/.local/bin"
export PATH="$HOME/Scripts:$PATH"

# --- FZF Configurations ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="find . -maxdepth 1 | sed 's/^..//'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# --- Keybinds & Aliases ---
bindkey -s ^f "tmux-sessionizer\n"
alias vim="nvim"
alias v="nvim"
alias vh="nvim ."

## AWS SSO ALIASES
alias assumeSandboxAdmin='aws sso login --profile srxa-sandbox-admin'
alias assumeDevMLEngineer='aws sso login --profile srxa-dev-ml-engineer'
alias assumeDevAnalyticsEngineer='aws sso login --profile srxa-dev-analytics-engineer'
alias assumePPOProd='aws sso login --profile ppo-prod-analytics-engineer'

# --- DEFERRED ENVIRONMENT MANAGERS ---
# (Using zsh-defer here ensures you don't wait for these scripts to block startup)
if [ -f /opt/homebrew/share/zsh-defer/zsh-defer.plugin.zsh ]; then
    source /opt/homebrew/share/zsh-defer/zsh-defer.plugin.zsh
    
    # Lazy/Deferred Pyenv Initialization (Cleaned up the duplicate code)
    zsh-defer -c 'export PYENV_ROOT="$HOME/.pyenv"; [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"; eval "$(pyenv init - zsh)"'
    
    # Deferred Conda Initialization (Heavy hook)
    zsh-defer -c '__conda_setup="$('\''/Users/matthew/miniconda3/bin/conda'\'' '\''shell.zsh'\'' '\''hook'\'' 2> /dev/null)"; if [ $? -eq 0 ]; then eval "$__conda_setup"; else [ -f "/Users/matthew/miniconda3/etc/profile.d/conda.sh" ] && . "/Users/matthew/miniconda3/etc/profile.d/conda.sh" || export PATH="/Users/matthew/miniconda3/bin:$PATH"; fi; unset __conda_setup'

    # Deferred completions and tool integrations
    zsh-defer -c '[[ -s ~/.zsh/completions/cortex.zsh ]] && source ~/.zsh/completions/cortex.zsh'
    zsh-defer -c '[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"'
else
    # Fallback if zsh-defer is not installed yet
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init - zsh)"

    __conda_setup="$('/Users/matthew/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then eval "$__conda_setup"; else [ -f "/Users/matthew/miniconda3/etc/profile.d/conda.sh" ] && . "/Users/matthew/miniconda3/etc/profile.d/conda.sh" || export PATH="/Users/matthew/miniconda3/bin:$PATH"; fi; unset __conda_setup

    [[ -s ~/.zsh/completions/cortex.zsh ]] && source ~/.zsh/completions/cortex.zsh
    [[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
fi

# --- PLUGINS REQUIRED TO RUN AT THE ABSOLUTE BOTTOM ---
# Syntax highlighting must always be loaded last so it applies to all features above it
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
