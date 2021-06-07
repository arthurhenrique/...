# base
sudo apt install tmux neovim vim curl git zsh 

# zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# spaceship zsh
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH/themes/spaceship-prompt" --depth=1
ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"

# font firacode
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
sudo apt update
sudo apt install fonts-firacode


# dot files
git clone https://github.com/arthurhenrique/....git
git checkout linux/master

# pyenv
sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
curl https://pyenv.run | bash

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# sdkman
curl -s "https://get.sdkman.io" | bash

