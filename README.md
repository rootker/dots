# :palm_tree: screenshot
# details
> wm : polybar<br>
> shell : bash<br>
> bar : polybar<br>
> terminal : termite <br>
> multi task in terminal : tmux<br>
> browser : firefox
# easy install way
- if you have installed `make`
```bash
# to install packages in arch linux if your not in arch ignore this one
make install-packages

# this will copy files and overight files in configs it will do backup if files there exists
make config
```
# manualy install
### dependish -> `polybar tmux git sxiv mpd ncmpcpp vim zsh bash firefox irssi xclip xsel rsync`
- after you install dependish
1. clone this repo `git clone https://github.com/rootker/dots && cd dots`
- directory hc `hc is link to $HOME/.config/`
- directory hm `hm is link to $HOME wish it on /home/$USER`
- note : `it better to use rsync to copy files if a do update to dots u can pull update and use rsync to copy only modified files`
2. copy whats u want and restart process using `kill -USR1 process-pid`
# i will add more info about bash config
IMPORTANT : im using vim keybinds in bash use esc to enter normal mode

> u can press **arrow up** + **arrow down** for history<br>
> there alot of **alias** read them and use them<br>
> there a **wall function** for setting random <br>
wallpapers using **nitrogen** change default folder in function wall
> 
# tmux

PREFIX key is contrl+a
