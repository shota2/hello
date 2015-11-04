#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Modified from Michael Smalley's blog, to take care of plugins a la Vundle
# See issue #253 on Vundle.vim
# This does my setup for everything non-linux-related (should merge at some point)/
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
#files="vimrc vim gitconfig bash_profile zshrc"    # list of files/folders to symlink in homedir
#Other version would be nice with no shared machines (see wiki setup)
files="vimrc vim bash_profile zshrc gitconfig"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file ~/dotfiles_old/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done

#Isa's modification: Install Vundle and all plugins
echo "Installing Vundle.."
echo ""
mkdir -p $dir/vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git $dir/vim/bundle/Vundle.vim
vim +PluginInstall +qall
