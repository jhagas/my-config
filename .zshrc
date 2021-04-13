EDITOR=nvim
export PATH

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


# Path to your oh-my-zsh installation.
export ZSH="/home/jhagas/.oh-my-zsh"

# see https://github.com/ohmyzsh/ohmyzsh/wiki/themes
ZSH_THEME="robbyrussell" 
HYPHEN_INSENSITIVE="true"

# Plugin Load
# Plugins can be found in $ZSH/plugins/
plugins=(zsh-autosuggestions history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Include hidden files in auto/tab complete:
_comp_options+=(globdots)

# Spotify Theming Stuff
export SPICETIFY_INSTALL="~/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

alias vim=nvim

# OpenVPN Management
alias startvpn='openvpn3 session-start --config client.ovpn'
alias stopvpn='openvpn3 session-manage --disconnect --config client.ovpn'


# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Path Definition
lb="/home/jhagas/.local/bin"
data="/home/jhagas/Mount/Data"

# Opening Messages
hai Jhagas

# Starship Prompt
eval "$(starship init zsh)"

