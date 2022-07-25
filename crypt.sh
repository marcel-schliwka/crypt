#!/bin/bash

GPGMAIL=myname@gmail.com

if [ -d "$1" ]; then
    echo "$1 is a directory"
    zip -r "$1.zip" $1
    gpg --recipient $GPGMAIL --encrypt "$1.zip"
    rm "$1.zip"
    exit 0
elif [ -f "$1" ] && [ "$1" != *.gpg ]; then
    echo "$1 is a file"
    gpg --recipient $GPGMAIL --encrypt $1
    exit 0
elif [[ "$1" == *.gpg ]]; then
    echo "Decrypting GPG File"
    gpg -d $1
    exit 0
else
    echo "Check your input! Somethings wrong!"
    exit 1
fi