#!/bin/bash
clear
echo "🔑 PASO 1: Configuración de OpenRouter"
echo "Por favor, pega tu API Key de OpenRouter y presiona [ENTER]:"
read -s USER_API_KEY

# Crear el archivo .env dentro de la carpeta del proxy
cat <<EOF > free-claude-code/.env
PORT=3000
PROVIDER=openrouter
OPENROUTER_API_KEY=$USER_API_KEY
MODEL=anthropic/claude-3-5-sonnet
EOF

echo "🚀 PASO 2: Encendiendo el Proxy en segundo plano..."
cd free-claude-code
npm start > /dev/null 2>&1 &
sleep 3

echo "💻 PASO 3: Iniciando Claude Code..."
export ANTHROPIC_BASE_URL="http://localhost:3000/v1"
cd ..
claude
