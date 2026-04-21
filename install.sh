#!/bin/bash
set -e

REPO_URL="https://github.com/deveshkb/fancy_tools.git"
SRC_DIR="$HOME/src/fancy_tools"

# Fonction : ajoute une ligne si elle n'existe pas déjà
add_if_missing() {
    grep -qF "$1" "$HOME/.bashrc" || echo "$1" >> "$HOME/.bashrc"
}

echo "=== Backup .bashrc ==="
cp "$HOME/.bashrc" "$HOME/.bashrc.bak.$(date +%Y%m%d_%H%M%S)"

echo "=== Création de ~/bin ==="
mkdir -p "$HOME/bin"

echo "=== Ajout PATH ==="
add_if_missing 'export PATH="$HOME/bin:$PATH"'

echo "=== Installation aliases ==="
add_if_missing "source $HOME/src/fancy_tools/.aliases"

echo "=== Installation functions ==="
add_if_missing "source $HOME/src/fancy_tools/fancy_functions.sh"

echo "=== Préparation src directory ==="
mkdir -p "$HOME/src"

echo "=== Clonage du repo ==="
if [ ! -d "$SRC_DIR" ]; then
    git clone "$REPO_URL" "$SRC_DIR"
else
    echo "Repo déjà existant, skip clone."
fi

echo "=== Installation terminée ==="
echo "Recharge ton shell avec : source ~/.bashrc"
