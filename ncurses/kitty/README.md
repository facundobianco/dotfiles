# Configuration related to Kitty

Add in your `~/.bashrc` file

```
if [ "$TERM" = "xterm-kitty" ]; then
  export PROMPT_COMMAND="echo -ne '\033]0;🐱 kiTTY\007'"
  export PS1="\W $> "
fi
```
