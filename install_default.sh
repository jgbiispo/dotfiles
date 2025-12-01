#!/bin/bash


# install essential packages
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel --noconfirm
sudo pacman -S eza git neovim zsh zoxide bat fd ripgrep starship procs --noconfirm
sudo pacman -S ttf-fira-code ttf-jetbrains-mono noto-fonts-emoji --noconfirm

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

echo 'export EDITOR=nvim' >> ~/.bashrc
echo 'export VISUAL=nvim' >> ~/.bashrc

echo 'alias ll="eza -lha --group-directories-first --icons"' >> ~/.bashrc
echo 'alias la="eza -a --icons"' >> ~/.bashrc
echo 'alias ls="eza --icons"' >> ~/.bashrc

echo 'alias cat="bat --paging=never --style=plain"' >> ~/.bashrc

echo 'alias vi="nvim"' >> ~/.bashrc
echo 'alias vim="nvim"' >> ~/.bashrc
echo 'alias svi="sudo nvim"' >> ~/.bashrc

echo 'alias grep="rg"' >> ~/.bashrc

echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
echo 'eval "$(starship init bash)"' >> ~/.bashrc
mkdir -p ~/.config/nvim/ 

echo 'add_newline = true' >> ~/.config/starship.toml
echo 'format = "[$directory]($style) $git_branch $git_state $git_status"' >> ~/.config/starship.toml
echo '[directory]' >> ~/.config/starship.toml
echo 'truncation_length = 3' >> ~/.config/starship.toml
echo 'truncation_symbol = "…/"' >> ~/.config/starship.toml
echo '[git_branch]' >> ~/.config/starship.toml
echo 'symbol = " "' >> ~/.config/starship.toml
echo '[git_status]' >> ~/.config/starship.toml
echo 'conflicted = "≠"' >> ~/.config/starship.toml
echo 'deleted = "✘"' >> ~/.config/starship.toml
echo 'modified = "●"' >> ~/.config/starship.toml
echo 'staged = "✔"' >> ~/.config/starship.toml
echo 'untracked = "★"' >> ~/.config/starship.toml 



source ~/.bashrc
