#!/bin/bash

gco() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Erreur : pas un repo Git"
        return 1
    fi

    if [ -z "$1" ]; then
        echo "Usage : gco 'message'"
        return 1
    fi

    branch=$(git branch --show-current)
    git commit -m "[$branch] $1"
}
