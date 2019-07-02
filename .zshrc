if [[ $(uname -s) =~ "Darwin".* ]]; then
  if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
  fi
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/go/bin:$HOME/.bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


if [[ -z $(echo $SSH_AGENT_PID) ]]; then
  eval `ssh-agent -s` > /dev/null
fi

# use correct command for fd (e.g. mac uses fd, linux uses fdfind)
if [[ ! -z $(command -v fd) ]]; then
  fd='fd'
fi

if [[  ! -z $(command -v fdfind)  ]]; then
  fd='fdfind'
fi

export FZF_DEFAULT_COMMAND="${fd} --type f --hidden --follow --exclude .git"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
# export EDITOR='vim'
#else
# export EDITOR='nvim'
#fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

unsetopt AUTO_CD

export GOPATH=$HOME/go

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

alias vim='nvim'

alias ticketnum="git rev-parse --abbrev-ref HEAD | grep -o '\\w\\+-\\d\\+'"
alias branchtype="git rev-parse --abbrev-ref HEAD | grep -o '\\w\\+\\/'"
alias cm='echo "$(ticketnum) $commit_msg" > ~/.gitcommittemplate; git commit -t ~/.gitcommittemplate'

alias gf='git fetch --prune'
alias sl='git shortlog --no-merges --since=\"$(date '+%Y')-$(date '+%m')-01\"'
alias dc='docker-compose'
alias so='source ~/.zshrc'
alias ag='ag -u --path-to-ignore ~/.ignore --pager="less -XFR"'

# https://gist.github.com/textarcana/4611277
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias more='less'
alias less='less -m -N -g -i -J --underline-special --SILENT'

alias whodoneit='git ls-tree --name-only -z -r HEAD -- $1 | xargs -0 -n1 git blame --line-porcelain | grep "^author "|sort|uniq -c|sort -nr'
#alias note="nvim +'normal Go' +'r!date' +'normal Go' +':NERDTreeTabsClose' +'normal ,p' ~/note.txt"
alias note="nvim +'normal Go' +'r!date' +'normal Go' +'normal ,p' ~/note.txt"
alias lock='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/java/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

