#!/usr/bin/env sh

> /etc/peer_config
while read -ra LINE; do
    IP=${LINE#*,}
    DNS=${LINE%%,*}
    HOST=${LINE%%.*}

    PEERS=("${PEERS[@]}" ${DNS})

    echo "${DNS}" >> /etc/peer_config
done

echo ${PEERS}