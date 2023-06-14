# FARMACIA_DIGITAL

CONTEXTO

Este proyecto consiste en un servicio enfocado en brindar asistencia en los tratamientos médicos de los adultos mayores. Surge de la necesidad de contar con datos de seguimiento precisos de los pacientes de este grupo de edad, con el objetivo de obtener información sobre el stock de medicamentos, la duración de los tratamientos, las recetas médicas y otros datos proporcionados por la aplicación. Para acceder a este servicio, es necesario ponerse en contacto con el administrador del sitio web. Dado que se manejan datos sensibles de los pacientes, no cualquier persona puede tener acceso a la aplicación. Por lo tanto, a través de este contacto, los usuarios pueden registrarse y se les asignará un perfil dentro de la aplicación. Este método se implementa para garantizar la veracidad de la información recopilada.

CONFIGURACIONES:

La aplicación se ha desarrollado utilizando el framework Django y está programada en Python. Está configurada para utilizar el motor de base de datos Oracle y se ejecutará en un servidor local.

Para poder ejecutar la aplicación, es necesario tener instalados Django 4.1, Python 3.10 y Oracle 19c. Es importante destacar que se deben utilizar estas versiones específicas. Se recomienda trabajar en un entorno de desarrollo virtual, ya que el archivo requirements.txt contiene la versión de Django que se utilizará. A continuación, se proporcionarán los enlaces necesarios para realizar las instalaciones.

PYTHON: https://www.python.org/downloads/
DJANGO: https://www.djangoproject.com/download/
VIRTUAL-ENV: https://docs.python.org/es/3/tutorial/venv.html
ORACLE: https://www.oracle.com/cl/database/technologies/oracle19c-windows-downloads.html

Una vez que hayamos descargado todo, procederemos a clonar el repositorio en GitHub. Para ello, abre la consola bash en el directorio en el que deseas clonar el repositorio y ejecuta el siguiente comando en la consola:

        git clone https://github.com/Deevcode/FARMACIA_DIGITAL.git .

Una vez que hayas clonado el repositorio, abre la carpeta en tu editor de código preferido. A continuación, crea un archivo llamado ".env" en la raíz del proyecto. En este archivo, deberás configurar el acceso a la base de datos. Por motivos de seguridad, utilizamos variables de entorno para esta configuración de información sensible. Es importante destacar que este proyecto está diseñado para mostrar una demostración del aplicativo.


