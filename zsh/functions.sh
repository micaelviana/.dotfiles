#FUNCTIONS
#make directory and change directory
mkcd() {
    dir=$1
    if [ -d $dir ]; then
        echo "Directory already exists"
    else
        mkdir $dir
        cd $dir
    fi
}

#tao of tmux
tao () {
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
