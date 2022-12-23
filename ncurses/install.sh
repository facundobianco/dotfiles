#!/bin/bash

VDIR="${HOME}/Code/vando/dotfiles/ncurses"
MDIR="${HOME}/Code/misc"

mkdir -p ~/.bash ~/.git ~/.kube

# bash
ln -sf ${VDIR}/bash/profile ~/.profile
find ${VDIR}/bash -type f \( ! -iname profile \) -exec ln -sf {} ~/.bash/ \;
ln -sf ${MDIR}/kubectl-aliases/.kubectl_aliases ~/.kube/aliases

# git
ln -sf ${VDIR}/git/gitconfig ~/.gitconfig
ln -sf ${VDIR}/git/excludes ~/.git/excludes
ln -sf ${MDIR}/git/contrib/completion/git-completion.bash ~/.git/completion
ln -sf ${VDIR}/git/envs ~/.git/envs
if [ ! -s ~/Code/.gitconfig ]; then
  echo "[user]" > ~/Code/.gitconfig
  echo "${N:-} ${N:-} ${N:-}e${N:-}m${N:-}a${N:-}i${N:-}l${N:-} ${N:-}=${N:-} ${N:-}f${N:-}a${N:-}c${N:-}u${N:-}n${N:-}d${N:-}o${N:-}b${N:-}i${N:-}a${N:-}n${N:-}c${N:-}o${N:-}1${N:-}9${N:-}8${N:-}4${N:-}@${N:-}g${N:-}m${N:-}a${N:-}i${N:-}l${N:-}.${N:-}c${N:-}o${N:-}m" >> ~/Code/.gitconfig
fi

# avoid last login msg
touch ~/.hushlogin
