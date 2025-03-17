#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias rm='trash'
alias xcfg='vim ~/.config/xmonad/xmonad.hs'
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
#alias ls='exa --icons'
alias bat='bat --style=auto'
alias update='yay -Syyuu && yay -Scc && paccache -r'
alias uninstall='yay -Rnsu'
alias celar='clear'
alias clera='clear'
alias clears='clear'
alias cleasr='clear'
alias claer='clear'
source $HOME/.local/bin/pacman.sh
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
