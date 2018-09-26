# Personal configuration for bash 

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR=vim
export HISTIGNORE="clear:exit:ls:pwd:reboot:reset:resource:shutdown:cd:bc:poweroff"
export HISTCONTROL="ignoreboth:erasedups"
export HISTFILESIZE="999999"

set completion-ignore-case on
complete -cf man alias info which whereis
shopt -s cdspell checkhash no_empty_cmd_completion hostcomplete

complete -cf alias info man whereis which

alias dff='df -hx tmpfs | column -t'
alias ls='ls -1Ahq --color=always --file-type --group-directories-first'
alias bc='bc -q'

# vim syntax=sh
