# Laboratorio MongoDB - Bases de Datos Avanzadas (Electiva)
## Instituto Tecnológico de Costa Rica
## Área Académica de Ingeniería en Computadores

## Pre-Requisitos

### Instalación de cURL
cURL es una herramienta para transferir datos desde o hacia un servidor, utilizando uno de los protocolos compatibles (DICT, ARCHIVO, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMB, SMBS, SMTP, SMTPS, TELNET y TFTP). El comando está diseñado para funcionar sin la interacción del usuario.

``` bash
$ sudo apt-get install curl
```

### Instalación Node Version Manager (NVM)
NVM permite instalar diferentes versiones de Node, además la manera en que guarda las versiones de Node soluciona los problemas de permisos que el usuario se puede enfrentar al instalarlo a través de su manejador de paquetes. Solo es necesario descargar y ejecutar el script, con la línea.

``` bash
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
```

Luego de su instalación, el proceso más sencillo es cerrar la terminal y volverla a abrir.
Para verificar necesitamos una línea de código.
``` bash
$ command -v nvm
```
### Instalación de Node
Se instala la versión más reciente de Node LTS (Long Term Support).
``` bash
$ nvm install 6.11
```
Es posible observar la versión específica de Node instalada con el siguiente comando.
``` bash
$ node -v
```

Actualizar el Node Package Manager (NPM).
``` bash
$ npm install -g npm
```

### Instalar MongoDB 

La instlación de MongoDB varía según la distribución de Linux, por lo cual se recomienda seguir los pasos de la [Página Oficial](https://docs.mongodb.com/manual/administration/install-on-linux/).


### Instalar Yeoman
``` bash
$ npm install -g yo
```

### Instalar el generador meanjs de Yeoman
``` bash
$ npm install -g generator-meanjs
```

## Instalación
Basta con ejecutar el generador de MEAN.JS de Yeoman.
``` bash
$ yo meanjs
```
Se debe seleccionar la opción de master y completar la información requerida.

## Ejecución de la aplicación

### Ejecutar la base de datos de MongoDB
Primero se necesita que el servidor o Daemon de MongoDB esté ejecutándose, dependiendo de la instalción esto se puede conseguir con distitos comandos, en mi caso basta con: 
``` bash
$ sudo mongod
```

### Ejecución del servidor de nodemon 
Abrir la carpeta del Proyecto desde la terminal y ejecutar el comando:
``` bash
$ npm run dev
```

El servidor que le SO le asigne un puerto, en caso de que no suceda por defecto escuchará en el puerto 3000

### Ejecución de la aplicaión web
Vaya a su navegador y abra la dirección del localhost en el puerto 3000
``` bash
http://localhost:3000
```
Se abrirá una página web que puede usar a su disposición.
