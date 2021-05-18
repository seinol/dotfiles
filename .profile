#list
alias ll="ls -la"

#navigation
alias ..="cd .."
alias ...="cd ../.."

#other
alias c="clear"

#set username
username=`id -u -n`

#docker
alias start="/c/Users/${username}/Documents/Repository/scripts/start_docker.sh"
alias stop='echo -e "\nStop containers" && docker stop $(docker ps -a -q)'
alias delcon='echo -e "\nDelete containers"  && docker rm -f $(docker ps -a -q)'
alias delimg='echo -e "\nDelete images"  && docker rmi -f $(docker images -a -q)'
alias resetall='stop && delcon && delimg'

#notepad++
alias npp="'C:/Program Files (x86)/Notepad++/notepad++.exe'"
