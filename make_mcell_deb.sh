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
cd ../..
#tar czf mcell_$version.orig.tar.gz mcell
#mv mcell mcell-$version
mv mcell/src mcell-$version
tar czf mcell_$version.orig.tar.gz mcell-$version
cd mcell-$version
yes | dh_make --single -c gpl2
sed -i 's/Section: unknown/Section: science/' debian/control
sed -i 's|Homepage: .*|Homepage: http://www.mcell.org|' debian/control
# Dependencies are discovered by running dpkg-depcheck -d ../src/configure 
sed -i 's|\(Depends: ${shlibs:Depends}, ${misc:Depends}\)|\1, libsigsegv2:amd64, gawk, m4, flex, mime-support, libfl-dev:amd64|' debian/control
sed -i 's|Description: .*|Description: Monte carlo reaction-diffusion simulator|' debian/control
# Delete placeholder description
sed -i '/<insert/ d' debian/control
# Add long description, wrap line using fold
echo "MCell (Monte Carlo cell) is a program that uses spatially realistic 3-D cellular models and specialized Monte Carlo algorithms to simulate the movements and reactions of molecules within and between cells—cellular microphysiology." | fold -s -w 80 | sed -e 's/\(^.\)/ \1/g' >> debian/control
cp ../rules debian
cp ../changelog debian
cp ../copyright debian
cp ../include-binaries debian/source
rm debian/README.Debian
debuild -us -uc
#fakeroot dpkg-buildpackage -F -us -uc
# Find out if there's anything wrong with our deb
#lintian ../mcell_3.3-1_amd64.deb
