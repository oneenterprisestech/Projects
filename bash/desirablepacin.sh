#!/bin/bash -e

#echo "You should know that you must be root to run this file. Either enter command su and enter your root password, or add *sudo* before the command you used to run this tool. Press ctrl+c to cancel, or press Y to continue."

echo "This program should be run as sudo."

sudo su

read -p "Continue? " continue
case $continue in
[Yy]* ) echo "Continuing...";; 
[Nn]* ) echo "Stopping program..."; exit;;
esac

echo "The following processes will involve setting up this script, which also includes getting support files. Press ctrl+c at any time to cancel. "

echo "This program depends on WGET. WGET will be installed, if it is not already."

sudo apt-get install wget

echo "Creating ~/cfi directory."

sudo mkdir /cfi

echo "Creating ~/cfi/logs directory."

sudo mkdir /cfi/cfi/logs

echo "Creating logfile for the CFI utility in ~/cfi/logs directory."

sudo touch /cfi/cfi/logs/cfi.log

echo "Hello and welcome to the Cool Package Installer! This program installs desirable files from a short (ish) list of applications commonly installed after installation of Linux. Any files that you install via this program should install, but the name of installed files will be written to a log file."

echo "Creating other bash programs at ~/cfi/sh for returning to previous lists. Will remove files when finished in order to preserve space."

cd /cfi/cfi/sh

wget https://oneenterprisestech.github.io/Projects/bash/cfi/sh/list_1.sh

echo "The first five entries (plus a quit option and an ALL option) will show below."

read -p "List 1: Choose one from the below five entries.
         1: Libre Office Writer (Office software similar to Microsoft Word)
         2: GIMP (A fancy image editor)
         3: Dolphin (A file browser)
         4: Clementine (A decent audio player)
         5: Deja-Dup Backup Tool (The name tells you what it is)
         6: Install all
         7: Quit Cool Package Installer
         To choose from the first list, smack the numbers 1-6 to choose. " pac1

case $pac1 in
[1]* ) echo "Installing Libre Office Writer"; sudo apt-get update && sudo apt-get install libreoffice-writer && sudo apt-get dist-upgrade; echo cfi util installed libreoffice-writer at "$(date):" "$@" >> /cfi/logs/cfi.log;;
[2]* ) echo "Installing GNU Image Manipulation Tool"; sudo apt-get update && sudo apt-get install gimp && sudo apt-get dist-upgrade; echo cfi util tried to install gimp at "$(date):" "$@" >> /cfi/logs/cfi.log;;
[3]* ) echo "Installing Dolphin File Manager"; sudo apt-get update && sudo apt-get install dolphin && sudo apt-get dist-upgrade; echo cfi util tried to install dolphin at "$(date):" "$@" >> /cfi/logs/cfi.log;;
[4]* ) echo "Installing Clementine"; sudo apt-get update && sudo apt-get install clementine && sudo apt-get dist-upgrade; echo cfi util tried to install clementine at "$(date):" "$@" >> /cfi/logs/cfi.log;;
[5]* ) echo "Installing Deja-Dup Backup Tool"; sudo apt-get update && sudo apt-get install deja-dup && sudo apt-get dist-upgrade; echo cfi util tried to install deja-dup at "$(date):" "$@" >> /cfi/logs/cfi.log;;
[6]* ) echo "Installing all of the files from the list"; sudo apt-get update && sudo apt-get install libreoffice-writer gimp dolphin clementine deja-dup && sudo apt-get dist-upgrade; echo cfi util tried to install libreoffice-writer, gimp, dolphin, clementine, and deja-dup at "$(date):" "$@" >> /cfi/logs/cfi.log;;
[7]* ) echo "Stopping program..."; exit;;
esac

read -p "Continue to the next list, return to the previous list, or quit? Instructions are below:
          Press R to Return to previous list
          Press N to go to the next list
          Press Q to quit this program " return

case $return in
[Rr]* ) echo "Returning..."; touch /cfi/sh/list_1.sh; bash /cfi/sh;;
[Nn]* ) echo "Continuing...";;
[Qq]* ) echo "Abort."; rm -rf /cfi/sh/list_1.sh; exit;;
esac

echo "The second five entries will show below."

echo "Nothing to see quite yet... :)"

