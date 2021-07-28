#!/bin/bash

## Installing BREW package mananger

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" -y &&
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "/Users/$whoami/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"

## Installing CASK apps
brew install --cask iterm2 firefox google-chrome spotify ngrok figma discord transmission
## Installing CLI apps
brew install go httpie htop tldr awscli node tree
npm i -g n
# VS Code
brew install --cask visual-studio-code
## installing extensions vs code
while read -r line; do code --install-extension $line ; done < vscode-list-extensions.txt 
# mongodb
brew tap mongodb/brew
brew install mongodb-community
brew install --cask mongodb-compass
# docker
brew install --cask docker
# nano highlights
git clone git://github.com/serialhex/nano-highlight.git ~/.nano
cp ./.nanorc ~/.nanorc

## Install Ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

brew tap homebrew/cask-fonts
brew install --cask font-powerline-symbols

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1 &&
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

cp ./.zshrc ~/.zshrc
source ~/.zshrc

# setup defaults configs
defaults import com.apple.dock ./defaults/dock.plist ; killall Dock
defaults import com.apple.finder ./defaults/finder.plist
defaults import com.apple.menuextra.clock ./defaults/menuextra.clock.plist
defaults write "Apple Global Domain" "_HIHideMenuBar" -float "1"
defaults write "Apple Global Domain" "AppleAccentColor" -float "-1"

# heroku
brew tap heroku/brew && brew install heroku
heroku autocomplete
printf "$(heroku autocomplete:script zsh)" >> ~/.zshrc; source ~/.zshrc

defaults import com.googlecode.iterm2 ./defaults/iterm2.plist

chsh -s $(command -v zsh)

echo ""
echo ""
echo ""
echo "# # # # # # # # # # # # # # # # # #"
echo "#		Setup Completed		#"
echo "# # # # # # # # # # # # # # # # # #"
echo ""
echo "Now open iterm2 and enjoy your day."
echo ""
echo ""
echo "In case your iterm2 was not correctly config, follow next instructions:"
echo "\t- Press 'cmd + i' and go to 'Colors -> Colors Presets...' and choose 'SpaceGray'"
echo "\t- Press 'cmd + i' and go to 'Text -> Change Font' and select PowerlineSymbolz"
echo ""
echo "That's all, Seeya"
echo "\n\n\n"

