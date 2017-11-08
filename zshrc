# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mattoufoutu"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git github pip python autojump)

plugins=(git github pip python autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias mountu='sudo mount -o gid=mofo,fmask=113,dmask=002 ' 
alias calc=galculator

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# alias for pdf
alias pdf='zathura' 
alias view='geeqie'
export EDITOR="vim"

alias sublime='/opt/sublime_text_3/sublime_text'

alias chu='echo -e "\n* Checking the repos *\n" && checkupdates && echo -e "\n\n* Checking the AUR *\n" && cower -dduf --color=auto --timeout=0 && echo -e "\nDone\n"'

alias mza='sudo mount /mnt/usbdisk/zalman_cd'
alias uza='sudo umount /mnt/usbdisk/zalman_cd'

# alias to check the 10 most big folder
alias ducks='du -cks * | sort -rn | head'

# Path for IntelliJ-Idea
#export IDEA_JDK="/usr/lib/jvm/java-8-jdk/bin"

#stuff for hidpi gtk no more here, because now in rc.lua
#export QT_AUTO_SCREEN_SCALE_FACTOR=2
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.4

# stuff for gpg-agent

# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null



#add for ruby
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

#set the default browser
export BROWSER=/usr/bin/chromium

# fix temporary for VMWARE shitz
export VMWARE_USE_SHIPPED_LIBS='yes'

# Virtualenvwrapper stuff

export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
source /usr/bin/virtualenvwrapper.sh
