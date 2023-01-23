#!/bin/bash
certificate=`echo "$@" | sed 's/\\\ / /g'`
Password=$(zenity --entry \
--width=400 \
--title="Importar Certificado " \
--text="Introduzca Contraseña del Certificado" \
--hide-text)
[[ -z $Password ]] && { zenity --error --title="Error"  ; exit 1; }  
touch $HOME/.importcert_passwd
chmod 600 $HOME/.importcert_passwd
echo $Password > $HOME/.importcert_passwd
pk12util -d sql:$HOME/.pki/nssdb -i "$certificate" -w $HOME/.importcert_passwd 
if [ $? -eq 0 ]; then
	zenity --notification --window-icon="info" \
	--text="Importación Correcta"
else
	zenity --notification --window-icon="error" \
	--text="Error Importando. ¿Es la contraseña correcta?"
fi
rm -f $HOME/.importcert_passwd


