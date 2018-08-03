# System-wide .bashrc file for interactive bash(1) shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ "$EUID" -ne 0 ]
then
    if [ -s /etc/debian_version ]
    then
        PS1='\[\e[0;33m\]\h:\W\[\e[0;31m\]$(__git_ps1 " (%s)")\[\e[0;33m\] \\$>\[\e[0m\] '
    else
        PS1='\[\e[0;33m\]\h:\W \\$>\[\e[0m\] '
    fi
else
     PS1='\[\e[0;31m\]\h:\W #>\[\e[0m\] '
fi
PS2='> '
export PS1 PS2

export LANG=en_US.UTF-8 
export LC_CTYPE=en_US.UTF-8
export EDITOR=vim
export HISTIGNORE="clear:exit:halt:ls:pwd:reboot:reset:resource:shutdown:cd:bc"
export HISTCONTROL="ignoreboth:erasedups"
export HISTFILESIZE="999999"

set completion-ignore-case on 
complete -cf man alias info which whereis
shopt -s cdspell checkhash no_empty_cmd_completion hostcomplete

complete -cf alias info man whereis which

export LESSOPEN="|lesspipe.sh %s"
export LESS_TERMCAP_mb=$'\E[0;31m'
export LESS_TERMCAP_md=$'\E[0;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

if [ `uname -s` = "Linux" ]
then    
    alias dff='df -hx tmpfs | column -t'
    alias ls='ls -1Ahq --color=always --file-type --group-directories-first'
    alias bc='bc -q'
else
    alias halt='shutdown -hp now'
    alias dff='df -h'
    alias ls='colorls -1AGhq'
fi
