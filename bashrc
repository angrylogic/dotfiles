# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
    *)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ack-grep='ack-grep --pager="less -RFX"'
alias ack='ack-grep'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_UNTRACKEDFILES=true
export PS1="\[\033[1;32m\][\$(date +%H:%M)]\[\033[0;36m\][\u@\[\033[0;31m\]\h:\[\033[01;33m\]"'$(__git_ps1)'" \[\033[1;34m\]\w]\[\033[0m\] "

export PATH=$PATH:~/bin

export EDITOR=vim

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$HOME/lib:/bin:/usr/local/cuda/lib64:/usr/local/lib:$HOME/src/caffe/build/install/lib/
export PATH=$HOME/bin:$PATH:$HOME/matlab/bin:/usr/local/cuda/bin
export PKG_CONFIG_PATH=$HOME/lib/pkgconfig/
export CFLAGS="-I$HOME/include"
export CPPFLAGS="-I$HOME/include"
export LDFLAGS="-L$HOME/lib"
export PKG_CONFIG_PATH=$HOME/lib/pkgconfig

# https://www.gnu.org/software/bash/manual/bashref.html#The-Shopt-Builtin
# No need to use cd anymore: just type the directory!
shopt -s autocd
shopt -s checkjobs
shopt -s dirspell
shopt -s cdspell

#export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
alias tmux='tmux attach || tmux new'
export GREP_OPTIONS="--color"

# No more colorgcc, I rely on gcc4.9 now
#export CC="colorgcc"
#export CXX="color-g++"

# enable color on less
# http://superuser.com/questions/117841/get-colors-in-less-command
export LESSCOLORIZER=pygmentize
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# color man http://nion.modprobe.de/blog/archives/569-colored-manpages.html
 #alias man="TERMINFO=~/.terminfo/ LESS=C TERM=mostlike PAGER=less man"
 # Use colors for less, man, etc.
# http://www.cyberciti.biz/faq/unix-linux-color-man-pages-configuration/
 [[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
 eval "$(lessfile)"
 . ~/bin/cdlast.sh

 if [[ TERM=="xterm" && COLORTERM==gnome* ]]; then
  export TERM="xterm-256color"
fi
