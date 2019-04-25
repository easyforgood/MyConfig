# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/<TBD>/.oh-my-zsh
BULLETTRAIN_PROMPT_CHAR="🐹 "

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

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
# plugins=(wd git web-search thefuck d last-working-dir)
plugins=(wd git d last-working-dir thefuck tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

alias ctags="`brew --prefix`/bin/ctags"
# export GOROOT=/usr/local/go
export GOROOT=/usr/local/go
export GOPATH=/Users/<TBD>/Workplace/go
export MAVEN_HOME=/Users/<TBD>/bin/apache-maven-3.5.2
export PATH=$PATH:$MAVEN_HOME/bin
export PATH=$PATH:/Users/<TBD>/Workplace/go/bin:/usr/local/node-v8.11.1-linux-x64/bin

alias clc="clipcopy"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_151.jdk/Contents/Home
alias tailf="tail -f"
export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:/Users/<TBD>/bin/commandline:$GOROOT/bin

alias vi="vim"

#function main2(){
#	if [ $(ps -ef | grep -c "tmux") -lt 1 ]
#	then
#		[ -z "$TMUX" ] && exec tmux new-session -s main
#	fi
#}
#
alias main="tmux a -t main || tmux new-session -s main"
#alias pwd="pwd ; pwd|clc"
function lb() {
	if [ -e ~/logbook/logbook-`date +%Y-%m-%d`.md ]
	then
		open ~/logbook/logbook-`date +%Y-%m-%d`.md
	else
		python3 ~/bin/commandline/logbook.py & open ~/logbook/logbook-`date +%Y-%m-%d`.md
	fi
}
#function prev() {
#  PREV=$(fc -lrn | head -n 1)
#    sh -c "pet new `printf %q "$PREV"`"
#}

set +H
alias l10="ll -t | head -n 10"
function rhist(){
	cmd=$(history | sort -r | peco --layout=bottom-up| awk  '{$1="";print $0}')
	echo "runnig command : $cmd "
	eval $cmd
}
alias ida64="/Applications/IDA\ Pro\ 7.0/ida64.app/Contents/MacOS/ida64"
function exists { which $1 &> /dev/null }

if exists percol; then
	function percol_select_history() {
		local tac
		exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
		BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
		CURSOR=$#BUFFER         # move cursor
		zle -R -c               # refresh
	}

zle -N percol_select_history
bindkey '^R' percol_select_history
fi

export THEOS=~/theos

# thanks for https://remysharp.com/2018/08/23/cli-improved?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website

alias cat="bat"
alias top="htop"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'

