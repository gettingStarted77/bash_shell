#!/bin/bash

###
# This is a startup script used to execute other scripts.
###

path="/home/im-magic/repos/bash_shell/"
pending_bash_script="proxy.sh github.sh"

for scripts in $pending_bash_script; do
    script="${path}${scripts}"

    if [[ -f $script ]]; then
        source "${script}"
    else
        echo "Not such file: ${script}"
    fi
done
