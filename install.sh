#!/bin/bash

APPS=(
  # Dev
  wget
  git
  visual-studio-code
  python
  uv
  docker
  
  # General
  firefox
  iterm2
  zsh
  zsh-completions
  zsh-autosuggestions
  font-fira-code-nerd-font
  starship
  spotify
  sublime-text
)



# Install Homebrew if not installed
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)" # Ensure it's in the PATH
fi

# Update & Upgrade Homebrew
echo "Updating and upgrading Homebrew..."
brew update
brew upgrade

# Function to check if a package is a cask
is_cask() {
    brew info --cask "$1" &>/dev/null
}

# Install Applications (Determining Formula or Cask)
echo "Installing applications..."
for app in "${APPS[@]}"; do
    if brew list --formula | grep -q "^$app\$"; then
        echo "$app is already installed (Formula)."
    elif brew list --cask | grep -q "^$app\$"; then
        echo "$app is already installed (Cask)."
    else
        if is_cask "$app"; then
            echo "Installing $app as a cask..."
            brew install --cask "$app"
        else
            echo "Installing $app as a formula..."
            brew install "$app"
        fi
    fi
done

# Cleanup
echo "Running brew cleanup..."
brew cleanup

echo "Installation complete!"
