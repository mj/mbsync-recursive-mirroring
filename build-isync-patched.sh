#!/bin/sh

test -d tmp && rm -r tmp/*
test -d tmp || mkdir tmp

cd tmp

apt-get source isync

cd isync-1.0.4

patch -p0 < ../../recursive_imap.diff

dpkg-buildpackage -rfakeroot -uc -b

cd ..
mv isync_1.0.4-2.1_amd64.deb ../
cd ..
rm -r tmp

exit 0
