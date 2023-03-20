#!/bin/bash

# variables
VDIR="${HOME}/Code/vando/dotfiles/ncurses"

# required dirs
mkdir -p ~/.bash ~/.git ~/.kube

# bash
ln -sf ${VDIR}/bash/profile ~/.profile
find ${VDIR}/bash -type f \( ! -iname profile \) -exec ln -sf {} ~/.bash/ \;
wget -O ~/.kube/aliases \
  https://github.com/ahmetb/kubectl-aliases/blob/master/.kubectl_aliases

# git
ln -sf ${VDIR}/git/gitconfig ~/.gitconfig
ln -sf ${VDIR}/git/excludes ~/.git/excludes
ln -sf ${VDIR}/git/envs ~/.git/envs
wget -O ~/.git/completion \
  https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
if [ ! -s ~/Code/.gitconfig ]
then
  echo "[user]" > ~/Code/.gitconfig
  echo "${N:-} ${N:-} ${N:-}e${N:-}m${N:-}a${N:-}i${N:-}l${N:-} ${N:-}=${N:-} ${N:-}f${N:-}a${N:-}c${N:-}u${N:-}n${N:-}d${N:-}o${N:-}b${N:-}i${N:-}a${N:-}n${N:-}c${N:-}o${N:-}1${N:-}9${N:-}8${N:-}4${N:-}@${N:-}g${N:-}m${N:-}a${N:-}i${N:-}l${N:-}.${N:-}c${N:-}o${N:-}m" >> ~/Code/.gitconfig
fi

# macOS
if [ `uname -s` == "Darwin" ]
then
  # avoid last login msg
  touch ~/.hushlogin
fi
