export PATH=$HOME/bin:$HOME/.local/bin:$HOME/go/bin:$HOME/.node_modules/bin/:/home/$USER/.local/share/gem/ruby/3.0.0/bin:$PATH
export BROWSER=$([ '$(pidof firefox)' = "" ] && export BROWSER=google-chrome-stable || export BROWSER=firefox)
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export XDG_CACHE_HOME=$HOME/.cache/
export XDG_CONFIG_HOME=$HOME
#export LIBGL_ALWAYS_SOFTWARE=true
#export XDG_RUNTIME_DIR=~
#export XDG_DATA_DIRS=~
#export XDG_CONFIG_DIRS=~
export XDG_CONFIG_HOME="$HOME/.config"
export FFF_COL1=1
export FFF_OPENER="opn"
export FFF_W3M_XOFFSET=30
export FFF_W3M_YOFFSET=10
export FFF_FAV1=~/Downloads
export FFF_FAV2=~/Documents
export FFF_FAV3=~/Pictures
export FFF_FAV4=~/Programs
export FFF_FAV5=~/Videos
export FFF_FAV6=/mnt/
export LESS_TERMCAP_mb=$'\e[0;33m'
export LESS_TERMCAP_md=$'\e[0;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[0;34;32m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[0;31m'
# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
# https://consoledonottrack.com/
export DO_NOT_TRACK=1
export ADBLOCK="true"
# open anyfile end in one of those in vim
alias -s {yml,yaml,ini,py,php,go,pl}=vim
# some commmand G string
#alias -g G='| grep -i'
REPORTTIME=7

source ~/.zsh/keybinds
source ~/.zsh/sudo.plugin.zsh
# PS1 is the prompt
# secondary prompt, printed when the shell needs more information to complete a
# command.
PS2='\`%_> '
# selection prompt used within a select loop.
PS3='?# '
# the execution trace prompt (setopt xtrace). default: '+%N:%i>'
PS4='+%N:%i:%_> '

preexec() {
    preexec_called=1
}
function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=' '
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    echo "$EXIT_CODE_PROMPT"
  fi
}
precmd() {
    if [ "$?" != 0 ] && [ "$preexec_called" = 1 ]; then
        unset preexec_called
        export PS1="%F{blue}%n%f 🥀 (%/) %F{red}⦁%f "
        #RPROMPT='%F{red}%(?..[%?] )✘%f'
        RPROMPT='%F{red}✘%f'
    else

        export PS1="%F{blue}%n%f 🥀 (%/) %F{green}⦁%f "
#        PROMPT='%B%F{blue}%1~%f%b%F{blue} > %F{black}'
        RPROMPT=''
    fi
}
alias xl="cat $ca | head -1 | xargs -o rm -vi" 
alias xm="cat $ca | head -1 | xargs -o mv -v ~/Pictures/favs/"
alias ...='cd ../../'
# listing stuff
#a2# Execute \kbd{ls -lSrah}
alias dir="command ls -lSrah"
#a2# Only show dot-directories
alias lad='command ls -d .*(/)'
#a2# Only show dot-files
alias lsa='command ls -a .*(.)'
#a2# Only files with setgid/setuid/sticky flag
alias lss='command ls -l *(s,S,t)'
#a2# Only show symlinks
alias lsl='command ls -l *(@)'
#a2# Display only executables
alias lsx='command ls -l *(*)'
#a2# Display world-{readable,writable,executable} files
alias lsw='command ls -ld *(R,W,X.^ND/)'
#a2# Display the ten biggest files
alias lsbig="command ls -flh *(.OL[1,10])"
#a2# Only show directories
alias lsd='command ls -d *(/)'
#a2# Only show empty directories
alias lse='command ls -d *(/^F)'
#a2# Display the ten newest files
alias lsnew="command ls -rtlh *(D.om[1,10])"
#a2# Display the ten oldest files
alias lsold="command ls -rtlh *(D.Om[1,10])"
#a2# Display the ten smallest files
alias lssmall="command ls -Srl *(.oL[1,10])"
#a2# Display the ten newest directories and ten newest .directories
alias lsnewdir="command ls -rthdl *(/om[1,10]) .*(D/om[1,10])"
#a2# Display the ten oldest directories and ten oldest .directories
alias lsolddir="command ls -rthdl *(/Om[1,10]) .*(D/Om[1,10])"

#a2# Remove current empty directory. Execute \kbd{cd ..; rmdir \$OLDCWD}
alias rmcdir='cd ..; rmdir $OLDPWD || cd $OLDPWD'

