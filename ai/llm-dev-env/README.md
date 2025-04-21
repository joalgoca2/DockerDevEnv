===============================================================================
 README - Entorno de Desarrollo Local para LLMs con Docker y Ollama
===============================================================================

Descripción
-----------
Este proyecto configura un entorno de desarrollo local utilizando Docker para experimentar
con Modelos de Lenguaje Grandes (LLMs) de código abierto. Utiliza Ollama para
facilitar la descarga y ejecución de modelos preentrenados, y Jupyter Lab como
interfaz interactiva para escribir y ejecutar código Python.

El entorno está diseñado para funcionar principalmente en CPU, teniendo en cuenta
las limitaciones de hardware comunes en portátiles (RAM limitada, GPUs no NVIDIA).

Prerrequisitos
-------------
*   **Docker:** Debes tener Docker instalado y funcionando.
    *   Windows/Mac: Docker Desktop (https://www.docker.com/products/docker-desktop/)
    *   Linux: Docker Engine + Docker Compose
*   **(Opcional) Git:** Para clonar este repositorio si estuviera alojado en uno.
*   **Make:** La utilidad `make` debe estar disponible en tu terminal (generalmente
    preinstalada en Linux/macOS; en Windows puede requerir instalación adicional,
    a menudo incluida con Git Bash o WSL).

Estructura del Proyecto
-----------------------
llm-dev-env/
├── notebooks/         # Guarda aquí tus cuadernos Jupyter (.ipynb)
├── models/            # (Opcional) Para almacenar modelos manualmente si no usas caché Docker
├── Dockerfile         # Define la imagen del entorno de desarrollo Python/Jupyter
├── docker-compose.yml # Orquesta los servicios Docker (Ollama y Jupyter)
├── Makefile           # Contiene comandos simplificados para gestionar el entorno
└── README.txt         # Este archivo

Configuración Inicial
---------------------
1.  Abre una terminal o línea de comandos en la carpeta raíz de este proyecto (`llm-dev-env/`).
2.  Ejecuta el siguiente comando para construir las imágenes (si no existen) y
    levantar los contenedores en segundo plano:

    ```bash
    make up
    ```

Uso del Makefile
----------------
El archivo `Makefile` proporciona comandos cortos para gestionar el ciclo de vida
del entorno Docker. Ejecuta estos comandos desde la carpeta raíz del proyecto:

*   `make help`
    Muestra una lista de todos los comandos disponibles y su descripción.

*   `make up`
    Inicia los contenedores Docker (`ollama_container` y `llm_dev_container`) en
    segundo plano (`-d`). Si las imágenes no existen o el `Dockerfile` ha
    cambiado, las construye automáticamente (`--build`).

*   `make down`
    Detiene y elimina los contenedores y las redes creadas por `docker-compose`.
    IMPORTANTE: NO elimina el volumen `ollama_data` donde se guardan los modelos,
    por lo que tus modelos descargados persistirán.

*   `make stop`
    Detiene los contenedores en ejecución sin eliminarlos. Puedes reiniciarlos
    luego con `make up` (o `docker-compose start`).

*   `make logs`
    Muestra los logs (salida de consola) de todos los servicios en tiempo real.
    Presiona `Ctrl+C` para detener el seguimiento de logs. Es útil para depurar
    problemas.

*   `make build`
    Fuerza la reconstrucción de las imágenes Docker definidas en el `Dockerfile`
    (principalmente la imagen `llm_dev_container`).

*   `make clean`
    ¡CUIDADO! Detiene y elimina los contenedores, redes Y TAMBIÉN el volumen
    `ollama_data`. Esto borrará permanentemente todos los modelos LLM que hayas
    descargado con Ollama. Úsalo solo si quieres empezar completamente de cero.

*   `make shell`
    Abre una sesión de terminal (bash) dentro del contenedor `llm_dev_container`.
    Esto es útil para ejecutar comandos directamente dentro del entorno, instalar
    paquetes Python adicionales temporalmente, etc.

*   `make list-models`
    Se conecta al servicio Ollama en ejecución y lista los modelos que han sido
    descargados y están disponibles.

*   `make pull model=<nombre>:<tag>`
    Descarga un modelo específico usando el servicio Ollama. Debes especificar
    el nombre y la etiqueta del modelo. Ejemplos:
    ```bash
    make pull model=phi3:mini
    make pull model=gemma:2b
    make pull model=mistral:7b-instruct-q4_0
    ```

Acceso a los Servicios
----------------------
*   **Jupyter Lab:** Una vez que ejecutes `make up`, abre tu navegador web y ve a:
    `http://localhost:8888`
    No se requiere token de autenticación según la configuración actual.
    Dentro de Jupyter Lab, puedes crear nuevos notebooks en la carpeta `notebooks`.

*   **Ollama API:** El servicio Ollama expone su API en el puerto `11434`.
    *   Desde tu máquina host: `http://localhost:11434`
    *   Desde dentro del contenedor `llm_dev_container` (por ejemplo, en tu código Python):
        `http://ollama:11434` (Docker Compose resuelve el nombre del servicio `ollama`).
    *   La forma principal de interactuar es usando el cliente Python `ollama`
        dentro de tus notebooks Jupyter (ver ejemplos en el código Python sugerido
        anteriormente) o usando `make pull` y `make list-models`.

Consideraciones Importantes (Hardware Ryzen 7000 / 16GB RAM / AMD Radeon)
------------------------------------------------------------------------
*   **RAM:** 16GB es limitado para LLMs. Ollama es eficiente, pero modelos grandes
    (incluso cuantizados de 7B o más) pueden consumir toda la RAM o hacer que el
    sistema use mucho swap (disco), volviéndose lento.
    **Recomendación:** Empieza con modelos pequeños como `phi3:mini`, `gemma:2b`,
    `qwen:1.8b`. Monitoriza el uso de RAM de tu sistema.
*   **GPU (AMD Radeon Integrada):** El soporte para aceleración de LLMs en GPUs AMD
    (ROCm) es menos maduro que NVIDIA (CUDA) y puede ser problemático en GPUs
    integradas. Por defecto, esta configuración **prioriza el uso de la CPU**
    (tu Ryzen 7000), que es bastante capaz. Ollama intentará usar la GPU si detecta
    hardware compatible y drivers, pero es probable que recurra a la CPU. No se ha
    forzado la configuración ROCm en `docker-compose.yml` para mayor estabilidad.
*   **Almacenamiento:** Los modelos LLM ocupan espacio en disco (varios GB cada uno).
    Se guardan en el volumen `ollama_data` para persistir entre reinicios del
    contenedor, pero ten en cuenta el espacio disponible en tu SSD de 512GB.
    Usa `make list-models` para verlos y `docker exec -it ollama_container ollama rm <nombre_modelo>`
    para eliminar alguno si necesitas espacio (o usa `make clean` para borrar todo).

Consideraciones Importantes (Hardware Ryzen 7000 / 16GB RAM / AMD Radeon)
------------------------------------------------------------------------
*   **RAM (Inferencia con Ollama):** 16GB es limitado incluso para *ejecutar* (inferencia) modelos grandes con Ollama. Los modelos de 7B (incluso cuantizados) pueden consumir mucha RAM y hacer que el sistema use swap (disco), volviéndose lento.
    **Recomendación (Inferencia):** Empieza con modelos pequeños (`phi3:mini`, `gemma:2b`, `qwen:1.8b`). Monitoriza el uso de RAM.

*   **GPU (Inferencia con Ollama):** La GPU AMD Radeon integrada tiene soporte limitado (ROCm) en el ecosistema de LLMs comparado con NVIDIA (CUDA). Por defecto, Ollama usará **principalmente tu CPU Ryzen 7000** para la inferencia, que es bastante capaz para modelos pequeños. No esperes una gran aceleración de la GPU integrada.

*   **Almacenamiento:** Los modelos ocupan espacio (varios GB). El volumen `ollama_data` persiste los modelos descargados. Gestiona el espacio en tu SSD.

*   **⚠️ Limitación Crítica para Fine-Tuning ⚠️**
    *   **Inviabilidad Práctica:** Realizar **fine-tuning** (incluso de modelos "pequeños" como 3B, y especialmente modelos de 7B o más) en este hardware es **extremadamente difícil y probablemente inviable o impracticable.**
    *   **RAM Insuficiente (16GB):** El proceso de fine-tuning requiere cargar no solo el modelo base, sino también los gradientes, los estados del optimizador y los lotes de datos. 16GB de RAM es significativamente inferior a los 32GB/64GB mínimos recomendados, lo que llevará casi con seguridad a errores de falta de memoria (OOM - Out Of Memory) o a un uso extremo del swap de disco, haciendo el proceso increíblemente lento (días/semanas).
    *   **GPU AMD Integrada:**
        *   **Sin VRAM dedicada:** La GPU utiliza la ya limitada RAM del sistema.
        *   **Ecosistema Software (CUDA):** Las herramientas más eficientes para fine-tuning (como QLoRA, que usa `bitsandbytes`) están optimizadas fundamentalmente para **NVIDIA CUDA**. El soporte para AMD ROCm es experimental, a menudo inestable, más lento, o directamente incompatible con estas bibliotecas cruciales. Sin QLoRA, los requisitos de memoria son aún mayores.
        *   **Potencia de Cómputo:** La potencia de cálculo de una GPU integrada es muy inferior a la necesaria para entrenar estos modelos en un tiempo razonable.
    *   **Alternativas:** Para tareas de fine-tuning, se recomienda encarecidamente el uso de **GPUs NVIDIA con suficiente VRAM (idealmente 16GB+ para 3B, 24GB+ para 7B)** o el uso de **servicios de cómputo en la nube** (Google Colab Pro, AWS SageMaker, Azure ML, Runpod, Vast.ai, etc.).
    *   **Enfoque Realista en Este Hardware:** Céntrate en usar este entorno para la **inferencia (ejecutar modelos ya entrenados) con Ollama**, experimentar con diferentes modelos pequeños y técnicas de prompting/RAG simple (como el In-Context Learning).