# Proyecto_Final_Entorno
## Objetivo

Este repositorio fue creado con la intencion de almacenar todos los archivos ralacionados al proyecto de la materia "entorno de programacion"

Se busca ejecutar un contenedor de docker que presente un menu de seleccion el cual permita ingresar una rchivo de texto, y luego seleccionar un script con el cual analizar el texto

## Uso

### Clonación
se debe clonar este repositorio en el equipo host del usuario, desde la terminal de comandos de su equipo puede ejecutar el comando siguiente:

```git clone https://github.com/Shannon-21/Proyecto_Final_Entorno.git```

Luego acceder con su nombre de usuario de Github y clave

Situarse en el nuevo directorio en su equipo host, y ejecute el comando ```ll``` para verificar que los archivos de este repositorio han sido copiados en su equipo

### Docker
Antes de iniciar debe asegurarse de que dokerd este activo. Puede activarlo con el comando ```sudo systemctl start docker```

Ahora debe contruir una imagen a partir del archivo *Dockerfile* usando el comando siguiente:

```docker build -t <image_name> .```

Ejemplo: ``` docker build -t text_analysis .```

Asegurese de ejecutar el comando estando situado sobre el directorio ```Proyecto_Final_Entorno```

### Ejecución
Ahora debe ejecutar el comando siguiente para correr la aplicacion dentro de un contenedor:

```docker run -it <image_name>```

Este comando debe mostrar una salida como la siguiente:

```
Que archivo de texto desea analizar?: prueba.txt
Con que script desea analizar el archivo prueba.txt?
1) Salir	      3) statsUsageWords    5) statsSentences
2) statsWords	      4) findNames	    6) blankLinesCounter
Elija: 1
Hasta luego...
```