#a2# ssh with StrictHostKeyChecking=no \\&\quad and UserKnownHostsFile unset
alias insecssh='ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null"'
#a2# scp with StrictHostKeyChecking=no \\&\quad and UserKnownHostsFile unset
alias insecscp='scp -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null"'

export LS_COLORS='ow=01;33:no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
export LS_COLORS
#complete -cf mousepad nano bash sudo pacman
#source "$HOME/.cache/wal/colors.sh"
# HSTR configuration - add this to ~/.bashrc
#alias sydrop="encfs ~/Dropbox/ ~/Private;rsync -azP ~/.config/i3"
alias mwin="mount -t cifs -o username=snake //192.168.1.13/Users /mnt/myshare" 
alias ker="cd ~/gits/rootker/"
alias s='sudo '
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias anakin="sudo pacman -Rns \$(pacman -Qtdq)"
alias rsync="rsync -arAX --delete "
#alias sudo='sudo -p "$(printf "\033[1;31mPassword: \033[0;0m" )"'
alias rel="kill -USR1 -x $1"
alias bak="mv $2 -vi $2.bak "
alias quotes='curl -s "https://api.quotable.io/random?maxLength=20|funny" | jq '.content' | cut -d "\"" -f 2'
alias vbash="vim ~/.bashrc"
alias ree="redshift -P -O 8500"
alias load="pgrep -x $1 2>/dev/null | xargs kill -USR1"
alias vpol="vim ~/.config/polybar/config.ini"
alias ranger="python ~/compile/ranger/ranger.py"
alias ..="cd ../../"
alias ...="cd ../../../../".
alias ...="cd ../../../".
alias 2="cd ../../"
alias 3="cd ../../../"
alias 4="cd ../../../../"
alias 5="cd ../../../../../"
alias 6="cd ../../../../../../ "
alias Mem="free -mh | awk '/^Mem/ {print $3}'"
alias vi3="vim ~/.config/i3/config"
alias vpolybar="vim ~/.config/polybar"
alias rep="pgrep polybar|xargs kill -USR1"
alias psize="expac -S -H M '%k\t%n' "
alias upshut="pacman -Syu --noconfirm && shutdown now"
alias ports="netstat -tulanp"
alias mountc="mount |column -t"
alias lsd="ls -ld -- */"
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias pi="curl icanhazip.com"
alias v="vim"
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -a' 
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias nightly="firefox-nightly"
alias sf='cls;screenfetch;~/scripts/colors-hex'
alias cls=' echo -ne "\033c"'
alias ll="ls -la"
alias ytdl="youtube-dl -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' --prefer-free-formats"
alias ytmp3='youtube-dl --extract-audio --audio-format mp3'
alias screenkey="screenkey -f 'DejaVu Sans Mono Book 22' -p bottom --bg-color '#2f343f' --font-color '#f3f4f5'"
alias whats="apropos"
alias S="sudo systemctl start"
alias S_="sudo systemctl status"
alias S-="sudo systemctl stop"
alias S@="sudo systemctl restart "
alias S+="sudo systemctl enable"
alias sx="systemctl start --user"
alias s_="systemctl status --user"
alias s-="systemctl stop --user"
alias s@="systemctl restart --user"
alias s+="systemctl enable --user"
alias sn='netstat -tanpu'
alias rl="source ~/.bashrc"
alias co="ifconfig tun0 | awk 'NR==2 {print \$2}' | xclip -selection c"
alias p5='php56 -S 127.0.0.1:8010 2>/home/marmathe/.marmathe_php_logs & disown'
alias xc='xclip -selection clipboard -in'          # cut to clipboard
alias vo='xclip -selection clipboard -out'         # paste from clipboard
alias riwd='sudo systemctl restart iwd'
alias arserv='aria2c --enable-rpc --rpc-listen-all'
alias random_wall='ls -d "$PWD/work/wallpapers/MW"/*|uniq|sort -R|head -1|xargs nitrogen --set-zoom-fill|xargs tee ~/wall'
alias fake1g='fallocate -l 1G test.img'
alias whats='apropos'
alias dig='drill'
alias listaur="pacman -Qm"
alias cc='xclip -selection clipboard -in -filter'  # copy clipboard
alias userlist="cut -d: -f1 /etc/passwd"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias insults='wget http://www.randominsults.net -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias excuses='echo `telnet bofh.jeffballard.us 666 2>/dev/null` |grep --color -o "Your excuse is:.*$"'     # excuses
alias freechess='telnet fics.freechess.org 5000'                  # connects to a telnet server for free internet chess
alias funfacts='wget http://www.randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias busy='for i in `seq 0 100`;do timeout 6 dialog --gauge "Install..." 6 40 "$i";done' # pretend to be busy in office to enjoy a cup of coffee
alias busy2='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'
alias busy3='cat /dev/urandom | hexdump -C | highlight ca fe 3d 42 e1 b3 ae f8 | perl -MTime::HiRes -pnE "Time::HiRes::usleep(rand()*1000000)"'
#alias 'tmux'='wmux -f ~/.dotfiles/tmux/tm.conf'
alias ls='ls --classify --tabsize=0 --group-directories-first --literal --color=auto --show-control-chars --human-readable'
#alias 'ls'='exa -a --icons'
alias 'irssi'='irssi --config ~/.irssi/config --home ~/.irssi/'
alias 'lswifi'="iwctl station wlan0 get-networks"
alias 'tmuxhide'='tmux -f ~/.tmux_hidden.conf'
alias 'wpa_cli'='wpa_cli -iwlan0'
alias gc="git clone $1"
alias 'gs'='git status'
alias 'ga'='git add'
alias 'gm'='git commit -m'
alias 'gp'='git push'
#alias go='git push -u origin $1'
alias 'm'='mpv -- "$(pwd)/"'
alias pick="gpick -osp"
alias 'b'='light -S'
alias 'bat'='cat /sys/class/power_supply/BAT0/capacity /sys/class/power_supply/BAT0/status'
alias 'update'='sudo pacman -Syu'
alias 'add'='sudo pacman -S'
alias 'del'='sudo pacman -Rcns'
alias ser='pacman -Ss'
alias sb='vim ~/.bashrc'
alias sf='vim ~/.func'
alias si3='vim ~/.config/i3/config'
alias tree='tree -dA'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias lanip='ip route get 1 | head -1 | cut -d " " -f7'
# Get the default gateway's (router's) IP address.  See <https://serverfault.com/q/31170>.
alias anakin="sudo pacman -Rns \$(pacman -Qtdq)"
alias neofetch="clear; neofetch"
alias refugees="pacman -Qm"
alias fixwifi="sudo modprobe -r iwlmvm; sudo modprobe iwlmvm"
alias yeah="yes"
alias 'mv'='mv -i'
alias 'cp'='cp -i'
#PROMPT=$'\n› '
# watch for everyone but me and root
watch=(notme root)
# automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH
# auto complete zsh
autoload -U compinit; compinit
# because it's required for share_history.
setopt share_history
setopt append_history
# save each command's beginning timestamp and the duration to the history file
setopt extended_history
# remove command lines from the history list when the first character on the
# line is a space
setopt histignorespace
# if a command is issued that can't be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt auto_cd
# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob
# display PID when suspending processes as well
setopt longlistjobs
# report the status of backgrounds jobs immediately
setopt notify
# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all
# not just at the end
setopt completeinword
# Don't send SIGHUP to background processes when the shell exits.
setopt nohup
# make cd push the old directory onto the directory stack.
setopt auto_pushd
# avoid "beep"ing
setopt nobeep
# don't push the same dir twice.
setopt pushd_ignore_dups
# * shouldn't match dotfiles. ever.
setopt noglobdots
# use zsh style word splitting
setopt noshwordsplit
# don't error out when unset parameters are used
setopt unset

