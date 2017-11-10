ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mattoufoutu"

COMPLETION_WAITING_DOTS="true"

plugins=(git github pip python autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

#added to fish
# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias mountu='sudo mount -o gid=mofo,fmask=113,dmask=002 ' 
alias calc=galculator


#added to fish
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


#added to fish
# alias for pdf
alias pdf='zathura' 
alias view='geeqie'
export EDITOR="vim"

alias chu='echo -e "\n* Checking the repos *\n" && checkupdates && echo -e "\n\n* Checking the AUR *\n" && cower -dduf --color=auto --timeout=0 && echo -e "\nDone\n"'

alias mza='sudo mount /mnt/usbdisk/zalman_cd'
alias uza='sudo umount /mnt/usbdisk/zalman_cd'


# added to fish
# alias to check the 10 most big folder
alias ducks='du -cks * | sort -rn | head'

# Path for IntelliJ-Idea
#export IDEA_JDK="/usr/lib/jvm/java-8-jdk/bin"

#stuff for hidpi gtk no more here, because now in rc.lua
#export QT_AUTO_SCREEN_SCALE_FACTOR=2
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.4

# stuff for gpg-agent

# added to fish
# Set GPG TTY
export GPG_TTY=$(tty)

# added to fish
# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null



#add for ruby
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

#set the default browser
export BROWSER=/usr/bin/chromium

# Virtualenvwrapper stuff
# in fish too
export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
source /usr/bin/virtualenvwrapper.sh

exec fish

