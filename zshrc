#ZSH-CONFIG

#--------------------------------------------------------------------------------------------------------------

#Configuration of ZSH by: pr073c70r
#Version: 1.3
#Last Update: 03.10.2021
#Info: Runs on Openrc
#Dependency: zsh-syntax-highlighting

#--------------------------------------------------------------------------------------------------------------

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/home/pr073c70r/.zshrc'
zmodload zsh/complist
autoload -Uz compinit
compinit

#--------------------------------------------------------------------------------------------------------------

# Lines configured by zsh-newuser-install

HISTFILE=~/.config/.histfile
HISTSIZE=1000
SAVEHIST=1000 
setopt nomatch notify
unsetopt autocd beep extendedglob
bindkey -v

#--------------------------------------------------------------------------------------------------------------

#Configs for Git in Prompt

# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)

autoload -Uz add-zsh-hook vcs_info

# Enable substitution in the prompt.

setopt prompt_subst

# Run vcs_info just before a prompt is displayed (precmd)

add-zsh-hook precmd vcs_info

# Enable checking for (un)staged changes, enabling use of %u and %c

zstyle ':vcs_info:*' check-for-changes true

# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)

zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'

# Set the format of the Git information for vcs_info

zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

#--------------------------------------------------------------------------------------------------------------

#PROMPTS I like and have configured some time ago

PROMPT='%B[%F{#b83939}%n%f%F{255}@%f%F{#006D75}%m%f]%b %B[%F{#ffd800}%~%f%b%B%F{255}]%f%b %B%F{#ffd800}${vcs_info_msg_0_}%f%b'$'\n''%B%F{#b48ead}>%f%b '

#PROMPT='%B[%F{#b83939}%n%f%F{255}@%f%F{#689d6a}%m%f]%b %B[%F{#ffd800}%~%f%b%B%F{255}]%f%b %B%F{#b48ead}>%f%b ' 
#RPROMPT='%B%F{#ffd800}${vcs_info_msg_0_}%f%b' 

#PROMPT='%B[%F{#c51f5d}%n%f%F{255}@%f%F{#43e8d8}%m%f]%b %B[%F{#fff68f}%~%f%b%B%F{255}]%f%b %B%F{#c51f5d}>%f%b ' 
#RPROMPT='%B%F{255}[%f%b%B%F{#c51f5d}%*%f%b%B%F{255}]%f%b'
#RPROMPT='%B%F{255}[%f%b%B%F{#c51f5d}%l%f%b%B%F{255}]%f%b'

#DARK RED AND DEEP BLUE

#PROMPT='%B[%F{#800000}%n%f%F{255}@%f%F{#005577}%m%f]%b %B[%F{#ffd800}%~%f%b%B%F{255}]%f%b %B%F{#800000}>%f%b ' 
#RPROMPT='%B%F{255}[%f%b%B%F{255}%*%f%b%B%F{255}]%f%b'

#NORD

#PROMPT="%B[%F{#bf616a}%n%f%F{255}@%f%F{#88c0d0}%m%f]%b %B[%F{#ebcb8b}%~%f%b%B%F{255}]%f%b %B%F{#b48ead}>%f%b "
#RPROMPT='%B%F{255}[%f%b%B%F{#bf616a}%*%f%b%B%F{255}]%f%b'

#PROMPT='%B[%F{255}%n%f%F{255}@%f%F{255}%m%f]%b %B[%F{255}%~%f%b%B%F{255}]%f%b %B%F{255}>%f%b ' 

#CYBERPUNK

#PROMPT='%B[%F{11}%n%f%F{13}@%f%F{11}%m] [%~]%f %F{13}>%f%b'
#RPROMPT='%B%F{13}[%*]%f%b'

#------------------------------------------------------------------------------------------------------------

#TERMINALCLOCK

#Refresh the Terminalprompt to show running clock
#TMOUT=1
#
#TRAPALRM() {
#	zle reset-prompt
#}

#-------------------------------------------------------------------------------------------------------------

# use the vi keys to navigate the menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


#-------------------------------------------------------------------------------------------------------------

#ALIAS

