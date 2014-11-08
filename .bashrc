if [[ -r ~/.bash_local ]]; then
	. ~/.bash_local
fi

alias ls='ls -F'
alias la='ls -lah'
alias status='git status'
alias add='git add'
alias commit='git commit'
alias push='git push'
alias pull='git pull'

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
