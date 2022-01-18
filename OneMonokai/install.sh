#!/bin/sh

#  install.sh
#  OneMonokai
#
#  Created by Đỗ Viên on 18/01/2022.
#

declare -r XCODE_DIR=$HOME/Library/Developer/Xcode
declare -r THEME_DIR=$XCODE_DIR/UserData/FontAndColorThemes/
declare -r XCODE_ONEMONOKAI_DIR=$PWD/Xcode-OneMonokai

function msg {
    local text="$1"
    local div_width="80"
    printf "%${div_width}s\n" ' ' | tr ' ' -
    printf "%s\n" "$text"   
}

function install_theme {
    msg "> Clonning theme ...  📦"

    if ! git clone --branch main --depth 1 \
        "git@github.com:cpea2506/Xcode-OneMonokai.git"; then
        echo "Failed to clone repository.";
        exit 1
    fi
}

function setting_theme {
    declare -r ONEMONOKAI_DIR=$XCODE_ONEMONOKAI_DIR/OneMonokai

    msg "> Setting theme ... 🧩"

    mkdir -p $THEME_DIR

    if ! cp $ONEMONOKAI_DIR/OneMonokai.xccolortheme $THEME_DIR; then
        echo "> Failed to install. Please try again! 🚨"
        exit 1
    fi

    echo "> Setting done! ✅"
}

function remove_install_folder {
    msg "> Remove install folder 💣"

    rm -rf $XCODE_ONEMONOKAI_DIR

    echo "> Remove successfully ✅"
}

function main {
    if [ -d $XCODE_DIR ]; then
        install_theme
        setting_theme
        remove_install_folder
        
        echo "> You can restart Xcode now. 👌"
    else
        echo "Xcode not detected. 🚨"
    fi
}

main

