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
	PS1+="λ "
}

PROMPT_COMMAND="set_prompt; history -a; history -c;\
 history -r; $PROMPT_COMMAND"

PS2='  '

HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
shopt -s cmdhist

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

function eighty_columns() {
	a="      +8     +16     +24     +32     +40"
	b="     +48     +56     +64     +72     +80"
	echo "$a$b"
}
function clear() {
	/usr/bin/clear
	eighty_columns
}
function path() {
	echo "$PATH"
}
function la() {
	ls -fF "$@" --color=auto
}
function ll() {
	ls -fl "$@" --color=auto
}
function show.files() {
	defaults write com.apple.finder AppleShowAllFiles YES
}
function hide.files() {
	defaults write com.apple.finder AppleShowAllFiles NO
}
function eject() {
	CMD="tell app \"Finder\" to eject "
	CMD+="(every disk whose ejectable is true)"
	if [ "$1" = "all" ] ; then
		osascript -e "$CMD"
		echo "All external drives ejected."
	fi
}
function remount() {
	if [ "$1" = "all" ] ; then
		diskutil list | sed -n '/^\/dev/p' | tail -n +2 |
			sed 's/.*/diskutil mountDisk &/' | sh
	fi
}

export -f eighty_columns
export -f clear
export -f path
export -f la
export -f ll
export -f eject
export -f remount
