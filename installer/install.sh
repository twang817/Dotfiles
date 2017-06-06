#!/bin/bash

INSTALL_DIR=${1:-$HOME/.dotfiles}
case "$INSTALL_DIR" in
    /*) INSTALL_DIR=$INSTALL_DIR ;;
    *) INSTALL_DIR=$PWD/$INSTALL_DIR ;;
esac

type git &> /dev/null || {
    echo "ERROR: git not found"
    exit 1
}

if [ ! -e "$INSTALL_DIR" ]; then
    mkdir -p $INSTALL_DIR
    git clone https://github.com/twang817/dotfiles.git "$INSTALL_DIR"
fi

$INSTALL_DIR/installer/init.sh

echo Done.
