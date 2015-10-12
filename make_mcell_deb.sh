#!/bin/bash

set -e

export DEBFULLNAME="Jacob Czech"
export EMAIL="czech.jacob@gmail.com"
version="3.3"

rm -fr mcell*
git clone https://github.com/mcellteam/mcell
cd mcell
git checkout v$version
rm -fr .git
cd src && ./bootstrap
rm ChangeLog
mv Changelog.md changelog
cd ../..
mv mcell/src mcell-$version
tar czf mcell_$version.orig.tar.gz mcell-$version
cd mcell-$version
yes | dh_make --single -c gpl2
cp ../control debian
cp ../rules debian
cp ../changelog debian
cp ../copyright debian
cp ../include-binaries debian/source
rm debian/README.Debian
debuild -us -uc
