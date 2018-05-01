#!/usr/bin/env bash

# A little script to sync the latest sources because of some temp work

device=a3y17lte
common=exynos7870-common
device_path=device/samsung
manifest=https://github.com/$device/manifest
prompt="Pick an option :"

title="Want you to sync"
options=(yes no)
echo $title
PS3=$prompt

select option in ${options[@]};
    do
    case $REPLY in
    1 ) echo "syncing"
        rm -rf .repo/local_manifests
        git clone $manifest .repo/local_manifests
        repo sync --force-sync
        rm -rf $device_path/$device/sepolicy $device_path/$common/sepolicy/*
        git clone https://github.com/$device/sepolicy $device_path/$device/sepolicy
        echo "You can now build for your $device" ;break;;
        2 ) echo Goodbye!;sleep 2 && exit;;
    *) echo $check;continue;;
    esac
done
