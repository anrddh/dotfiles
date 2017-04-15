#!/bin/sh

kticket=$(klist | grep UMICH.EDU | grep -v Expired | grep -v Principal)

if [ ! -n "$kticket" ]; then
     security find-generic-password -a aniruddh -s um_kerb -w | kinit --password-file=STDIN aniruddh && aklog
fi
