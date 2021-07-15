#-----------------------------
# # keymap
#-----------------------------
bindkey -e

setopt no_flow_control

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

#-----------------------------
# # color
#-----------------------------
autoload -Uz colors
colors

#-----------------------------
# # history
#-----------------------------
HISTSIZE=100

setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_verify

#-----------------------------
# # beep
#-----------------------------
setopt no_beep
setopt no_hist_beep
setopt no_list_beep

#-----------------------------
# # completion
#-----------------------------
autoload -Uz compinit
compinit

setopt list_rows_first

eval $(dircolors -b)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select

#-----------------------------
# # prompt
#-----------------------------
PROMPT='
%B%F{blue}[%D{%H:%M}] %n @ %m
> %d %f%b
%B%# %b'

function reset_prompt_and_accept_line()
{
    zle .reset-prompt
    zle .accept-line
}

zle -N accept-line reset_prompt_and_accept_line

#-----------------------------
# # alias
#-----------------------------
alias tm='tmux'
alias nv='nvim'

alias la='ls -AFX --color'
alias ll='ls -AFX --color -l'
