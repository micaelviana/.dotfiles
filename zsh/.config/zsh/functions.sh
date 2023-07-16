#!/usr/bin/env bash
# Select a docker container to start and attach to
function da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}
# Select a running docker container to stop
function ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}
# Select a docker container to remove
function drm() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker rm "$cid"
}

#show all paths
function path(){
    echo -e ${PATH//:/\\n}
}

#start tmux in the same section
function tao(){
    [ -z "$TMUX"  ] && { tmux attach || tmux new-session ;}
}

#open files in neovim using fzf picker
function vif(){
    fd --type f --hidden --exclude .git --exclude .vscode --exclude node_modules --print0 | fzf --layout=reverse --height=50% --read0 --print0 --exit-0 | xargs -r -0 nvim
}

