PS1="\[\033[1;36m\]\w >\[\033[1;34m\]>\[\033[0m\] "

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

alias dotupdate="cp ~/projects/dotfiles/.bash_profile ~/ && source ~/.bash_profile"
alias allup="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean -y"

ginit() {
  git init --initial-branch=main "$1"
}

create_and_or_open_project() {
  cd ~/projects || mkdir -p ~/projects 2>/dev/null
  cd ~/projects || return
  mkdir "$1" 2>/dev/null
  cd "$1" || return
  if [ ! -d ".git" ]; then
    ginit
  fi
  code .
}

delete_project() {
  current_dir=$(pwd)
  read -n1 -p "Are you sure you want to delete project '$1' ? (y/N): " confirm
  echo ""
  if [ "$confirm" = "y" ]; then
    cd ~/projects || return
    rm -rf "$1"
    cd "$current_dir" || return
    echo "Project at ~/projects/$1 deleted."
  else
    echo "Deletion canceled."
  fi
}

alias proj="create_and_or_open_project"
alias delproj="delete_project"

gonit() {
  go mod init $1
}

ghpub() {
  gh repo create
}

alias ll="ls -la"
alias c="clear"
alias g="git"