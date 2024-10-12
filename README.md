# Seki Karasu

## Descripción
Seki Karasu es un agente inteligente diseñado para facilitar la gestión y el desarrollo de proyectos de software. A través de la integración de diversas herramientas y componentes, proporciona una experiencia de desarrollo más fluida y eficiente. Este agente hace uso de la API de OpenAI, específicamente ChatGPT-4, para procesar y responder consultas, apoyando así en la automatización y toma de decisiones durante el ciclo de desarrollo de software.

## Funcionamiento
El agente Seki Karasu opera mediante la creación de un *knowledge base* a partir de archivos en Markdown. Estos archivos son procesados y utilizados para alimentar al asistente, permitiéndole responder preguntas relacionadas con el proyecto de manera precisa. Además, Seki Karasu puede crear y recrear dinámicamente su base de conocimientos para mantenerse actualizado con los últimos cambios en el proyecto.

## Instalación y Configuración con Poetry

Para gestionar las dependencias y el entorno virtual de Seki Karasu, utilizamos Poetry. A continuación, se detallan los pasos para configurar y ejecutar el proyecto.

### 1. Instalación de Poetry
Si no tienes Poetry instalado, puedes hacerlo ejecutando el siguiente comando:

````bash
pip install poetry
````

### 2. Instalación de Dependencias
Una vez instalado Poetry, puedes instalar todas las dependencias necesarias ejecutando:

````bash
poetry install
````

Esto creará un entorno virtual aislado y descargará todas las dependencias listadas en el archivo `pyproject.toml`.

### 3. Activación del Entorno Virtual
Para activar el entorno virtual, ejecuta:

````bash
poetry shell
````

Esto te permitirá interactuar con el entorno configurado para el proyecto.

## Configuración de Variables de Entorno

Para que Seki Karasu funcione correctamente, necesita autenticarse con la API de OpenAI utilizando una clave API. Puedes configurar esta clave API de dos maneras: mediante un archivo `.env` o pasando la variable de entorno directamente.

### Usando un Archivo `.env`

1. Crea un archivo en la raíz de tu proyecto llamado `.env`.
2. Dentro de este archivo, añade la siguiente línea:

````plaintext
OPENAI_API_KEY=tu_clave_api_aquí
````

Reemplaza `tu_clave_api_aquí` con tu clave API real de OpenAI.

3. Asegúrate de que tu aplicación esté configurada para cargar variables de entorno desde este archivo al inicio.

### Pasando la Variable de Entorno Directamente

Alternativamente, puedes configurar la variable de entorno `OPENAI_API_KEY` directamente en tu entorno de ejecución. La forma de hacer esto varía dependiendo del sistema operativo:

- **En Windows (en la línea de comandos CMD):**

````plaintext
set OPENAI_API_KEY=tu_clave_api_aquí
````

- **En Linux y macOS (en la terminal):**

````plaintext
export OPENAI_API_KEY=tu_clave_api_aquí
````

Recuerda reemplazar `tu_clave_api_aquí` con tu clave API real de OpenAI.

> **Importante**
> Por razones de seguridad, nunca subas el archivo `.env` a repositorios públicos o compartas tu clave API de OpenAI públicamente. Si estás colaborando en un proyecto, considera formas seguras de compartir estas claves, como gestores de secretos o variables de entorno configuradas directamente en el entorno de despliegue.

## Levantamiento de la Página Web
Seki Karasu viene con una interfaz web que permite interactuar con el agente de manera fácil y directa. Para levantar la página web, sigue estos pasos:

1. Asegúrate de tener Python y las dependencias necesarias instaladas.
2. Ejecuta el servidor web utilizando:

````bash
python app.py
````

3. Accede a la interfaz web a través de tu navegador visitando `http://localhost:8888` o el puerto específico configurado.

## Creación del Knowledge Base
Para crear y actualizar el *knowledge base* de Seki Karasuno, puedes utilizar los siguientes comandos:

- ````bash
  python chat.py create
  ````: Crea el asistente y su *knowledge base* a partir de los archivos en Markdown disponibles en el directorio `knowledge`.
  
- ````bash
  python chat.py recreate
  ````: Borra el asistente existente y vuelve a crearlo, actualizando así el *knowledge base* con la información más reciente.

Estos comandos aseguran que Seki Karasuno siempre esté actualizado con la última información de tu proyecto.

## Personalización del Asistente Seki Karasuno

Para personalizar el asistente Seki Karasuno, puedes modificar el contenido de su base de conocimientos (`knowledge`) y ajustar sus comportamientos (`behaviors`) según tus necesidades. Esta sección te guiará sobre cómo realizar estas personalizaciones.

### Actualización del Contenido de Knowledge

El asistente utiliza archivos Markdown almacenados en la carpeta `knowledge` para construir su base de conocimientos. Para actualizar esta información, sigue estos pasos:

1. **Editar o Añadir Archivos Markdown**: Navega a la carpeta `knowledge` de tu proyecto y edita los archivos Markdown existentes o añade nuevos archivos para incluir la información que deseas que el asistente conozca.

2. **Regenerar el Knowledge Base**: Una vez actualizados los archivos Markdown, utiliza el comando `python chat.py recreate` para regenerar el asistente con la base de conocimientos actualizada. Este proceso borrará el asistente existente y creará uno nuevo con el contenido recién actualizado.

### Modificación de Behaviors

Los `behaviors` definen cómo el asistente debe interpretar y responder a las consultas basándose en el conocimiento proporcionado. Para ajustar estos comportamientos, modifica el archivo en la carpeta `behaviors`:

1. **Editar el Archivo de Behaviors**: Encuentra y edita el archivo `default.txt` dentro de la carpeta `behaviors`, ajustando las instrucciones según cómo deseas que el asistente responda.

2. **Aplicar los Cambios**: Al igual que con la actualización del knowledge, usa el comando `python chat.py recreate` para aplicar los cambios realizados en los behaviors del asistente.

### Notas Importantes

- Al modificar tanto el contenido de knowledge como los behaviors, es crucial realizar pruebas para asegurar que el asistente se comporta como se espera. Considera crear un conjunto de preguntas y respuestas para probar las nuevas configuraciones.

- Recuerda que cualquier cambio en los archivos de knowledge o behaviors requerirá que regeneres el asistente para que los cambios surtan efecto.

Con estas personalizaciones, puedes adaptar Seki Karasuno para que mejor se ajuste a las necesidades y especificaciones de tu proyecto, mejorando así la experiencia de los desarrolladores y usuarios finales.

## Docker

Si deseas ejecutar Seki Karasu en un contenedor Docker, puedes hacerlo con el siguiente comando:

````bash
docker run -e OPENAI_API_KEY=tu_clave_api_aquí -p 8000:8000 seki-karasu
````
# The-Purge-of-the-Gods
# The-Purge-of-the-Gods
# The-Purge-of-the-Gods
# The-Purge-of-the-Gods
