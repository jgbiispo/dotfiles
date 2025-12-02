#!/bin/bash

# install essential packages
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel --noconfirm
sudo pacman -S eza git neovim zsh zoxide unzip bat fd ripgrep starship procs --noconfirm
sudo pacman -S nerd-fonts-jetbrains-mono --noconfirm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# install yay (AUR helper)
# check if yay is already installed
if ! command -v yay &> /dev/null
then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi  

yay -Syu --noconfirm


# Adicionando as config ao .bashrc

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
echo 'eval "$(starship init bash)"' >> ~/.bashrc
echo '\. "$HOME/.nvm/nvm.sh"' >> ~/.bashrc
mkdir -p ~/.config/nvim/ 

rm -f ~/.config/starship.toml

echo 'add_newline = true' >> ~/.config/starship.toml
echo 'format = "[$directory]($style) $git_branch $git_state $git_status"' >> ~/.config/starship.toml
echo '[directory]' >> ~/.config/starship.toml
echo 'truncation_length = 3' >> ~/.config/starship.toml
echo 'truncation_symbol = "…/"' >> ~/.config/starship.toml
echo '[git_branch]' >> ~/.config/starship.toml
echo 'symbol = "| "' >> ~/.config/starship.toml
echo '[git_status]' >> ~/.config/starship.toml
echo 'conflicted = "≠"' >> ~/.config/starship.toml
echo 'deleted = "✘"' >> ~/.config/starship.toml
echo 'modified = "●"' >> ~/.config/starship.toml
echo 'staged = "✔ "' >> ~/.config/starship.toml
echo 'untracked = "★"' >> ~/.config/starship.toml 

source $HOME/.bashrc
