PATH="/usr/local/bin:$PATH"

alias foremang='foreman'
alias be='bundle exec'
alias gph='git push heroku master && say "All Done"'
alias dbr='be rake db:drop db:create db:migrate && say "All Done"'
alias dbrt='RAILS_ENV=test be rake db:drop db:create db:migrate && say "All Done"'
alias find_and_replace='perl -p -i -e'
alias rspec='bundle exec rspec --colour'

function gemo {
 dir=$PWD;
 bundle_dir=`bundle show $1`;
 echo $bundle_dir;
 cd $bundle_dir;
 mvim .;
 cd $dir;
}

alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
