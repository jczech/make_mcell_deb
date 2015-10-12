Making a Deb File for MCell
===========================

This repository simplifies the process of building an MCell deb file for Ubuntu
or Debian.

Dependencies:
---------------------------

Need to fill this section in.

How To Use:
---------------------------

Just run ``./make_mcell_deb.sh``

Installing Deb:
---------------------------

As with any other deb, you just need to use dpkg like this:

  sudo dpkg -i mcell_3.3-1_amd64.deb

Check Contents of Deb:
---------------------------

To see where the deb file is going to install everything, run this command:

  dpkg-deb -c mcell_3.3-1_amd64.deb
