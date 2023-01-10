#!/bin/bash

###
# Quickly start a proxy and connect to Github.
###

github_on(){
    # Autostart the only ssh-agent
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
      ssh-agent -t 1h > "$XDG_RUNTIME_DIR"/ssh-agent.env
    fi
    if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
      source "$XDG_RUNTIME_DIR/ssh-agent.env" > /dev/null
    fi

    # Auto add my github key
    ssh-add ~/.ssh/github
    # Enable proxy
    proxy_on > /dev/null

    # Test github
    ssh -T git@github.com
}
