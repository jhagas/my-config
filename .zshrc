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
zmodload zsh/datetime
zmodload zsh/mathfunc

__starship_get_time() {
(( STARSHIP_CAPTURED_TIME = int(rint(EPOCHREALTIME * 1000)) ))
    }

starship_precmd() {
    STARSHIP_CMD_STATUS=$?
    if (( ${+STARSHIP_START_TIME} )); then
        __starship_get_time && (( STARSHIP_DURATION = STARSHIP_CAPTURED_TIME - STARSHIP_START_TIME ))
        unset STARSHIP_START_TIME
    else
        unset STARSHIP_DURATION
    fi
}
starship_preexec() {
    __starship_get_time && STARSHIP_START_TIME=$STARSHIP_CAPTURED_TIME
}

precmd_functions=()
preexec_functions=()

if [[ -z ${precmd_functions[(re)starship_precmd]} ]]; then
    precmd_functions+=(starship_precmd)
fi
if [[ -z ${preexec_function[(re)starship_preexec]} ]]; then
    preexec_functions+=(starship_preexec)
fi

starship_zle-keymap-select() {
    zle reset-prompt
}

local existing_keymap_select_fn=$widgets[zle-keymap-select];
existing_keymap_select_fn=${existing_keymap_select_fn//user:};
if [[ -z ${existing_keymap_select_fn} ]]; then
    zle -N zle-keymap-select starship_zle-keymap-select;
else
    starship_zle-keymap-select-wrapped() {
        ${existing_keymap_select_fn} "$@";
        starship_zle-keymap-select "$@";
    }
    zle -N zle-keymap-select starship_zle-keymap-select-wrapped;
fi

__starship_get_time && STARSHIP_START_TIME=$STARSHIP_CAPTURED_TIME

export STARSHIP_SHELL="zsh"

STARSHIP_SESSION_KEY="$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM";
STARSHIP_SESSION_KEY="${STARSHIP_SESSION_KEY}0000000000000000"
export STARSHIP_SESSION_KEY=${STARSHIP_SESSION_KEY:0:16};

VIRTUAL_ENV_DISABLE_PROMPT=1

setopt prompt{percent,subst}
PROMPT='$("/usr/bin/starship" prompt --keymap=${KEYMAP} --status=${STARSHIP_CMD_STATUS})'


# Path to your oh-my-zsh installation.
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