#Alias for Listings

alias l="ls"
alias la="ls -a"
alias ll="la -l"
alias lr="ls -R" 
alias sl="ls"
alias lla="ls -a -l"
alias lsb="lsblk -a"
alias lsu="lsusb"

#Alias for typos

alias dc="cd"

#Alias for vim-like quitting

alias :q="exit"
alias ZZ="exit"

#Alias for system update

alias syu="doas pacman -Syu && notify-send --urgency=low --expire-time=6000 'upgrading system'" 

#Alias for exitting with quit

alias quit="exit"

#Alias fast command for pinging a website

alias pingg="ping securepoint.de"

#Alias for new article -> LaTeX related; new latex document with article template is created

alias na="cp ~/.LaTeX/template.tex"

#Alias for changing the Output of the XServer to the Outputs HDMI-2 (Dock) and VGA-1 (Dock) when I am at Home at my Desk, sets my Wallpapers to the ones I like. Also sets the Keyboard config to the standart i use (caps:swapescape = swaps caps and escape keys, because on desk I use an external keyboard). 

alias desk="xrandr --output HDMI-2 --auto --left-of LVDS-1 && xrandr --output LVDS-1 --off && xrandr --output VGA-1 --auto --right-of HDMI-2 && xwallpaper --output HDMI-2 --zoom ~/Pictures/Wallpaper/see.jpg --output VGA-1 --zoom ~/Pictures/Wallpaper/see.jpg && setxkbmap -layout de,eu -option caps:swapescape -option 'grp:ctrl_alt_toggle' && notify-send --urgency=low --expire-time=6000 'Switched to desk-setup'"

#Alias for changing the Output of the XServer to the Laptop Screen and sets the Wallpaper to my prefered one.

alias nodesk="xrandr --output HDMI-2 --off && xrandr --output VGA-1 --off && xrandr --output LVDS-1 --auto && xwallpaper --output LVDS-1 --maximize ~/Pictures/Wallpaper/see.jpg && notify-send --urgency=low --expire-time=6000 'Switched to laptop'"
alias onlyVGAondesk="xrandr --output LVDS-1 --off && xrandr --output VGA-1 --auto && xwallpaper --output VGA-1 --zoom ~/Pictures/Wallpaper/see.jpg && setxkbmap -layout de,eu -option caps:swapescape -option 'grp:ctrl_alt_toggle' && notify-send --urgency=low --expire-time=6000 'Switched to only-VGA-mode'"

#Alias for connecting Monitors on the go and setting the Wallpaper 

alias travel="xrandr --output HDMI-1 --auto --right-of LVDS-1 && xwallpaper --output HDMI-1 --maximize Pictures/Wallpaper/see.jpg --output LVDS-1 --maximize Pictures/Wallpaper/see.jpg && notify-send --urgency=low --expire-time=6000 'Switched to travel-setup'" 
alias notravel="xrandr --output HDMI-1 --off && notify-send --urgency=low --expire-time=6000 'Switched to laptop'"

#Alias for swapping the Layout of new connected Keyboards to german with the option of Caps = Escape and Escape = Caps for easier access in Vim and the terminal
alias key="setxkbmap -option caps:swapescape de"

#alias key="setxkbmap -layout de,eu -option caps:swapescape -option 'grp:ctrl_alt_toggle' && notify-send --urgency=low --expire-time=6000 'Set keyboard layout'"

#Shortening to long and common commands

alias cp="cp -iv"
alias mk="mkdir -pv"
alias rm="rm -rfi"

#Alias for vim

alias v="vim"

#Alias for zathura

alias z="zathura"

#Alias for doas typos

#alias sudo="doas"
alias dosa="doas"
alias odas="doas"
alias daos="doas"

#Alias for funny doas 

alias please="doas"
alias fucking="doas"

#Alias for locking the screen and suspending 

alias lock="slock | loginctl suspend"

#--------------------------------------------------------------------------------------------------------------

#Setting the enviromental variables for $EDITOR and $TERMINAL

export EDITOR="vim"
export TERMINAL="st"


#--------------------------------------------------------------------------------------------------------------
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
