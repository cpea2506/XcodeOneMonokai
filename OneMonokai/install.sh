#!/bin/sh

#  install.sh
#  OneMonokai
#
#  Created by Đỗ Viên on 18/01/2022.
#

XCODE_DIR=$HOME/Library/Developer/Xcode
THEME_DIR=$XCODE_DIR/UserData/FontAndColorThemes/

if [ -d $XCODE_DIR ]; then
    echo "> Setting theme ..."

    mkdir -p $THEME_DIR
    if cp OneMonokai.xccolortheme $THEME_DIR; then
        echo "> Done!"
        echo "> You can restart Xcode now."
    else
        echo "> Failed to install. Please try again!"
    fi
else
    echo "Xcode not detected. 🚨"
fi
