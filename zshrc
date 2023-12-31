# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/lib:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${HOME}/.oh-my-zsh/custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
          alias-finder
          aliases
          ansible
          aws
          docker
          docker-compose
          firewalld
          git
          helm
          kubectl
          kubectx
          kube-ps1
          rsync
          #systemadmin
          systemd
          terraform
          vi-mode
          yum
          zsh-autosuggestions
          zsh-completions
          zsh-exa
          zsh-syntax-highlighting
          zsh-peco-history
)

DISABLE_AUTO_UPDATE=true
source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_PECO_HISTORY_DEDUP=1
alias peco='peco --layout=bottom-up'
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# vi mode
#bindkey -v
MODE_INDICATOR="%F{yellow}+%f"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

ZSH_ALIAS_FINDER_AUTOMATIC=true

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_DISABLE_GITSTATUS=true

### Env Vars
export DEF_TX_SESSION=playbooks
export ARCHREPO_REGION=east
export BASE=$HOME
export ANSIBLE_ENV=/usr/local
export ansible_interpreter=$ANSIBLE_ENV/bin/python
#export ansible_ssh_private_key_file =../ssh_keys/id_rsa

### Aliases
# User specific aliases and functions
### TMUX
# https://tmuxcheatsheet.com/
alias txl='tmux ls'
alias txa='tmux attach -t'
alias txk='tmux kill-session -t'

### git
alias gs='git status'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias ga='git add'
alias gp='git pull'
alias gu='git push'
alias gcl='git clone'
alias gct='git commit -m'
alias gsc='git status -uno'
alias gspi='git stash'
alias gspo='git stash pop'


### Ansible
alias activate='source $ANSIBLE_ENV/bin/activate'
alias roles='$BASE/playbooks/roles'

### VIM
alias vim='vim'
alias svim='sudo vim'

### Bash
#alias ls='ls --group-directories-first --color -p'

### Workflow Docker
alias workflow='docker run --name rd_ansible_workflow --hostname rahul -it --user $(id -u):$(id -g) --rm -v $(pwd):$(pwd):rw  ghcr.io/lyvecld/ansible-workflow-2.10-alpine:3.10'

### Functions
function repoeast() {
  region=east
  endpoint_url=https://s3.us-${region}-1.lyvecloud.seagate.com/
  profile=archrepo-rd-${region}1
  s3_bucket=s3://archsrerepo${region}1
  cmnd=$1
  src=$2
  dest=$3
  if [[ "$#" -le 4 ]]
  then
    case $cmnd in
          ls) TZ=":UTC" aws --endpoint-url $endpoint_url --profile $profile s3 ls $s3_bucket/$2
          ;;
        cpup) TZ=":UTC" aws --endpoint-url $endpoint_url --profile $profile s3 cp $src $s3_bucket/$dest
          ;;
      cpdown) TZ=":UTC" aws --endpoint-url $endpoint_url --profile $profile s3 cp $s3_bucket/$src $dest
          ;;
           *) echo "
                ls      -  To  list
                cpup    -  To  Upload
                cpdown  -  To  Download
"
    esac
  else
    echo "Takes only 4 arguments"
  fi
}


function repowest() {
  region=west
  endpoint_url=https://s3.us-${region}-1.lyvecloud.seagate.com/
  profile=archrepo-rd-${region}1
  s3_bucket=s3://archsrerepo${region}1
  cmnd=$1
  src=$2
  dest=$3
  if [[ "$#" -le 4 ]]
  then
    case $cmnd in
          ls) TZ=":UTC" aws --endpoint-url $endpoint_url --profile $profile s3 ls $s3_bucket/$2
          ;;
        cpup) TZ=":UTC" aws --endpoint-url $endpoint_url --profile $profile s3 cp $src $s3_bucket/$dest
          ;;
      cpdown) TZ=":UTC" aws --endpoint-url $endpoint_url --profile $profile s3 cp $s3_bucket/$src $dest
          ;;
           *) echo "
                ls      -  To  list
                cpup    -  To  Upload
                cpdown  -  To  Download
"
    esac
  else
    echo "Takes only 4 arguments"
  fi
}

function repocentral() {
  region=central
  endpoint_url=https://s3.us-${region}-1.lyvecloud.seagate.com/
  profile=archrepo-rd-${region}1
  s3_bucket=s3://archrepo${region}1
  cmnd=$1
  src=$2
  dest=$3
  if [[ "$#" -le 4 ]]
  then
    case $cmnd in
          ls) TZ=":UTC" aws --endpoint-url $endpoint_url --profile $profile s3 ls $s3_bucket/$2
          ;;
        cpup) TZ=":UTC" aws --endpoint-url $endpoint_url --profile $profile s3 cp $src $s3_bucket/$dest
          ;;
      cpdown) TZ=":UTC" aws --endpoint-url $endpoint_url --profile $profile s3 cp $s3_bucket/$src $dest
          ;;
      sync) TZ=":UTC" aws --endpoint-url $endpoint_url --profile $profile s3 cp $s3_bucket/$src $dest
          ;;

           *) echo "
                ls      -  To  list
                cpup    -  To  Upload
                cpdown  -  To  Download
                sync -  To Sync
"
    esac
  else
    echo "Takes only 4 arguments"
  fi
}

function farm() {
  region=us-west-1
  endpoint_url=https://s3.us-west-1.svl.lyvecloud.seagate.com/
  profile=farmlogs
  s3_bucket=s3://stx-usw2-ehc-lyve-pilot-feeds/Lyvecloud/FARM/
  cmnd=$1
  src=$2
  dest=$3
  if [[ "$#" -le 4 ]]
  then
    case $cmnd in
          ls) TZ=":UTC" aws  --profile $profile s3 ls $s3_bucket
          ;;
        cpup) TZ=":UTC" aws  --profile $profile s3 cp $src $s3_bucket/$dest
          ;;
      cpdown) TZ=":UTC" aws  --profile $profile s3 cp $s3_bucket/$src $dest
          ;;
           *) echo "
                ls      -  To  list
                cpup    -  To  Upload
                cpdown  -  To  Download
"
              ;;
    esac
  else
    echo "Takes only 4 arguments"
  fi
}


function txn() {
  ##if [[ -z $1 ]]
  ##then
  ##  echo "Please provide a name for the session"
  ##elif [[ -n $1 && $1 != "rd_playbooks" ]]
  if [[ $1 -eq "rd_playbooks" || -z $1 ]]
  then
    tmux has-session -t rd_playbooks
    y=$?
    if [[ $y -eq 0 ]]
    then
      txa rd_playbooks
    else
      echo 2
      tmux new-session -s rd_playbooks
    fi
  elif [[ -n $1 && $1 != "rd_playbooks" ]]
  then
    echo 1
    tmux new-session -s rd_$1
  fi
}

playbooks() {
  cd $BASE/playbooks

  if [[ $rd_env -eq 0 ]]
  then
    activate
    sed 's/rd_env=0/rd_env=1/g' $BASE/.rd_vars
  fi

  if [[ $rd_gs -eq 0 ]]
  then
    git status
    sed 's/rd_gs=0/rd_gs=1/g' $BASE/.rd_vars
  fi
}

# zsh-autosuggestions
bindkey '^f' autosuggest-accept

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

