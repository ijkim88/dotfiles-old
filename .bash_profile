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
export PATH=~/bin/:$PATH
export LD_LIBRARY_PATH=~/local/lib
export GEM_HOME=~/local/gems
export RUBYOPT=rubygems

# Aliases and Functions
alias ls='ls -GFh'
alias ll='ls -GHlah'
alias grep='grep --color=auto'
alias editprofile='vim ~/.bash_profile'
alias sourceprofile='source ~/.bash_profile'
alias cheatsheet='sh ~/dotfiles/cheatsheets/quick-build.sh'
