if [[ -r ~/.bash_local ]]; then
	. ~/.bash_local
fi

#alias status='git status'
#alias add='git add'
#alias commit='git commit'
#alias push='git push'
#alias pull='git pull'
function checkout() {
	git checkout "$@"
}
export -f checkout
function push() {
	git push "$@"
}
export -f push
function pull() {
	git pull "$@"
}
export -f pull
function commit() {
	git commit "$@"

}
export -f commit
function add() { 
	git add "$@"
}
export -f add
function status() {
	git status "$@"
}
export -f status
alias _ls='/bin/ls'
function ls() {
	_ls -F "$@"
}
export -f ls
function la() {
	_ls -lahF "$@"
}
export -f la

# Custom command prompts
# \h:\W \u\$ #PS1
# >  #PS2
set_prompt () {
	Last_Command=$? # Must come first!
	PS1=""
#	if [[ $Last_Command == 0 ]]; then
#	    PS1+="\$? "
#	else
#	    PS1+="\$? "
#	fi
	PS1+=`date "+%H:%M:%S"`
#	PS1=${PS1%?}
	PS1+=" "
	branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null )"
	git_command=$?
		PS1+="[\!"
		PS1+="\\\\"
		PS1+="${Last_Command}"
	if [[ $git_command == 0 ]]; then 
		PS1+=":${branch}]"
	else
		PS1+="]"
	fi
	PS1+=" "
	PS1+="\u@\W "
	PS1+="λ "
}
PROMPT_COMMAND="set_prompt; history -a; history -c; history -r; $PROMPT_COMMAND"
PS2='	'
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
