#!/bin/bash

###
# Add envirnoment variables to ~/.bash_profile.
# So you maybe need re-login to take it effect.
###

if [[ -f ~/.bash_profile ]]; then
    echo "Found .bash_profile in dir of home."
else
    echo "Not found .bash_profile in dir of home."

    return
fi

cat <<EOF | tee -a ~/.bash_profile

# envirnoment variables from env_var.sh
export EDITOR="nvim"
EOF
