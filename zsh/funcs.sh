#!/bin/bash
#FUNCTIONS
#make directory and change directory
function mkcd() {
    dir=$1
    if [ -d "$dir" ]; then
        cd "$dir" || exit 1
    else
      mkdir "$dir" && cd "$dir" || exit 1 
    fi
}

#tao of tmux
function tao () {
  [ -z "$TMUX"  ] && { tmux attach || tmux new-session ;}
}
