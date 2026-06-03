# Taller Práctico de Claude Code con Ollama Cloud

Este repositorio contiene la configuración necesaria para ejecutar **Claude Code** en GitHub Codespaces utilizando **Ollama Cloud** como backend de modelos de lenguaje.

## Estructura del Repositorio

```
taller-claude-code/
├── .devcontainer/           # Configuración de GitHub Codespaces
│   └── devcontainer.json
├── free-claude-code/        # Proxy adaptado (Free Claude Code) para traducir Anthropic ↔ OpenAI
├── ollama                   # Script wrapper para interceptar comandos de Ollama
└── README.md
```

## Flujo de Trabajo para los Alumnos

1. **Abrir el repositorio en GitHub Codespaces.**
   El contenedor se construirá e instalará automáticamente:
   - Ollama CLI
   - El proxy `free-claude-code` (adaptado para Ollama)
   - Claude Code CLI
   - El wrapper `ollama`

2. **Autenticarse en Ollama Cloud:**
   ```bash
   ollama signin
   ```

3. **Lanzar Claude Code con el modelo deseado:**
   ```bash
   ollama launch claude --model minimax-m2.5:cloud
   ```

   El wrapper realizará automáticamente:
   - Configurar el proxy para apuntar a Ollama Cloud.
   - Iniciar el proxy en segundo plano.
   - Lanzar `claude` apuntando al proxy local.

## Comandos Disponibles

| Comando | Descripción |
|---------|-------------|
| `ollama signin` | Autenticación en Ollama Cloud (nativo) |
| `ollama launch claude --model <modelo>` | Inicia Claude Code usando el proxy configurado para Ollama |

## Notas Técnicas

- El proxy se ejecuta en `http://localhost:8082/v1`.
- El wrapper `ollama` intercepta `launch claude` y redirige cualquier otro comando al binario real de Ollama.
- El proveedor Ollama dentro del proxy fue adaptado para usar el transporte **OpenAI-compatible** (`/v1/chat/completions`), ya que Ollama Cloud expone esta API.
