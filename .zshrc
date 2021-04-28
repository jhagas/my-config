# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history


# NNN quit cd, ^G
n() {
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn "$@"
    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# NNN plugin
export NNN_TRASH=1
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='d:dragdrop;p:preview-tui;g:_ksend $nnn;w:_feh --bg-fill $nnn'
export NNN_BMS='t:~/.local/share/Trash;h:~/;p:~/Pictures;d:~/Downloads;D:~/Documents;w:/run/media/jhagas/DATA/Wallpaper;v:~/Videos;k:/run/media/jhagas/DATA/JHAGAS/KULIAH;f:/run/media/jhagas;m:/run/media/jhagas/DATA/JHAGAS/KULIAH/Mata Kuliah/Semester 2;b:/run/media/jhagas/DATA/JHAGAS/KULIAH/E-book/TEXTBOOK;n:~/Nextcloud2/Notes'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Show hidden

alias vim=nvim

# OpenVPN Management
alias startvpn='openvpn3 session-start --config client.ovpn'
alias stopvpn='openvpn3 session-manage --disconnect --config client.ovpn'

#list
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls'
alias l.="ls -A | egrep '^\.'"

#fix obvious typo's
alias cd..='cd ..'
alias update='sudo pacman -Syyu'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

# Aliases for software managment
alias update='yay -Syyu'

#add new fonts
alias update-fc='sudo fc-cache -fv'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"

#youtube-dl
alias yt-aac="youtube-dl --extract-audio --audio-format aac "
alias yt-best="youtube-dl --extract-audio --audio-format best "
alias yt-flac="youtube-dl --extract-audio --audio-format flac "
alias yt-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yt-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yt-opus="youtube-dl --extract-audio --audio-format opus "
alias yt-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yt-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Opening Messages
hai Jhagas

# Starship Prompt
starship_precmd() {
    STARSHIP_CMD_STATUS=$?
}

# If precmd/preexec arrays are not already set, set them. If we don't do this,
# the code to detect whether starship_precmd is already in precmd_functions will
# fail because the array doesn't exist (and same for starship_preexec)
precmd_functions=()
preexec_functions=()

# If starship precmd/preexec functions are already hooked, don't double-hook them
# to avoid unnecessary performance degradation in nested shells
precmd_functions+=(starship_precmd)
preexec_functions+=(starship_preexec)

# Set up a function to redraw the prompt if the user switches vi modes
starship_zle-keymap-select() {
    zle reset-prompt
}

## Check for existing keymap-select widget.
local existing_keymap_select_fn=$widgets[zle-keymap-select];
# zle-keymap-select is a special widget so it'll be "user:fnName" or nothing. Let's get fnName only.
existing_keymap_select_fn=${existing_keymap_select_fn//user:};
if [[ -z ${existing_keymap_select_fn} ]]; then
    zle -N zle-keymap-select starship_zle-keymap-select;
else
    # Define a wrapper fn to call the original widget fn and then Starship's.
    starship_zle-keymap-select-wrapped() {
        ${existing_keymap_select_fn} "$@";
        starship_zle-keymap-select "$@";
    }
    zle -N zle-keymap-select starship_zle-keymap-select-wrapped;
fi

export STARSHIP_SHELL="zsh"

VIRTUAL_ENV_DISABLE_PROMPT=1

setopt prompt{percent,subst}
PROMPT='$("/usr/bin/starship" prompt --keymap=${KEYMAP} --status=${STARSHIP_CMD_STATUS})'

# Path to your oh-my-zsh installation.
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
