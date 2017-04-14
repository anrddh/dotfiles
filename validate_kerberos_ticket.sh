#!/bin/sh

kticket=$(klist | grep UMICH.EDU | grep -v Expired | grep -v Principal)

if [ ! -n "$kticket" ]; then
     kinit aniruddh && aklog
fi
