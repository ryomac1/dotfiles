#!/bin/bash

# Install Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed."
fi

# Install Nodebrew
if ! command -v nodebrew &> /dev/null; then
    echo "Installing Nodebrew..."
    curl -L git.io/nodebrew | perl - setup
    export PATH="$HOME/.nodebrew/current/bin:$PATH"
    nodebrew install-binary stable
    nodebrew use stable
else
    echo "Nodebrew is already installed."
fi

# Install Rye
if ! command -v rye &> /dev/null; then
    echo "Installing Rye..."
    curl -sSf https://rye-up.com/install.sh | bash
    source "$HOME/.rye/env"
else
    echo "Rye is already installed."
fi

# Install uv
if ! command -v uv &> /dev/null; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
else
    echo "uv is already installed."
fi

# Install Zinit
if [ ! -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]; then
    echo "Installing Zinit..."
    mkdir -p "$HOME/.local/share/zinit"
    chmod g-rwX "$HOME/.local/share/zinit"
    git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git"
else
    echo "Zinit is already installed."
fi

# Install necessary Homebrew packages
if ! brew list git &>/dev/null; then
    echo "Installing git..."
    brew install git
else
    echo "git is already installed."
fi

if ! brew list zsh-git-prompt &>/dev/null; then
    echo "Installing zsh-git-prompt..."
    brew install zsh-git-prompt
else
    echo "zsh-git-prompt is already installed."
fi

# Backup existing files and create symbolic links
backup_message=""

if [ -f "$HOME/.alias" ]; then
    mv "$HOME/.alias" "$HOME/.alias.bk"
    backup_message+="Backup created for .alias as .alias.bk\n"
fi

if [ -f "$HOME/.function" ]; then
    mv "$HOME/.function" "$HOME/.function.bk"
    backup_message+="Backup created for .function as .function.bk\n"
fi

if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.bk"
    backup_message+="Backup created for .zshrc as .zshrc.bk\n"
fi

ln -sf "$(pwd)/.alias" "$HOME/.alias"
ln -sf "$(pwd)/.function" "$HOME/.function"
ln -sf "$(pwd)/.zshrc" "$HOME/.zshrc"

echo "Installation is complete and symbolic links have been created."

if [ -n "$backup_message" ]; then
    echo -e "$backup_message"
fi

echo "Please add any necessary settings to .zshrc."

