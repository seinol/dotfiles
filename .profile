#simple ps1
export PS1='\n\[\033[32m\]\u \[\033[33m\]\W\[\033[36m\]`__git_ps1`\[\033[00m\]\n$ '

#list
alias ll="ls -la --color=auto"

#navigation
alias ..="cd .."
alias ...="cd ../.."
alias o='explorer.exe .'

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

#python winpty
alias python3='winpty python3.exe'
alias python='winpty python.exe'
alias pip='winpty pip.exe'

#go development
alias goclean='echo -e "\nRunning go cleanup" && go clean && go clean -testcache && go install ./...'
alias golint='echo -e "\nRunning go linter" && golangci-lint run'
alias gotest='echo -e "\nRunning go test" && godotenv -f ./.env go test ./...'
alias gotestcover='echo -e "\nRunning go test with cover" && godotenv -f ./.env-local go test ./... -coverprofile=coverage.out && go tool cover -html=coverage.out'
alias goswag='echo -e "\nRunning go swagger regeneration" && swag init -g cmd/main.go -o api/docs --generatedTime'
alias goswagfmt='echo -e "\nRunning go swagger format" && swag fmt -g cmd/main.go"
alias goall="goclean && golint && gotest'
alias godocker='docker-compose up -d --build'
