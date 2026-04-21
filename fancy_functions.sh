#!/bin/bash

gco() {
    # Vérifie si on est dans un repo git
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Erreur : ce n'est pas un dépôt Git."
        return 1
    fi

    # Vérifie si un message est fourni
    if [ -z "$1" ]; then
        echo "Usage : gco 'message de commit'"
        return 1
    fi

    # Récupère le nom de la branche
    branch=$(git branch --show-current)

    # Commit formaté
    git commit -m "[$branch] $1"
}
