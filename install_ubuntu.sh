#!/bin/bash

set -e

# Atualizando repositórios
sudo apt update -y
sudo apt upgrade -y

# Instalando pacotes essenciais
sudo apt install -y \
    build-essential \
    git \
    neovim \
    zsh \
    unzip \
    curl \
    fzf \
    ripgrep \
    fd-find \
    bat \
    fonts-jetbrains-mono \
    python3 \
    python3-pip

# Ajustes de nomes de pacotes Debian
# Renomear fd e bat, pois no Ubuntu eles possuem nomes diferentes
sudo ln -s /usr/bin/fdfind /usr/local/bin/fd || true
sudo ln -s /usr/bin/batcat /usr/local/bin/bat || true

# Instalar Zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Instalar e configurar NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Criando novo .bashrc
rm -f ~/.bashrc

echo 'export EDITOR=nvim' >> ~/.bashrc
echo 'export VISUAL=nvim' >> ~/.bashrc

echo 'alias ll="eza -lha --group-directories-first"' >> ~/.bashrc
echo 'alias la="eza -a"' >> ~/.bashrc
echo 'alias ls="eza"' >> ~/.bashrc

echo 'alias cat="bat --paging=never --style=plain"' >> ~/.bashrc

echo 'alias vi="nvim"' >> ~/.bashrc
echo 'alias vim="nvim"' >> ~/.bashrc
echo 'alias svi="sudo nvim"' >> ~/.bashrc

echo 'alias grep="rg"' >> ~/.bashrc

echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc

mkdir -p ~/.config/nvim/

source ~/.bashrc
