# FARMACIA_DIGITAL

CONTEXTO.

Este proyecto consiste en un servicio enfocado en brindar asistencia en los tratamientos médicos de los adultos mayores. Surge de la necesidad de contar con datos de seguimiento precisos de los pacientes de este grupo de edad, con el objetivo de obtener información sobre el stock de medicamentos, la duración de los tratamientos, las recetas médicas y otros datos proporcionados por la aplicación. Para acceder a este servicio, es necesario ponerse en contacto con el administrador del sitio web. Dado que se manejan datos sensibles de los pacientes, no cualquier persona puede tener acceso a la aplicación. Por lo tanto, a través de este contacto, los usuarios pueden registrarse y se les asignará un perfil dentro de la aplicación. Este método se implementa para garantizar la veracidad de la información recopilada.

CONFIGURACIONES:

La aplicación se ha desarrollado utilizando el framework Django y está programada en Python. Está configurada para utilizar el motor de base de datos Oracle y se ejecutará en un servidor local.

Para poder ejecutar la aplicación, es necesario tener instalados Django 4.1, Python 3.10 y Oracle 19c. Es importante destacar que se deben utilizar estas versiones específicas. Se recomienda trabajar en un entorno de desarrollo virtual, ya que el archivo requirements.txt contiene la versión de Django que se utilizará. A continuación, se proporcionarán los enlaces necesarios para realizar las instalaciones.

        PYTHON: https://www.python.org/downloads/
        DJANGO: https://www.djangoproject.com/download/
        VIRTUAL-ENV: https://docs.python.org/es/3/tutorial/venv.html
        ORACLE: https://www.oracle.com/cl/database/technologies/oracle19c-windows-downloads.html
        SQLDEVELOPER: https://www.oracle.com/database/sqldeveloper/technologies/download/

Una vez que hayamos descargado todo, procederemos a clonar el repositorio en GitHub. Para ello, abre la consola bash en el directorio en el que deseas clonar el repositorio y ejecuta el siguiente comando en la consola:

        git clone https://github.com/Deevcode/FARMACIA_DIGITAL.git .

Una vez que hayas clonado el repositorio, abre la carpeta en tu editor de código preferido. A continuación, crea un archivo llamado ".env" en la raíz del proyecto. En este archivo, deberás configurar el acceso a la base de datos. Por motivos de seguridad, utilizamos variables de entorno para esta configuración de información sensible. Es importante destacar que este proyecto está diseñado para mostrar una demostración del aplicativo.

![archivos destacados](https://github.com/Deevcode/FARMACIA_DIGITAL/assets/67532450/414cd473-ed1a-4ee1-942a-add824481724)

![env](https://github.com/Deevcode/FARMACIA_DIGITAL/assets/67532450/0c3fdfac-20db-43f5-959c-960acf5fe6c8)

Ahora creamos nuestros entornos viruales de desarrollo, en este caso crearemos uno llamado farmacia.

        virtualenv farmacia
        
Luego activamos el entorno de desarrollo con el siguiente comando.
 
        farmacia\Scripts\activate
 
Ahora que has creado el entorno, procedemos a instalar todas las dependencias del proyecto que se encuentran en el archivo "requirements.txt". Esto nos permitirá ejecutar la aplicación sin problemas. Ejecuta el siguiente comando para instalar las dependencias:

        pip install -r requirements.txt
        
Asegúrate de tener instalado el gestor de base de datos SQL Developer en su versión 23, ya que te permitirá visualizar los datos del aplicativo. Una vez que hayas confirmado que las configuraciones están correctamente establecidas, procedemos a crear las migraciones utilizando los siguientes comandos:

        python manage.py makemigrations
        python manage.py migrate
        
EJECUCION.

Ahora que has completado todas las configuraciones y migraciones, procedemos a ejecutar la aplicación utilizando el siguiente comando:

        python manage.py runserver
        
 
        