# My alias
alias reload="source ~/.zshrc"

# setting some default values
typeset -ga ls_options
typeset -ga grep_options

# Colors on GNU ls(1)
if ls --color=auto / >/dev/null 2>&1; then
    ls_options+=( --color=auto )
# Colors on FreeBSD and OSX ls(1)
elif ls -G / >/dev/null 2>&1; then
    ls_options+=( -G )
fi
function xcat () {
    emulate -L zsh
    if (( ${#argv} != 1 )) ; then
        printf 'usage: xcat FILE\n' >&2
        return 1
    fi

    [[ -r $1 ]] && cat $1
    return 0
}
# functions
function xsource () {
    if (( ${#argv} < 1 )) ; then
        printf 'usage: xsource FILE(s)...\n' >&2
        return 1
    fi

    while (( ${#argv} > 0 )) ; do
        [[ -r "$1" ]] && source "$1"
        shift
    done
    return 0
}
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*' special-dirs ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
/usr/local/bin  \
/usr/sbin       \
/usr/bin        \
/sbin           \
/bin            \
/usr/X11R6/bin

    # complete manual by their section
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select
# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
# Ignore completion functions for commands you don't have:
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'
# define files to ignore for zcompile
zstyle ':completion:*:*:zcompile:*'    ignored-patterns '(*~|*.zwc)'
zstyle ':completion:correct:'          prompt 'correct to: %e'
# set format for warnings
zstyle ':completion:*:warnings'        format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
# provide verbose completion information
zstyle ':completion:*'                 verbose true
# recent (as of Dec 2007) zsh versions are able to provide descriptions
# for commands (read: 1st word in the line) that it will list for the user
# to choose from. The following disables that, because it's not exactly fast.
zstyle ':completion:*:-command-:*:'    verbose false
# on processes completion complete all user processes
zstyle ':completion:*:processes'       command 'ps -au$USER'
# describe options in full
zstyle ':completion:*:options'         description 'yes'
zstyle ':completion:*:messages'        format '%d'
zstyle ':completion:*:options'         auto-description '%d'
# separate matches into groups
zstyle ':completion:*:matches'         group 'yes'
zstyle ':completion:*'                 group-name ''
# match uppercase from lowercase
zstyle ':completion:*'                 matcher-list 'm:{a-z}={A-Z}'
# ignore duplicate entries
zstyle ':completion:*:history-words'   remove-all-dups yes
zstyle ':completion:*:history-words'   stop yes
# activate menu
zstyle ':completion:*:history-words'   menu yes
# format on completion
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
# activate color-completion
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}
# start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*'       insert-unambiguous true
zstyle ':completion:*:corrections'     format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*'       original true
# allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:'    max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'
# command for process lists, the local web server details and host completion
zstyle ':completion:*:urls' local 'www' '/var/www/' 'public_html'
zstyle ':completion:*' use-cache  yes
zstyle ':completion:*:complete:*' cache-path "~/.cache/Wall/"
function is42 () {
    [[ $ZSH_VERSION == 4.<2->* || $ZSH_VERSION == <5->* ]] && return 0
    return 1
}
if is42 ; then
        [[ -r ~/.ssh/config ]] && _ssh_config_hosts=(${${(s: :)${(ps:\t:)${${(@M)${(f)"$(<$HOME/.ssh/config)"}:#Host *}#Host }}}:#*[*?]*}) || _ssh_config_hosts=()
        [[ -r ~/.ssh/known_hosts ]] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
        [[ -r /etc/hosts ]] && [[ "$NOETCHOSTS" -eq 0 ]] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(grep -v '^0\.0\.0.\0\|^127\.0\.0\.1\|^::1 ' /etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
    else
        _ssh_config_hosts=()
        _ssh_hosts=()
        _etc_hosts=()
fi

#local localname
localname="$(uname -n)"
hosts=(
        "${localname}"
        "$_ssh_config_hosts[@]"
        "$_ssh_hosts[@]"
        "$_etc_hosts[@]"
        localhost
    )

# use generic completion system for programs not yet defined; (_gnu_generic works
# with commands that provide a --help option with "standard" gnu-like output.)
for compcom in cp deborphan df feh fetchipac gpasswd head hnb ipacsum mv \
            pal stow uname ; do
        [[ -z ${_comps[$compcom]} ]] && compdef _gnu_generic ${compcom}
done; unset compcom

# see upgrade function in this file
compdef _hosts upgrade

# Use emacs-like key bindings by default:
bindkey -e
# Custom widgets:

## beginning-of-line OR beginning-of-buffer OR beginning of history
## by: Bart Schaefer <schaefer@brasslantern.com>, Bernhard Tittelbach
TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}
function beginning-or-end-of-somewhere () {
    local hno=$HISTNO
    if [[ ( "${LBUFFER[-1]}" == $'\n' && "${WIDGET}" == beginning-of* ) || \
      ( "${RBUFFER[1]}" == $'\n' && "${WIDGET}" == end-of* ) ]]; then
        zle .${WIDGET:s/somewhere/buffer-or-history/} "$@"
    else
        zle .${WIDGET:s/somewhere/line-hist/} "$@"
        if (( HISTNO != hno )); then
            zle .${WIDGET:s/somewhere/buffer-or-history/} "$@"
        fi
    fi
}
zle -N beginning-of-somewhere beginning-or-end-of-somewhere
zle -N end-of-somewhere beginning-or-end-of-somewhere
function commit-to-history () {
    print -rs ${(z)BUFFER}
    zle send-break
}
zle -N commit-to-history
function slash-backward-kill-word () {
    local WORDCHARS="${WORDCHARS:s@/@}"
    # zle backward-word
    zle backward-kill-word
}
zle -N slash-backward-kill-word

# press esc-m for inserting last typed word again (thanks to caphuso!)
function insert-last-typed-word () { zle insert-last-word -- 0 -1 };
zle -N insert-last-typed-word;

# run command line as user root via sudo:
function sudo-command-line () {
    [[ -z $BUFFER ]] && zle up-history
    local cmd="sudo "
    if [[ ${BUFFER} == ${cmd}* ]]; then
        CURSOR=$(( CURSOR-${#cmd} ))
        BUFFER="${BUFFER#$cmd}"
    else
        BUFFER="${cmd}${BUFFER}"
        CURSOR=$(( CURSOR+${#cmd} ))
    fi
    zle reset-prompt
}
zle -N sudo-command-line
### jump behind the first word on the cmdline.
### useful to add options.
function jump_after_first_word () {
    local words
    words=(${(z)BUFFER})

    if (( ${#words} <= 1 )) ; then
        CURSOR=${#BUFFER}
    else
        CURSOR=${#${words[1]}}
    fi
}
zle -N jump_after_first_word

if [[ "$TERM" != dumb ]]; then
    #a1# List files with colors (\kbd{ls \ldots})
    alias ls="command ls ${ls_options:+${ls_options[*]}}"
    #a1# List all files, with colors (\kbd{ls -la \ldots})
    alias la="command ls -la ${ls_options:+${ls_options[*]}}"
    #a1# List files with long colored list, without dotfiles (\kbd{ls -l \ldots})
    alias ll="command ls -l ${ls_options:+${ls_options[*]}}"
    #a1# List files with long colored list, human readable sizes (\kbd{ls -hAl \ldots})
    alias lh="command ls -hAl ${ls_options:+${ls_options[*]}}"
    #a1# List files with long colored list, append qualifier to filenames (\kbd{ls -l \ldots})\\&\quad(\kbd{/} for directories, \kbd{@} for symlinks ...)
    alias l="command ls -l ${ls_options:+${ls_options[*]}}"
else
    alias la='command ls -la'
    alias ll='command ls -l'
    alias lh='command ls -hAl'
    alias l='command ls -l'
fi

# 'hash' some often used directories
#d# start
hash -d deb=/var/cache/apt/archives
hash -d doc=/usr/share/doc
hash -d linux=/lib/modules/$(command uname -r)/build/
hash -d log=/var/log
hash -d slog=/var/log/syslog
hash -d src=/usr/src
hash -d www=/var/www
#d# end

# use ip from iproute2 with color support
if ip -color=auto addr show dev lo >/dev/null 2>&1; then
    alias ip='command ip -color=auto'
fi

if [[ -r /proc/mdstat ]]; then
    alias mdstat='cat /proc/mdstat'
fi

# creates an alias and precedes the command with
# sudo if $EUID is not zero.
# use /var/log/syslog iff present, fallback to journalctl otherwise
if [ -e /var/log/syslog ] ; then
  #a1# Take a look at the syslog: \kbd{\$PAGER /var/log/syslog || journalctl}
  salias llog="$PAGER /var/log/syslog"     # take a look at the syslog
  #a1# Take a look at the syslog: \kbd{tail -f /var/log/syslog || journalctl}
  salias tlog="tail -f /var/log/syslog"    # follow the syslog
elif command -v journalctl >/dev/null; then
  salias llog="journalctl"
  salias tlog="journalctl -f"
fi

#f1# Reload an autoloadable function
function freload () { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }
compdef _functions freload

function edalias () {
    [[ -z "$1" ]] && { echo "Usage: edalias <alias_to_edit>" ; return 1 } || vared aliases'[$1]' ;
}
compdef _aliases edalias

function edfunc () {
    [[ -z "$1" ]] && { echo "Usage: edfunc <function_to_edit>" ; return 1 } || zed -f "$1" ;
}
compdef _functions edfunc

#f1# Provides useful information on globbing
function H-Glob () {
    echo -e "
    /      directories
    .      plain files
    @      symbolic links
    =      sockets
    p      named pipes (FIFOs)
    *      executable plain files (0100)
    %      device files (character or block special)
    %b     block special files
    %c     character special files
    r      owner-readable files (0400)
    w      owner-writable files (0200)
    x      owner-executable files (0100)
    A      group-readable files (0040)
    I      group-writable files (0020)
    E      group-executable files (0010)
    R      world-readable files (0004)
    W      world-writable files (0002)
    X      world-executable files (0001)
    s      setuid files (04000)
    S      setgid files (02000)
    t      files with the sticky bit (01000)

  print *(m-1)          # Files modified up to a day ago
  print *(a1)           # Files accessed a day ago
  print *(@)            # Just symlinks
  print *(Lk+50)        # Files bigger than 50 kilobytes
  print *(Lk-50)        # Files smaller than 50 kilobytes
  print **/*.c          # All *.c files recursively starting in \$PWD
  print **/*.c~file.c   # Same as above, but excluding 'file.c'
  print (foo|bar).*     # Files starting with 'foo' or 'bar'
  print *~*.*           # All Files that do not contain a dot
  chmod 644 *(.^x)      # make all plain non-executable files publically readable
  print -l *(.c|.h)     # Lists *.c and *.h
  print **/*(g:users:)  # Recursively match all files that are owned by group 'users'
  echo /proc/*/cwd(:h:t:s/self//) # Analogous to >ps ax | awk '{print $1}'<"
}
alias help-zshglob=H-Glob

# grep for running process, like: 'any vim'
function any () {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any <keyword>" >&2 ; return 1
    else
        ps xauwww | grep -i "${grep_options[@]}" "[${1[1]}]${1[2,-1]}"
    fi
}

ssl_hashes=(aes-256-cbc aria-128-cbc )

for sh in ${ssl_hashes}; do
    eval 'enc-'${sh}'() {
        emulate -L zsh
        if [[ -z $1 ]] ; then
            printf '\''usage: %s <file>\n'\'' "ssh-cert-'${sh}'"
            return 1
        fi
        openssl enc -'${sh}' -in $1 -out $1.enc
    }'
done; unset sh

function bk () {
    emulate -L zsh
    local current_date=$(date -u "+%Y%m%dT%H%M%SZ")
    local clean keep move verbose result all to_bk
    setopt extended_glob
    keep=1
    while getopts ":hacmrv" opt; do
        case $opt in
            a) (( all++ ));;
            c) unset move clean && (( ++keep ));;
            m) unset keep clean && (( ++move ));;
            r) unset move keep && (( ++clean ));;
            v) verbose="-v";;
            \?) bk -h >&2; return 1;;
        esac
    done
    shift "$((OPTIND-1))"
    if (( keep > 0 )); then
            for to_bk in "$@"; do
                cp $verbose -pR "${to_bk%/}" "${to_bk%/}_$current_date"
                (( result += $? ))
            done
        fi
    if (( move > 0 )); then
        while (( $# > 0 )); do
            mv $verbose "${1%/}" "${1%/}_$current_date"
            (( result += $? ))
            shift
        done
    elif (( clean > 0 )); then
        if (( $# > 0 )); then
            for to_bk in "$@"; do
                rm $verbose -rf "${to_bk%/}"_[0-9](#c8)T([0-1][0-9]|2[0-3])([0-5][0-9])(#c2)Z
                (( result += $? ))
            done
        else
            if (( all > 0 )); then
                rm $verbose -rf *_[0-9](#c8)T([0-1][0-9]|2[0-3])([0-5][0-9])(#c2)Z(D)
            else
                rm $verbose -rf *_[0-9](#c8)T([0-1][0-9]|2[0-3])([0-5][0-9])(#c2)Z
            fi
            (( result += $? ))
        fi
    fi
    return $result
}

function cl () {
    emulate -L zsh
    cd $1 && ls -a
}

# smart cd function, allows switching to /etc when running 'cd /etc/fstab'
function cd () {
    if (( ${#argv} == 1 )) && [[ -f ${1} ]]; then
        [[ ! -e ${1:h} ]] && return 1
        print "Correcting ${1} to ${1:h}"
        builtin cd ${1:h}
    else
        builtin cd "$@"
    fi
}

#f5# Create Directory and \kbd{cd} to it
function mkcd () {
    if (( ARGC != 1 )); then
        printf 'usage: mkcd <new-directory>\n'
        return 1;
    fi
    if [[ ! -d "$1" ]]; then
        command mkdir -p "$1"
    else
        printf '`%s'\'' already exists: cd-ing.\n' "$1"
    fi
    builtin cd "$1"
}

#f5# Create temporary directory and \kbd{cd} to it
function cdt () {
    builtin cd "$(mktemp -d)"
    builtin pwd
}

#f5# List files which have been accessed within the last {\it n} days, {\it n} defaults to 1
function accessed () {
    emulate -L zsh
    print -l -- *(a-${1:-1})
}

#f5# List files which have been changed within the last {\it n} days, {\it n} defaults to 1
function changed () {
    emulate -L zsh
    print -l -- *(c-${1:-1})
}

#f5# List files which have been modified within the last {\it n} days, {\it n} defaults to 1
function modified () {
    emulate -L zsh
    print -l -- *(m-${1:-1})
}

#f2# Find history events by search pattern and list them by date.
function whatwhen () {
    emulate -L zsh
    local usage help ident format_l format_s first_char remain first last
    usage='USAGE: whatwhen [options] <searchstring> <search range>'
    help='Use `whatwhen -h'\'' for further explanations.'
    ident=${(l,${#${:-Usage: }},, ,)}
    format_l="${ident}%s\t\t\t%s\n"
    format_s="${format_l//(\\t)##/\\t}"
    # Make the first char of the word to search for case
    # insensitive; e.g. [aA]
    first_char=[${(L)1[1]}${(U)1[1]}]
    remain=${1[2,-1]}
    # Default search range is `-100'.
    first=${2:-\-100}
    # Optional, just used for `<first> <last>' given.
    last=$3
    case $1 in
        ("")
            printf '%s\n\n' 'ERROR: No search string specified. Aborting.'
            printf '%s\n%s\n\n' ${usage} ${help} && return 1
        ;;
        (-h)
            printf '%s\n\n' ${usage}
            print 'OPTIONS:'
            printf $format_l '-h' 'show help text'
            print '\f'
            print 'SEARCH RANGE:'
            printf $format_l "'0'" 'the whole history,'
            printf $format_l '-<n>' 'offset to the current history number; (default: -100)'
            printf $format_s '<[-]first> [<last>]' 'just searching within a give range'
            printf '\n%s\n' 'EXAMPLES:'
            printf ${format_l/(\\t)/} 'whatwhen grml' '# Range is set to -100 by default.'
            printf $format_l 'whatwhen zsh -250'
            printf $format_l 'whatwhen foo 1 99'
        ;;
        (\?)
            printf '%s\n%s\n\n' ${usage} ${help} && return 1
        ;;
        (*)
            # -l list results on stout rather than invoking $EDITOR.
            # -i Print dates as in YYYY-MM-DD.
            # -m Search for a - quoted - pattern within the history.
            fc -li -m "*${first_char}${remain}*" $first $last
        ;;
    esac
}

function cpstat()
{
    local pid="${1:-$(pgrep -xn cp)}" src dst
    [[ "$pid" ]] || return
    while [[ -f "/proc/$pid/fd/3" ]]; do
        read src dst < <(stat -L --printf '%s ' "/proc/$pid/fd/"{3,4})
        (( src )) || break
        printf 'cp %d%%\r' $((dst*100/src))
        sleep 1
    done
    echo
}

function think() {
dropthink="$HOME/Dropbox/linux/Thinkpad"
if [ ! -d $dropthink ];then
    echo "Directory not exits"
    return 1
#    if [ -z $1 ];then
#        ls $dropthink
#    else 
#        ls $dropthink | find $dropthink -name *$1* -type f | xargs -o vim
#    fi
fi
case $1 in
        -edit | -e ) ls $dropthink | find $dropthink -name *$2* -type f | xargs -o vim ;;
        -delete | -d ) find $dropthink -name *$2* -type f -exec rm -vi {} \; && echo "files donededede" || echo "somthing wrong" ;;
        -dir ) find $dropthink -name *$2* -type d -exec rm -rvi {} \; ;; 
        -list | -l ) ls $dropthink ;;
        -mkdir | -m ) mkdir $dropthink/$2 && echo "$2 directory created" || echo "somthing wrong";;
        -file | -f ) touch $2 $dropthink ;;
        -go | -g ) cd $dropthink ;;
        * ) ls $dropthink ;;
esac
}

run_bg() {
    nohup $@ > /dev/null 2>&1 &
}

+x() {
if [ -z "$1" ];then
    echo "Usage : +x filename"
    return 0
else
    chmod +x $1 2>/dev/null && echo -e "u can now run \e[1;31m$1\e[0m" || echo -e "\e[1;31m[!]\e[0m File \e[1;31m$1\e[0m Does't exits"
    return 0
fi
}

adbcurrent() {
  adb shell "dumpsys activity activities | grep mResumedActivity" | perl -pe 's/.+(com.+?)\/.*/$1/'
}

detectcam() {
    for d in /dev/video*; do
        v=`v4l2-ctl --device=$d -D --list-formats`
        if [[ $v == *"LifeCam Cinema"* ]]; then
            echo $d
        fi
    done
}

shred() {
    BYTES=`wc -c < "$@"`
    for i in `seq 1 7`; do
        dd if=/dev/urandom of="$@" bs=$BYTES count=1 conv=notrunc status=none
    done
    rm -f "$@"
}

function wall() {
    lastdir="/home/$USER/.cache/Wall/"
    ca="$lastdir/.lastpath"
    default="/home/$USER/gits/wallpapers/MW"
    animewl="$HOME/Pictures/anime"
    #touch $ca
    if [[ "$1" == "-l" ]];then
        if ! -d $lastdir;then
            mkdir $lastdir
        else
            echo "Cannot Create Dir $?"
        fi
        read -p "ENTER PATH _> " path
        if ! -d $path;then
           echo "Dir Not Exits"
           exit
       else
           echo $path > $cachefile
        fi
    fi
   if [[ "$1" == "-r" ]];then
    if [[ "$2" == "del" ]];then
        cat $ca | head -1 | xargs -o rm -vi 
        return 1
    fi 
	if [[ "$2" == "anime" ]];then
        imagename=$(/bin/ls -Rt -d -1 $animewl/* | egrep '.jpg$|\.png$|\.jpeg$|.webmp' | shuf | head -1)
        nitrogen --set-zoom-fill $imagename --save 2>/dev/null|| echo "somthing wrong" 
        echo "[+] Wallpaper Have Been Set Succefull..."
        echo "[!] Wallpaper Path : $imagename" 
        echo $imagename >> $ca
        return 0
	fi
    if [[ -d "$defualt" ]];then
        echo "Directory Not Found"
        return 1
    fi
    if [[ -z $2 ]];then
        def="/home/$USER/gits/walls/"
        imagename=$(find ${def}* -type f | egrep '.jpg$|\.png$|\.jpeg$|.webmp' | shuf | head -1)
        nitrogen --set-zoom-fill $imagename --save 2>/dev/null|| echo "somthing wrong" 
        echo "[+] Wallpaper Have Been Set Succefull..."
        echo "[!] Wallpaper Path : $imagename"
        echo $imagename > $ca
        return 0
    fi
        #/bin/ls -Rt -d -1 $default/{*,.*} | egrep '.jpg$|\.png$|\.jpeg$|.webmp' | shufb81f369cccadd5ab17f81a8ab3daeb44de6 | head -1|xargs nitrogen --set-tiled 2>/dev/null
        imagename=$(/bin/ls -Rt -d -1 $2/* | egrep '.jpg$|\.png$|\.jpeg$|.webmp' | shuf | head -1)
        nitrogen --set-zoom-fill $imagename --save 2>/dev/null|| echo "somthing wrong" 
        echo "[+] Wallpaper Have Been Set Succefull..."
        echo "[!] Wallpaper Path : $imagename"
        echo $imagename > $ca
        return 0
       if [ $? != 0 ];then
            echo "There Unkown Error $#"
   fi
    fi
    if [[ ! -z $1 ]];then
        dir=$(pwd)
        find $1 -type f |  egrep '.jpg$|\.png$|\.jpeg$|.webmp' | shuf | head -1 > $ca 
        cat $ca | xargs nitrogen --set-zoom-fill --save 
        echo "[!] wallpaper is $(cat $ca)" 
    return 0
    fi
  read -p "Enter Directory Name : " dir
    if [[ "${dir:-$default}" == "" ]];then
        echo "U have to Enter Dir"
    elif [[ $# != 0 ]];then
        echo "There Unkown Error"
    else
      /bin/ls -Rt -d -1 ${dir:-$default}/* | egrep '.jpg$|\.png$|\.jpeg$|.webmp' | shuf | head -1|xargs nitrogen --set-zoom-fill --save
    return 0
    fi
}

log_history() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') $HOSTNAME:$$ $PWD ($1) $(history 1)" >> $MYHISTFILE
}


cpv() {
    rsync -pogbr -hhh --backup-dir="/tmp/rsync-${USERNAME}" -e /dev/null --progress "$@"
}
compdef _files cpv
