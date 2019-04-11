#set nice prompt with git usecase
#PS1='\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n\$ '

#easy ls command
alias ll="ls -la"

#easier navigation
alias ..="cd .."
alias ...="cd ../.."

#set username
username=`id -u -n`

#curretly custom used
alias check='eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env default)'
alias stop='check && docker stop $(docker ps -a -q)'
alias start="/c/Users/${username}/Documents/Repository/scripts/start_docker.sh"
alias prod="cf target -o SAS-CIX-TIC-TDI_apps -s tic-apps"
alias dev="cf target -o SAS-CIX-TIC-TDI_apps -s tic-apps-dev"
alias test="cf target -o SAS-CIX-TIC-TDI_apps -s tic-apps-test"
alias other="cf target -o SAS-CIX-TIC-TDI_apps -s tic-other"
alias login="cf login -a https://api.scapp-console.swisscom.com --sso"
alias key="/c/Users/${username}/Documents/Repository/scripts/service_key.sh"
alias postgres="docker start local-postgres && docker start pgadmin4"
