#!/bin/bash

# Directorio a explorar
DIRECTORIO="."

# Explorar todos los archivos HTML en el directorio
for archivo in "$DIRECTORIO"/*.html; do
  # Verifica que sea un archivo regular
  if [[ -f $archivo ]]; then
    # Elimina todos los atributos src de las etiquetas <img>
    sed -i 's/<img[^>]*\ssrc="[^"]*"[^>]*>/<img>/g' "$archivo"
    
    # Elimina todos los atributos href de las etiquetas <a> menos los que van al directorio raiz
    sed -i 's/\(<a[^>]*href="\)\([^/][^"]*\)\("[^>]*>\)/<a\3/g' "$archivo"
    
    # Elimina todos los atributos href de las etiquetas <link>
    sed -i 's/\(<link[^>]*\)href="[^"]*"([^>]*>\)/\1\2/g' "$archivo"
  fi
done

echo "Procesamiento completado."
