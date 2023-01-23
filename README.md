# Nemo-Actions
Some Nemo Actions

Just some scripts for nemo/Cinnamon

Install git, clone repository, and copy files to your nemo actions directory.
Some nemo scripts need an executable file executing more complex commands. Those files are
placed in a subdirectory called action_scripts. Make sure after installing files inside action_scripts directory have the the execution bit marked.



## verifirma
Script that checks, against pdfsig, the validity of digital signatures in a pdf file.
Script depends on sh, zenity, pdfsig, and awk

## bashrun
Script that runs an sh file in a new terminal windows
Script depends on gnome-terminal

## import_certificate
Script that helps importing a digital certificate into your user certificate store, $HOME/.pki/nssdb
Scripts depends on pk12util (available in linnss3-tools in Debian and derivatives), zenity and sed.
