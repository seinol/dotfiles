#simple ps1
export PS1='\[\033[33m\]\u \W\[\033[00m\]\[\033[36m\]`__git_ps1`\[\033[00m\]\n$ '

#list
alias ll="ls -la"

#navigation
alias ..="cd .."
alias ...="cd ../.."

#other
alias c="clear"
alias reload="source ~/.profile"

#variables
username=`id -u -n`

#docker
alias stop='echo -e "\nStop docker containers" && docker stop $(docker ps -a -q)'
alias delcon='echo -e "\nDelete docker containers"  && docker rm -f $(docker ps -a -q)'
alias delimg='echo -e "\nDelete docker images"  && docker rmi -f $(docker images -a -q)'
alias delvol='echo -e "\nDelete docker volumes"  && docker volume rm -f $(docker volume ls -q)'
alias resetall='stop && delcon && delimg && delvol'

#notepad++
alias npp="'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"

#bind adminer container to running database
bind_adminer() {
    local first_arg="$1" \
          second_arg="$2"
    shift 2     
	docker rm -f adminer
    docker run -d --link "$@":db -p 8090:8080 --name=adminer adminer;
}
alias adminer="bind_adminer"

