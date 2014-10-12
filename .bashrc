if [[ -r ~/.bash_local ]]; then
	. ~/.bash_local
fi

alias ls='ls -F'

# Custom command prompts
# \h:\W \u\$ #PS1
# >  #PS2
set_prompt () {
	Last_Command=$? # Must come first!
	PS1=""
	if [[ $Last_Command == 0 ]]; then
	    PS1+="\$? "
	else
	    PS1+="\$? "
	fi
	PS1+="\u@\W π "
}
PROMPT_COMMAND="set_prompt; $PROMPT_COMMAND"
PS2='	'
