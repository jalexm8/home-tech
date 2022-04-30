#!/usr/bin/bash

if [[ ! -d ~/archive ]]; then
    mkdir ~/archive
fi

if tar cvzf ~/archive/src.tar.gz ~/src >> /dev/null 2>&1; then
    if rsync -a -e 'ssh -p 69' ~/archive/src.tar.gz 192.168.0.68:/opt/plexmedia/backup >> /dev/null 2>&1; then
        notify-send 'BACKUP COMPLETE' 'Successful backup sent to remote computer.'
    else
        notify-send 'RSYNC FAIL' 'rsync did not copy to remote backup.'
    fi
else
    notify-send 'TAR FAIL' 'The tar command failed, cannot backup.'
fi
