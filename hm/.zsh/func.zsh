function gt() {

# https://github.com/mgechev/dotfiles/blob/a92d09fd70e65137d9756b743ec60a4fbea6025f/.functions#L316-L319
  git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative

}
