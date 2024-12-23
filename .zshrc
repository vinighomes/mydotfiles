# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#config history
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP  

#habilit ctrl 
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

#Scroll with mouse when many things on screen terminal
TranslateWheelToCursor=on
DisableWheelToCursorByCtrl=on

#aliases
#alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias rm='trash'
alias xmonadcfg='vim ~/.xmonad/xmonad.hs'
alias blockcfg='sudo vim /etc/lightdm/slick-greeter.conf'
alias zshrc='source ~/.zshrc'
alias dunstfy='notify-send'
#alias adsf='asdf'
alias ncmp='ncmpcpp'
alias youtvd="mpv --ytdl-format='bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'" 
alias youtms="mpv --ytdl-format='bestaudio[ext=m4a]/best'" 
alias playrock="youtms 'https://www.youtube.com/watch?v=kXYiU_JCYtU&list=PL_Q15fKxrBb7wo5SRxHbhk6ZL6zMYh5tH'"
alias downms='yt-dlp -x --audio-format mp3 --audio-quality 0'
alias downml='yt-dlp -x --audio-format mp3 --audio-quality 128k'
alias downvd='yt-dlp -vU -S vcodec:h264,res:1080,acodec:m4a'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias ls='exa --icons'
alias bat='bat --style=auto'
alias update='yay -Syyuu && yay -Scc'
alias celar='clear'
alias clera='clear'
alias clears='clear'

# exporting path
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH

# some plugs zsh
source $HOME/.local/bin/pacman.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(~/.local/bin/mise activate zsh)"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
