#!/bin/bash

## Installing BREW package mananger

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" -y &&

## Installing cask apps
brew install --cask iterm2 firefox google-chrome spotify ngrok figma discord transmission
brew install go httpie htop tldr awscli
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
brew install docker
brew install --cask docker
# nano highlights
git clone git://github.com/serialhex/nano-highlight.git ~/.nano
cp .nanorc -O ~/.nanorc

## Install Ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp ./zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

brew tap homebrew/cask-fonts
brew install --cask font-powerline-symbols

echo "\n# # # # # # # # # # # # # # # # # # # # # # #\n"
echo "Complete your iterm2 style Set up console do: \n\n\t- Press 'cmd + i' and go to 'Colors -> Colors Presets...' and choose 'SpaceGray'\n\t- Press 'cmd + i' and go to 'Text -> Change Font' and select PowerlineSymbolz"
echo "\n# # # # # # # # # # # # # # # # # # # # # # #\n"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1 &&
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# heroku 
brew tap heroku/brew && brew install heroku
heroku autocomplete
printf "$(heroku autocomplete:script zsh)" >> ~/.zshrc; source ~/.zshrc

# Node
brew install node
# and node N manager
npm i -g n
