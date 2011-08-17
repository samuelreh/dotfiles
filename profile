export PATH="/usr/local/mysql/bin:$PATH"

alias rake='bundle exec rake'
alias eft3="cd ~/Development/Ruby/eft3"
alias dbreset='rake db:drop db:create db:migrate db:seed'
alias jerbs="rake jobs:work"
alias rspec="bundle exec rspec --color --format doc"
alias cuc="bundle exec cucumber"
alias bs="rake eft3:db:bootstrap"
alias find_and_replace='perl -p -i -e'

function gemo {
 dir=$PWD;
 bundle_dir=`bundle show $1`;
 echo $bundle_dir;
 cd $bundle_dir;
 mvim .;
 cd $dir;
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
