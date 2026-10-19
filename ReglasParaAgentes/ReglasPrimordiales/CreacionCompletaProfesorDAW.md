# Creación completa del Profesor DAW

Pasos exactos para tener el profesor (y las reglas del agente) en cualquier proyecto. Hay un camino rápido y uno manual.

## Camino rápido (Windows 11, PC o VM de VirtualBox)

0. **Solo en la VM:** comprueba en el Explorador que aparecen `Z:` (proyectos) e `Y:` (agentes y memorias). Si no aparecen, instala las Guest Additions: menú de la VM > Dispositivos > Insertar imagen de CD de las Guest Additions, ejecuta `VBoxWindowsAdditions.exe` y reinicia. En la VM no uses `E:`.
1. **Instala los programas** (PowerShell, una sola vez):
   ```powershell
   winget install OpenJS.NodeJS.LTS; winget install Git.Git; winget install GitHub.cli
   ```
   Cierra y abre PowerShell.
2. **Instala OpenCode y vincula GitHub** (`gh auth login` es interactivo):
   ```powershell
   npm install -g @opencode/cli; gh auth login; git config --global user.name "Miguigraming987"; git config --global user.email "186576905+Miguigraming987@users.noreply.github.com"
   ```
3. Escribe `opencode` y, dentro, `/connect` para conectar tu proveedor de IA.
4. **Instala mis reglas y el profesor** (una sola vez por PC o VM):
   ```powershell
   irm https://raw.githubusercontent.com/Miguigraming987/ayuda-agentes/main/instalar.ps1 | iex
   ```
   Debe terminar con `Memorias en: Y:\memorias` (en el PC, la ruta de E). Si dice `AVISO`, revisa que `Y:` esté montada y repite la línea.
5. **En cada proyecto nuevo:** `cd Z:\mi-proyecto; opencode` y escribe `Crea Profesor`.
6. **Reinicia OpenCode** en ese proyecto: el `AGENTS.md` se aplica a partir de la siguiente sesión.
7. **Comprueba:** la respuesta empieza con "Miguelito" y `Comandos` muestra la tabla.

**Luego ve a [`VM-PASOS.md`](https://github.com/Miguigraming987/ayuda-agentes/blob/main/VM-PASOS.md)** (repo `ayuda-agentes`) si necesitas más detalle de la VM, las carpetas compartidas o las memorias. Todos los comandos disponibles están en [`Comandos.md`](https://github.com/Miguigraming987/ayuda-agentes/blob/main/Comandos.md).

## Camino manual (sin instalador)

1. Crea la carpeta del proyecto y abre OpenCode en ella.
2. Pega este prompt:

````text
Crea en la carpeta actual estos 4 archivos. Antes de crear cada uno, comprueba si existe y, si existe, pregúntame si lo sobrescribes o lo conservas.

1) AGENTS.md con este contenido:
# Reglas para agentes
## Formato de respuesta
- Todas las respuestas de cualquier modelo deben comenzar obligatoriamente con la palabra **Miguelito**.
## Memoria entre sesiones
- Al empezar cada sesión, lee `CONTEXTO.md` (si existe) antes de responder a la primera petición.
- Al terminar una tarea o cuando el usuario se despida, actualiza `CONTEXTO.md` con: qué se hizo, qué queda pendiente, decisiones tomadas y dudas abiertas.
- Mantén `CONTEXTO.md` breve: borra lo obsoleto y no acumules historial.
- Si no existe `CONTEXTO.md`, créalo con la plantilla estándar (Estado actual, Hecho, Pendiente, Decisiones y dudas, Última actualización).

2) CONTEXTO.md con las secciones vacías: Estado actual, Hecho, Pendiente, Decisiones y dudas, Última actualización.

3) PISTAS.md con el título "# 🧑‍🏫 Pistas" y una nota: "Aquí aparecerán las pistas cuando escribas 'Dame una pista' o 'Tengo una duda'."

4) .opencode/skills/profesor/SKILL.md: descarga https://raw.githubusercontent.com/Miguigraming987/OpenCode-Maikel/main/Skills/Prompts/V3_profesor.md y guárdalo con una primera línea `---` seguida EXACTAMENTE de ese contenido (respeta tildes, emojis y formato).

Al terminar, lista los archivos creados. Empieza tu respuesta con la palabra "Miguelito".
````

3. Reinicia OpenCode en el proyecto.
4. Comprueba: la respuesta empieza con "Miguelito" y `Dame una pista` activa al profesor.

Si el agente no puede descargar la skill, copia a mano el contenido de `Skills/Prompts/V3_profesor.md` (añadiendo `---` como primera línea) en `.opencode/skills/profesor/SKILL.md`.

## Qué se crea

| Archivo | Para qué sirve |
|---|---|
| `AGENTS.md` | Reglas del agente: responder con "Miguelito" y leer/actualizar `CONTEXTO.md`. |
| `CONTEXTO.md` | Estado del proyecto entre sesiones. |
| `PISTAS.md` | Donde el profesor escribe las pistas. |
| `.opencode/skills/profesor/SKILL.md` | La skill del profesor. |

## Palabras clave del profesor

| Di exactamente | Para qué sirve |
|---|---|
| `Dame una pista` / `Tengo una duda` | 3 pistas incrementales de un archivo en `PISTAS.md`. |
| `Como sigo?` / `Estoy atascado` | Solo el siguiente paso exacto. |
| `Dame la solucion` / `Solucion` | Solución completa con explicación. |

## Versiones de la skill

La más reciente es `Skills/Prompts/V3_profesor.md`. Si cambias la skill, súbela como versión nueva y actualiza la URL del paso 4 del prompt manual.
