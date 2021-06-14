#!/bin/bash

## Installing BREW package mananger

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" -y &&

## Installing CASK apps
brew install --cask iterm2 firefox google-chrome spotify ngrok figma discord transmission
## Installing CLI apps
brew install go httpie htop tldr awscli node tree
npm i -g n
# VS Code
brew install --cask visual-studio-code
code --install-extension yummygum.city-lights-icon-vsc
code --install-extension yummygum.city-lights-them
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
# mongodb
brew tap mongodb/brew
brew install mongodb-community
brew install --cask mongodb-compass
# docker
brew install --cask docker
# nano highlights
git clone git://github.com/serialhex/nano-highlight.git ~/.nano
cp .nanorc -O ~/.nanorc

## Install Ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp ./zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

brew tap homebrew/cask-fonts
brew install --cask font-powerline-symbols

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1 &&
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# heroku
brew tap heroku/brew && brew install heroku
heroku autocomplete
printf "$(heroku autocomplete:script zsh)" >> ~/.zshrc; source ~/.zshrc

chsh -s $(command -v zsh)

echo "\n\n\n"
echo "# # # # # # # # # # # # # # # # # #"
echo "#		Setup Completed		#"
echo "# # # # # # # # # # # # # # # # # #"
echo ""
echo "Now open iterm2 and follow next instructions:"
echo "\t- Press 'cmd + i' and go to 'Colors -> Colors Presets...' and choose 'SpaceGray'"
echo "\t- Press 'cmd + i' and go to 'Text -> Change Font' and select PowerlineSymbolz"
echo ""
echo "That's all, Seeya"
echo "\n\n\n"

