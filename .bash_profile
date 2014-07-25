# Make terminal look better with colors
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Make man-pages look beter with syntax highlighting
# Less Colors for Man Pages for xterm
if [[ ${TERM} == "xterm-256color" ]]; then
  export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # bold mode      - main      (cyan)
  export LESS_TERMCAP_us=$'\e[38;5;97m'     # underline mode - second    (purp)
  export LESS_TERMCAP_so=$'\e[38;5;252m'    # standout-mode  - info/find (gray)
  export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking - unused?   (red)
  export LESS_TERMCAP_ue=$'\e[0m'           # end underline
  export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
  export LESS_TERMCAP_me=$'\e[0m'           # end all mode        - txt rest
fi

# Set some environment variables
export EDITOR=vim   # Use with CTRL-X_CTRL-E to open in editor and run when quit

# Aliases and Functions
alias ls='ls -GFh'
alias ll='ls -GHlah'
alias grep='grep --color=auto'
alias editprofile='vim ~/.bash_profile'
alias sourceprofile='source ~/.bash_profile'
alias freespace='diskutil info /dev/disk0s2 | grep "Volume Free Space"'
alias centos='ssh root@135.141.57.112'

h2d(){
    echo "ibase=16; $@"|bc
}
d2h(){
    echo "obase=16; $@"|bc
}
h2b(){
    echo "ibase=16;obase=2;$@"|bc
}
