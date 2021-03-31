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
alias stop='echo -e "\nStop containers" && docker stop $(docker ps -a -q)'
alias delcon='echo -e "\nDelete containers"  && docker rm -f $(docker ps -a -q)'
alias delimg='echo -e "\nDelete images"  && docker rmi -f $(docker images -a -q)'
alias resetall='stop && delcon && delimg'
