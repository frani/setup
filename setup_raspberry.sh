#!/bin/bash

apt update
apt upgrade
apt dist-upgrade
apt autoremove

## Installing CLI apps
# Install N (nodejs version manager) and latest nodejs
curl -sL https://git.io/n-install | bash -s -- -q
npm i -g yarn

apt install zsh go httpie tldr awscli n vim transmission

# setup vim 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


## Install Ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
apt install fonts-powerline

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1 &&
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

cp ./.vimrc ~/.vimrc
cp ./.zshrc ~/.zshrc
source ~/.zshrc
chsh -s $(command -v zsh)

echo ""
echo ""
echo ""
echo "# # # # # # # # # # # # # # # # # #"
echo "#		Setup Completed		#"
echo "# # # # # # # # # # # # # # # # # #"
echo ""
echo ""
echo "That's all, Seeya"
echo "\n\n\n"

