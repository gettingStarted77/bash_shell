#!/bin/bash

###
# Add setting to ~/.bash_profile for user login.
# So you maybe need re-login to take it effect.
###

if [[ -f ~/.bash_profile ]]; then
    echo "Found .bash_profile in dir of home."
else
    echo "Not found .bash_profile in dir of home."

    return
fi

cat <<EOF | tee -a ~/.bash_profile

# envirnoment variables
export EDITOR="nvim"

# PATH
# PATH="~/.cargo/bin:$PATH"

# Autostart X at login. Place this in login shell initialization
# file (e.g. ~/.bash_profile for Bash or ~/.zprofile for Zsh)
#if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]; then
#  exec startx
#fi

EOF
