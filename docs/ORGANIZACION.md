# Organización

Cómo está organizada **mi** configuración (un ejemplo real). Para montar la tuya, sigue la [`GUIA.md`](GUIA.md).

## Qué es
Configuración global de OpenCode que se instala con una línea en cualquier PC o VM con Windows 11: reglas del agente, el profesor de DAW y un sistema de contexto y memoria.

## Dónde está cada cosa

| Dónde | Qué hay |
|---|---|
| GitHub `OpenCode-Maikel` (público) | Este repo: instalador, reglas, skill del profesor y guías. Es la única fuente de la configuración. |
| GitHub `AgentesIA-privado` (privado) | `memorias/` (`memoria<N>.md` y el marcador `.memorias-agente`) y `contexto/` (estado y pasos de cómo se montó todo). Es privado porque incluye rutas y detalles de mi entorno. |
| Disco E, `3. HERRAMIENTAS Y RECURSOS\13. AgentesIA` | Raíz del repo privado, con `memorias\` y `contexto\`, y el clon local de este repo en `OpenCode-Maikel\` (ignorado por el repo privado). |
| `~\.config\opencode\` | Lo que instala `instalar.ps1`: `AGENTS.md` global y `crea-profesor.md`. |
| Cada proyecto | `AGENTS.md`, `CONTEXTO.md`, `PISTAS.md` y `.opencode/skills/profesor/` (los crea `Crea Profesor`). |

## Estructura de este repo

| Ruta | Contenido |
|---|---|
| `instalar.ps1` | Instala todo y genera `crea-profesor.md` juntando plantilla y skill. |
| `config/` | `AGENTS.global.md` (reglas globales y tabla de comandos) y `crea-profesor.template.md`. |
| `skills/profesor/SKILL.md` | La skill del profesor (única copia). |
| `docs/GUIA.md` | Pasos completos, con datos genéricos y *Mi ejemplo*. |
| `docs/VM-PASOS.md` | Solo lo específico de VirtualBox. |
| `docs/COMANDOS.md` | Palabras clave del agente. |

## VM de VirtualBox
`W11_SERVE_C_2026-2027` y `Windows 11_EC` tienen carpetas compartidas con montaje automático: `Z:` = `E:\CURSO_ACTUAL_2026` (proyectos) e `Y:` = `13. AgentesIA`. En la VM no se usa `E:`. Pasos en [`VM-PASOS.md`](VM-PASOS.md).

## Decisiones
- **Contexto vs memoria:** `CONTEXTO.md` es del proyecto; `memoria<N>.md` es del agente.
- **Memorias por marcador:** la carpeta `memorias` contiene `.memorias-agente`; el instalador y el agente la identifican por ese archivo, no por la letra de unidad.
- **Un solo repo público:** antes había dos (`ayuda-agentes` y `OpenCode-Maikel`) con la skill y los pasos duplicados. Las versiones antiguas de los prompts se quitaron: siguen en el historial de git.
- **Una sola fuente:** los comandos están en `docs/COMANDOS.md` (y en `config/AGENTS.global.md` para el agente), los pasos de VM en `docs/VM-PASOS.md`, y `crea-profesor.md` se genera al instalar.
- **Commits con el email `noreply`** de GitHub.

## Historial
- **2026-10-13:** primera skill del profesor en el proyecto UT4-Tarea1.
- **2026-10-16:** reglas globales, disparador `Crea Profesor` y repo de copia de seguridad.
- **2026-10-19:** repo público, instalación en una línea, memorias, carpetas compartidas de la VM, skill V3 y limpieza de duplicados.
- **2026-10-21:** profesor instalado en la VM `Windows 11_EC`; repo privado para memorias; todo unificado en `OpenCode-Maikel`.
