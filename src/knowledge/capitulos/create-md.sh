#!/bin/bash

# Nombre del archivo final
output_file="libro_completo.md"

# Archivo de salida
echo "Creando $output_file..."

# Añadir portada.md
echo "Añadiendo portada.md..."
cat portada.md > "$output_file"

# Añadir salto de página después de la portada
echo -e "\n\\\\newpage\n" >> "$output_file"

# Añadir contraportada como imagen y salto de página
cat contra-portada.md > "$output_file"
echo -e "\n\\\\newpage\n" >> "$output_file"

# Añadir los capítulos del 1 al 12, cada uno en una nueva página
for i in {1..17}
do
    echo "Añadiendo capitulo$i.md..."
    cat "capitulo$i.md" >> "$output_file"
    echo -e "\n\\\\newpage\n" >> "$output_file"
done

# Añadir epilogo.md y salto de página
echo "Añadiendo epilogo.md..."
cat epilogo.md >> "$output_file"
echo -e "\n\\\\newpage\n" >> "$output_file"

# Añadir nota-final.md sin salto de página después
echo "Añadiendo nota-final.md..."
cat nota-final.md >> "$output_file"

echo "El archivo $output_file ha sido creado con éxito."
