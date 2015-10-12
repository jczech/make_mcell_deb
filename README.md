Making a Deb File for MCell
===========================

This repository simplifies the process of building an MCell deb file for Ubuntu
or Debian.

Dependencies
----------------------------------

Install the dependencies, by typing the following:

    sudo apt-get install make-dh
    sudo apt-get install devscripts

How To Use
----------------------------------

Just run ``./make_mcell_deb.sh``

Installing Deb
----------------------------------

As with any other deb file, you just need to use dpkg like this:

    sudo dpkg -i mcell_3.3-1_amd64.deb

Inspect Deb
----------------------------------

To see where the deb file is going to install everything, run this command:

    dpkg-deb -c mcell_3.3-1_amd64.deb

You may want to check the deb for bugs and policy violations:

    lintian mcell_3.3-1_amd64.deb

Filling in the debian/control file
----------------------------------

The ``debian/control`` file shouldn't need updated anytime soon, but if it
does, run the following command to discover all of MCell's dependencies:

    dpkg-depcheck -d ../src/configure
