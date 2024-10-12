#!/bin/bash

# Nombre del archivo final
output_file="libro_completo_en.md"

# Archivo de salida
echo "Creando $output_file..."

# Función para traducir contenido usando la API de OpenAI
translate_to_english() {
  local content="$1"
  
  # Realiza la solicitud a la API y espera la respuesta
  local response=$(jq -n --arg content "$content" '{
    "model": "gpt-4o",
    "messages": [
      {
        "role": "system",
        "content": "You are a professional native English translator. Translate the following text into native English."
      },
      {
        "role": "user",
        "content": $content
      }
    ],
    "temperature": 0.7
  }' | curl -s https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d @-)

  # Extrae el contenido traducido de la respuesta, si es válido
  local translated_text=$(echo "$response" | jq -r '.choices[0].message.content // empty')

  # Verifica si el contenido traducido está vacío
  if [[ -z "$translated_text" ]]; then
    echo "Error: No se pudo obtener la traducción."
    echo "Respuesta de la API: $response"
    exit 1
  fi

  # Retorna el texto traducido
  echo "$translated_text"
}

# Añadir portada.md traducida
echo "Añadiendo portada.md traducida..."
translated_portada=$(translate_to_english "$(cat portada.md)")
echo "$translated_portada" > "$output_file"
echo -e "\n\\\\newpage\n" >> "$output_file"

# Añadir contraportada.md traducida
echo "Añadiendo contra-portada.md traducida..."
translated_contra_portada=$(translate_to_english "$(cat contra-portada.md)")
echo "$translated_contra_portada" >> "$output_file"
echo -e "\n\\\\newpage\n" >> "$output_file"

# Añadir los capítulos del 1 al 12 traducidos
for i in {1..17}
do
    echo "Añadiendo capitulo$i.md traducido..."
    translated_capitulo=$(translate_to_english "$(cat capitulo$i.md)")
    echo "$translated_capitulo" >> "$output_file"
    echo -e "\n\\\\newpage\n" >> "$output_file"
done

# Añadir epilogo.md traducido
echo "Añadiendo epilogo.md traducido..."
translated_epilogo=$(translate_to_english "$(cat epilogo.md)")
echo "$translated_epilogo" >> "$output_file"
echo -e "\n\\\\newpage\n" >> "$output_file"

# Añadir nota-final.md traducida
echo "Añadiendo nota-final.md traducida..."
translated_nota_final=$(translate_to_english "$(cat nota-final.md)")
echo "$translated_nota_final" >> "$output_file"

echo "El archivo $output_file ha sido creado con éxito."
