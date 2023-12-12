 ### ApacheSctipt
 ## Instalaciòn 
  
  Primero tendremos que poner este comando como administrador en nuestra termi    nal para poder usar el script
  ``sh
  sudo chown -R $USER:$USER /var/www/
 ```
 Luego en la misma carpeta donde los descargamos.le daremos permiso para que     actue como un ejecutable
 ``sh
 chmod +x apache.sh
 ```
 Luego lo ejecutamos(asi es en linux)
 ```sh
 ./apache.sh
 ```
 Lo primero que ara sera :
 Preguntarnos el nombre del archivo .conf que querramos crear, no tenemos que     poner la terminaciòn .conf es automatico.
 Luego nos pedira nuestra contraseña, ya que es un acciòn que requiere de per    misos de super usuario.
 Luego el ServerName sin (.es).
 Luego el nombre donde està ubicado nuestra pagina,no es necesario colocar /v    ar/www/ ya que es automatico y en caso que tu web no se encuentre ahi es muy     fàcil editar el còdigo.
 Luego el index al que SI HAY QUE PONERLE SU TIPO DE DATO(ejem : php o html)
 ### listo 
 
 a tenemos nuestra estructura rapido y simple solo con colocar dos o tres car    acteres.

