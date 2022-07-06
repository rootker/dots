# this is my setup 
> im using arch linux i will add dependish later
# some infos

i have bashrc with vim keybinds

> u can press **arrow up** + **arrow down** for history
> there alot of **alias** read them and use them
> there a **wall function** for setting random wallpapers using **nitrogen** change default folder in function wall
> 




## Tmux keybinds

tmux is best thing u can learn to use in linux
- let show some keybinds
```mermaid
sequenceDiagram
C-A ->> Master: Its a master key
Note right of C-A: when u see master it mean CTRL+A.
C-A ->> Master: Master+c it created new window
Note right of C-A: u can later use commend <br>tmux attach, to attach tmux
C-A ->> Master: Master+d detach send tmux to background
C-A ->> Master: Master+r reload tmux config
Note right of C-A: to create split Master+h to horizon Master-v Vertical
C-A ->> Master: Ctrl+hjkl switch focus window
Note right of C-A: read config file for more keybinds

```

let show you how to manager files
```mermaid
graph LR
A[tmux-i3-pol*] -- bashrc --> B((home))
A --> C(.config)
B --> D{install fonts}
C --> D
```
