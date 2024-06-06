#simple ps1
export PS1='\n\[\033[32m\]\u \[\033[33m\]\W\[\033[36m\]`__git_ps1`\[\033[00m\]\n$ '

#list
alias ll="ls -la"

#navigation / file explorer
alias ..="cd .."
alias ...="cd ../.."
alias o='explorer.exe .'

#other
alias c="clear"
alias reload="source ~/.bashrc"

#variables
username=`id -u -n`
wsl_distro="Ubuntu"

#check if linux or emulated (p.e. git bash)
is_wsl() {
	uname -a | grep "Linux" >> /dev/null
	if [ $? -eq 0 ]; then
    echo Linux detected
		return 1
	else
    echo No Linux detected
		return 2
	fi
}

#docker
#[[ is_wsl -eq 1 ]] && export DOCKER_HOST=tcp://localhost:2376
#[[ is_wsl -eq 2 ]] && alias docker="wsl -d $wsl_distro -u root docker"
#[[ is_wsl -eq 2 ]] && alias startdocker='wsl -d $wsl_distro -u root sudo service docker start'
alias docker-compose='echo -e "Info: Using compose v2\n" && docker compose'
alias stop='echo -e "\nStop docker containers" && docker stop $(docker ps -a -q)'
alias delcon='echo -e "\nDelete docker containers"  && docker rm -f $(docker ps -a -q)'
alias delimg='echo -e "\nDelete docker images"  && docker rmi -f $(docker images -a -q)'
alias delvol='echo -e "\nDelete docker volumes"  && docker volume rm -f $(docker volume ls -q)'
alias resetall='stop && delcon && delimg && delvol'

#notepad++
alias npp="'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"

#start and bind adminer to running container
# TODO add all dev containers to default docker network
bind_adminer() {
  docker rm -f adminer >> /dev/null
  echo -e "\nBind to: \t$1"
  echo -e "Network: \t$2\n"
  $test = [[ is_wsl -eq 1 ]] && '--net "$2"'
  docker run -d --link "$1":db -p 8090:8080  --name=adminer adminer;
}
alias adminer="bind_adminer"

#go lang
alias goclean='echo -e "\nRunning cleanup and refresh" && go clean && go clean -testcache && go install ./...'
alias gobuild='echo -e "\nRunning go build" && go build ./cmd'
alias golint='echo -e "\nRunning golangci-lint" && golangci-lint run'
alias gotest='echo -e "\nRunning go test" && godotenv -f ./.env go test ./...'
alias gotestcover='echo -e "\nRunning go test with cover" && godotenv -f ./.env-local go test ./... 
-coverprofile=coverage.out && go tool cover -html=coverage.out'
alias goswag='echo -e "\nRunning go swagger regeneration" && swag init -g cmd/main.go -o api/docs --generatedTime'
alias goswagfmt='echo -e "\nRunning go swagger format" && swag fmt -g cmd/main.go'
alias gocheck='goclean && gobuild && golint && gotest'
alias godocker='docker-compose up -d --build && echo -e "\n" && docker ps -a'

#yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
source <(kubectl completion bash)
complete -F __start_kubectl k
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
source <(kubectl completion bash)
complete -F __start_kubectl k
