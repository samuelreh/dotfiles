export PATH="/usr/local/mysql/bin:$PATH"

alias eft3="cd ~/Development/Ruby/eft3"
alias dbreset='rake db:drop db:create db:migrate db:seed'
alias jerbs="rake jobs:work"

function gemo {
 dir=$PWD;
 bundle_dir=`bundle show $1`;
 echo $bundle_dir;
 cd $bundle_dir;
 mvim .;
 cd $dir;
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
