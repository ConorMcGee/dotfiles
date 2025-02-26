# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  1password
  brew
  docker
  golang
  git
  # tmux
  kubectl
  virtualenv
  zsh-snoologin
  web-search
  # vi-mode
)


# User configuration
# export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/Users/conor.mcgee/Library/Python/3.9/bin"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/conor.mcgee/.local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias python=python3
alias pip=pip3
alias ppjson="python -m json.tool"
alias xkubectl="~/stuff/kube/kubectl"

fignore=(.pyc)

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

alias cdw="cd ~/src/"

# fuck
alias fuck='$(thefuck $(fc -ln -1))'
# You can use whatever you want as an alias, like for mondays:
# alias FUCK='fuck'
alias fucking='sudo'

DEFAULT_USER=$(whoami)

export TERM='xterm-256color'

export WORKON_HOME=$HOME/.virtualenvs
VIRTUAL_ENV_DISABLE_PROMPT=1

# Dotfiles thing
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

fpath=(~/.zsh/completion $fpath)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export MFA_DEVICE='arn:aws:iam::210246326331:mfa/conor.mcgee'
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

export MFA_DEVICE="arn:aws:iam::210246326331:mfa/conor.mcgee"
export AWS_SDK_LOAD_CONFIG=true

# python bullshit
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ------- Graveyard of forgotten config stuff ------

# docker cleanup thing
# dcleanup(){
    # docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    # docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
# }

# All this shit takes ages:

# pyenv setup:
# eval "$(pyenv init -)"

# added by Anaconda3 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/conor.mcgee/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
    # \eval "$__conda_setup"
# else
    # if [ -f "/Users/conor.mcgee/anaconda3/etc/profile.d/conda.sh" ]; then
        # . "/Users/conor.mcgee/anaconda3/etc/profile.d/conda.sh"
        # CONDA_CHANGEPS1=false conda activate base
    # else
        # \export PATH="/Users/conor.mcgee/anaconda3/bin:$PATH"
    # fi
# fi
# unset __conda_setup
# <<< conda init <<<

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /home/conor/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/conor/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /home/conor/node_modules/tabtab/.completions/sls.zsh ]] && . /home/conor/node_modules/tabtab/.completions/sls.zsh

# source /usr/local/bin/virtualenvwrapper.sh 
# source ~/.autoenv/activate.sh
#
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export DOCKER_DEFAULT_PLATFORM=linux/amd64

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

alias ag='ag --path-to-ignore ~/.ignore'

alias k=kubectl
export PATH="/opt/homebrew/sbin:$PATH"

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

spinnaker-to-drone-pipeline() {
  docker run --rm -i -v "${PWD}":/workdir --platform linux/arm64/v8 artifactory.build.ue1.snooguts.net/reddit-docker-dev/spinnaker-to-drone-pipeline "$@"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/conor.mcgee/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/conor.mcgee/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/conor.mcgee/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/conor.mcgee/google-cloud-sdk/completion.zsh.inc'; fi

# Vi mode for editing commands (disabled because using Oh My Zsh plugin instead
# bindkey -v
# bindkey ^R history-incremental-search-backward 
# bindkey ^S history-incremental-search-forward

export PATH="${HOME}/go/bin:${PATH}"

# Sourcegraph stuff
export SRC_ENDPOINT=https://sourcegraph.build.ue1.snooguts.net
export SRC_ACCESS_TOKEN=sgp_1f8d6db375bcb3bd_cce94a8a4fb1df6cd1575c3e63e875a15adf567c

# Find/replace for all files in a directory
find-replace() {
  find . -type f -exec gsed -i "s|${1}|${2}|g" {} \;
}

# oh my zsh tmux integration
export ZSH_TMUX_AUTOSTART="true"

# alt + direction to move by word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
