# Usa una imagen base de Python
FROM python:3.10-slim

# Establece el directorio de trabajo
WORKDIR /app

# Instala dependencias básicas, Jupyter, Ollama client Y herramientas de fine-tuning
# - transformers: Biblioteca principal de Hugging Face
# - datasets: Para cargar y manejar datos
# - accelerate: Para optimizar el entrenamiento en diferentes hardwares (incluido CPU)
# - peft: Parameter-Efficient Fine-Tuning (LoRA, etc.)
# - trl: Transformer Reinforcement Learning library (útil para SFT)
# - bitsandbytes: Para cuantización (QLoRA) - ¡OJO! Puede requerir CUDA. Quizás no funcione bien en AMD/CPU.
# - sentencepiece, protobuf: Dependencias comunes
RUN apt-get update && apt-get install -y --no-install-recommends git \
 && rm -rf /var/lib/apt/lists/* 
 # Git puede ser necesario para descargar modelos

 RUN pip install --no-cache-dir \
 jupyterlab \
 requests \
 ollama \
 # Instalar PyTorch para CPU
 torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu \ 
 transformers \
 datasets \
 accelerate \
 peft \
 trl \
 bitsandbytes \
 sentencepiece \
 protobuf

# Crea el directorio para los notebooks dentro del contenedor (por si acaso)
RUN mkdir -p /app/notebooks /app/data /app/output_model

# Expone el puerto de Jupyter (aunque docker-compose ya lo hace)
EXPOSE 8888

# El comando para iniciar Jupyter se define en docker-compose.yml