#! /bin/bash

#Esto es parte de un queño proyecto que estoy haciendo para automatizar la creaciones de documentos para el localhost

#Code

#Ruta one sites-availbles
ruta="/etc/apache2/sites-available/"
#ruta dos 
rutaTwo="/etc/hosts"
echo "Name of new fill of configuration web"

read nameConf #nombre del archivo de configuracion

 # Verifica si el archivo ya existe
if [ -f "$ruta$nameConf" ]; 
then 
  echo "El archivo $nameConf ya existe en la ruta $ruta"
else
  #Crea el archivo en la ruta especificada
  sudo touch "$ruta$nameConf.conf"
  echo "Archivo $nameConf creado en la ruta $ruta"
  #Usamos sudo tee -a para otorgar permiso de administrador y poder escribir
  echo "<VirtualHost *:80>" | sudo tee -a "$ruta$nameConf.conf" #Structur basic
  #Estandar virtualHost
  echo "Nombre de la web(ServerName)"
  read ServerName #here debes decirle el nombre de tu web
  echo "       ServerName $ServerName.es" | sudo tee -a "$ruta$nameConf.conf" 
  echo "Name Fill donde esta el documento web(ServerAdmin)"  
  read ServerAdmin
  echo "       ServerAdmin root@$ServerAdmin.es" | sudo tee -a "$ruta$nameConf.conf" 
  #Por temas de practisidad el serverAlias siempre sera igual a Servernamber , lo ùnico que agregamos son los terminos (www) and (.es)
  echo "       ServerAlias www.$ServerName.es" | sudo tee -a $ruta$nameConf.conf 
 #DocumentRoot
 #Normalmente /var/www/MyFill 
 #Lo que are dado que todas mis web comparten la direcion /var/www/ are que como en ServerAdmin ya puse la carpeta en que estare trabajando se autocomplete. Se puede modificar el la line posterior cambiando la ruta(/var/www/) antes de la variable $ServerAdmin.
 echo "       DocumentRoot /var/www/$ServerAdmin" | sudo tee -a $ruta$nameConf.conf    

 #Como el documento a utilizar puede ser html o php no especificare el formato automaticamente , lo tendra que hacer el usuario.

 echo "archivo index(DirectoryIndex)"
 read DirectoryIndex
 echo "       DirectoryIndex $DirectoryIndex" | sudo tee -a $ruta$nameConf.conf
 echo "</VirtualHost>" | sudo tee -a $ruta$nameConf.conf

 #Cerramos la estructura bàsica de un virtualHost

 #Lo que tenemos que hacer a continuacion es entrar en la carpeta /etc y agregra nuesta ip publica y el nombre , Como la ip publica suele ser la misma en casi todos lados lo capiaremos en texto plano y para el nombre usaremos el ServerAlias
  sudo a2ensite $nameConf 
  echo "
    127.0.0.1            www.$ServerName.es" | sudo tee -a $rutaTwo

 systemctl reload apache2










fi  

