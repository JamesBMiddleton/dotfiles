export MallocNanoZone=0 # suppress error from macOS libmalloc when using clang address sanitizers

autoload -Uz colors && colors
PROMPT='%F{green}%m%f:%~ %# '

alias ls='ls -G'
