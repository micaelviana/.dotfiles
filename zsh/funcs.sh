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


#make file to OpenGL code 
# gl (){
#   file=$1
#   binary=$(echo ${file:0:-4})
#   if [ -f $file ]; then
#      g++ $file -o $binary -lGL -lglut -lGLU
     # echo $binary
  # else
    # echo "Failed. File not found"
  # fi
# }
