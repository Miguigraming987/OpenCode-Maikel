# Guía: crear el Profesor DAW paso a paso

Guía para montar en cualquier PC con Windows un agente de [OpenCode](https://opencode.ai) con reglas globales y un profesor que da pistas sin regalar la solución. Está pensada para copiarla: los datos propios van entre `<...>` y después de cada paso hay un **Mi ejemplo**.

Si trabajas dentro de una VM de VirtualBox, haz estos pasos y consulta también [`VM-PASOS.md`](VM-PASOS.md).

## Datos que tienes que decidir

| Dato | Qué es | Mi ejemplo |
|---|---|---|
| `<TU_USUARIO>` | Tu usuario de GitHub | `Miguigraming987` |
| `<TU_EMAIL_NOREPLY>` | Email privado de GitHub (Settings > Emails), formato `<id>+<usuario>@users.noreply.github.com` | `186576905+Miguigraming987@users.noreply.github.com` |
| `<CANARIO>` | Palabra con la que el agente empieza cada respuesta; si no aparece, sabes que no cargó tus reglas | `Miguelito` |
| `<REPO>` | Tu copia de este repo | `OpenCode-Maikel` |
| `<CARPETA_MEMORIAS>` | Carpeta donde se guardan las memorias del agente (debe contener un archivo vacío `.memorias-agente`) | `E:\3. HERRAMIENTAS Y RECURSOS\13. AgentesIA\memorias` |

## Camino rápido (con instalador)

1. **Haz tu copia de este repo.** Haz fork de `Miguigraming987/OpenCode-Maikel` en GitHub.
   *Mi ejemplo:* es el propio repo `Miguigraming987/OpenCode-Maikel`.
2. **Personalízala** en tu fork: cambia el canario en `config/AGENTS.global.md`, y en `instalar.ps1` cambia `$base` (tu usuario y repo) y `$subs` (dónde buscar tu carpeta de memorias). Crea el archivo marcador `.memorias-agente` dentro de `<CARPETA_MEMORIAS>`.
   *Mi ejemplo:* canario `Miguelito`, `$base` apunta a `Miguigraming987/OpenCode-Maikel`, memorias en `E:\3. HERRAMIENTAS Y RECURSOS\13. AgentesIA\memorias`.
3. **Instala los programas** (PowerShell, una sola vez) y reabre PowerShell:
   ```powershell
   winget install OpenJS.NodeJS.LTS; winget install Git.Git; winget install GitHub.cli
   ```
   *Mi ejemplo:* igual.
4. **Instala OpenCode y vincula GitHub** (`gh auth login` es interactivo):
   ```powershell
   Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force; npm install -g opencode-ai; gh auth login; git config --global user.name "<TU_USUARIO>"; git config --global user.email "<TU_EMAIL_NOREPLY>"
   ```
   El primer comando permite ejecutar scripts solo a tu usuario. Sin él, Windows 11 bloquea `opencode` con el error "la ejecución de scripts está deshabilitada".
   *Mi ejemplo:* `git config --global user.name "Miguigraming987"` y el email `186576905+Miguigraming987@users.noreply.github.com`.
5. **Conecta tu proveedor de IA:** escribe `opencode` y, dentro, `/connect`.
   *Mi ejemplo:* igual.
6. **Instala tus reglas y el profesor** (una vez por PC o VM):
   ```powershell
   irm https://raw.githubusercontent.com/<TU_USUARIO>/<REPO>/main/instalar.ps1 | iex
   ```
   Debe terminar con `Memorias en: <CARPETA_MEMORIAS>`. Si dice `AVISO`, la carpeta de memorias no se encontró: revisa el marcador y repite.
   *Mi ejemplo:* `irm https://raw.githubusercontent.com/Miguigraming987/OpenCode-Maikel/main/instalar.ps1 | iex`
7. **En cada proyecto nuevo:** abre OpenCode en su carpeta y escribe `Crea Profesor`. Después reinicia OpenCode: el `AGENTS.md` se aplica a partir de la siguiente sesión.
   *Mi ejemplo:* en la VM, `cd Z:\mi-proyecto; opencode`.
8. **Comprueba:** la respuesta empieza con `<CANARIO>` y `Comandos` muestra la tabla de palabras clave.
   *Mi ejemplo:* la respuesta empieza con "Miguelito".

Los comandos disponibles están en [`COMANDOS.md`](COMANDOS.md).

## Camino manual (sin instalador)

1. Crea la carpeta del proyecto y abre OpenCode en ella.
2. Pega este prompt:

````text
Crea en la carpeta actual estos 4 archivos. Antes de crear cada uno, comprueba si existe y, si existe, pregúntame si lo sobrescribes o lo conservas.

1) AGENTS.md con este contenido:
# Reglas para agentes
## Formato de respuesta
- Todas las respuestas de cualquier modelo deben comenzar obligatoriamente con la palabra **<CANARIO>**.
## Memoria entre sesiones
- Al empezar cada sesión, lee `CONTEXTO.md` (si existe) antes de responder a la primera petición.
- Al terminar una tarea o cuando el usuario se despida, actualiza `CONTEXTO.md` con: qué se hizo, qué queda pendiente, decisiones tomadas y dudas abiertas.
- Mantén `CONTEXTO.md` breve: borra lo obsoleto y no acumules historial.
- Si no existe `CONTEXTO.md`, créalo con la plantilla estándar (Estado actual, Hecho, Pendiente, Decisiones y dudas, Última actualización).

2) CONTEXTO.md con las secciones vacías: Estado actual, Hecho, Pendiente, Decisiones y dudas, Última actualización.

3) PISTAS.md con el título "# 🧑‍🏫 Pistas" y una nota: "Aquí aparecerán las pistas cuando escribas 'Dame una pista' o 'Tengo una duda'."

4) .opencode/skills/profesor/SKILL.md: descarga https://raw.githubusercontent.com/<TU_USUARIO>/<REPO>/main/skills/profesor/SKILL.md y guárdalo EXACTAMENTE con ese contenido (respeta tildes, emojis y formato).

Al terminar, lista los archivos creados. Empieza tu respuesta con la palabra "<CANARIO>".
````

   *Mi ejemplo:* `<CANARIO>` = `Miguelito` y la URL de la skill es `https://raw.githubusercontent.com/Miguigraming987/OpenCode-Maikel/main/skills/profesor/SKILL.md`.
3. Reinicia OpenCode en el proyecto y comprueba que la respuesta empieza con `<CANARIO>`.

Si el agente no puede descargar la skill, copia a mano el contenido de `skills/profesor/SKILL.md` en `.opencode/skills/profesor/SKILL.md`.

## Qué se crea

| Archivo | Para qué sirve |
|---|---|
| `AGENTS.md` | Reglas del agente: responder con el canario y leer/actualizar `CONTEXTO.md`. |
| `CONTEXTO.md` | Estado del proyecto entre sesiones. |
| `PISTAS.md` | Donde el profesor escribe las pistas. |
| `.opencode/skills/profesor/SKILL.md` | La skill del profesor. |
