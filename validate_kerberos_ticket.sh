#!/bin/sh

kticket=$(klist | grep UMICH.EDU)


if [ ! -n "$kticket" ]; then
     kinit aniruddh && aklog
fi
