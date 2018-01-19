

#for changing the color of world writable file
set -x LS_COLORS $LS_COLORS:'ow=30;106:'

# for autojump
begin
    set --local AUTOJUMP_PATH $HOME/.config/fish/autojump.fish
    if test -e $AUTOJUMP_PATH
        . $AUTOJUMP_PATH
    end
end


#if test -f /etc/autojump.sh; . /etc/autojump.sh; end


# for gpg
gpg-connect-agent updatestartuptty /bye >/dev/null
set -x SSH_AUTH_SOCK /run/user/1000/gnupg/S.gpg-agent.ssh


# for virtualenv aka virtualfish
eval (python2 -m virtualfish compat_aliases auto_activation)
eval (python -m virtualfish compat_aliases auto_activation)

set -x WORKON_HOME ~/.virtualenvs
mkdir -p $WORKON_HOME

# run the local config script
local
