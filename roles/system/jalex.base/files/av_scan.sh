#!/usr/bin/bash

virusDir="/tmp/virus/"

if [[ ! -d "${virusDir}" ]]; then
    mkdir "${virusDir}"
fi

if freshclam >> /dev/null 2>&1; then
    if clamscan -r --move="${virusDir}" /home/ >> /dev/null 2>&1; then
        notify-send 'VIRUS SCAN COMPLETE' 'No viruses found on the local machine.'
    else
        notify-send 'VIRUS SCAN COMPLETE: VIRUS(s) FOUND' 'Virus(s) found on the local machine.'
    fi
else
    notify-send 'freshclam failed' 'Virus definitions have not been updated.'
fi
