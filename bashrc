set_prompt () {
	Last_Command=$? # Must come first!
	PS1=""
	PS1+=`date "+%H:%M:%S"`
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
	PS1+="<\u@\h:\w> "
	PS1+="$ "
}

PROMPT_COMMAND="set_prompt; $PROMPT_COMMAND"

PS2='  '

HISTSIZE=10000
HISTFILESIZE=10000
shopt -s histappend
shopt -s cmdhist

function ll() {
	ls -fl "$@"
}
function show() {
	defaults write com.apple.finder AppleShowAllFiles YES
}
function hide() {
	defaults write com.apple.finder AppleShowAllFiles NO
}
function eject() {
	EJECT="tell app \"Finder\" to eject "
	EJECT+="(every disk whose ejectable is true)"
		osascript -e "$EJECT" && echo "All external drives ejected."
}
function uneject() {
	diskutil list | sed -n 's/^\(\/dev.*\) (.*$/\1/p' | tail -n +2 | \
	sed 's/.*/diskutil mountDisk &/' | sh
}


export NVM_DIR=/Users/sterpe/.nvm
[ -s /usr/local/nvm/nvm.sh ] && . /usr/local/nvm/nvm.sh && nvm use system

export -f ll
export -f show
export -f hide
export -f eject
export -f uneject
