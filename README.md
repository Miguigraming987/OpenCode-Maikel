# OpenCode-Maikel

Configuración global para [OpenCode](https://opencode.ai) en Windows: reglas del agente (canario, contexto y memoria), un profesor de DAW que da pistas sin regalar la solución, y un instalador de una sola línea. Puedes copiarla y adaptarla a ti. Los datos propios van entre `<...>`, con **Mi ejemplo** después.

## Instalar

En PowerShell:

```powershell
irm https://raw.githubusercontent.com/Miguigraming987/OpenCode-Maikel/main/instalar.ps1 | iex
```

Después, en cualquier proyecto, abre OpenCode y escribe `Crea Profesor`. Antes necesitas Node, git y OpenCode: están en la [guía](docs/GUIA.md).

## Úsala como tuya

1. Haz fork de este repo.
2. Personaliza en tu fork (ver tabla).
3. Instala con la línea de arriba, cambiando tu usuario y repo.

| Dónde | Qué cambiar | Mi ejemplo |
|---|---|---|
| `config/AGENTS.global.md` | La palabra canario | `Miguelito` |
| `instalar.ps1` | `$base` (tu usuario y repo) y `$subs` (dónde buscar tu carpeta de memorias) | `Miguigraming987/OpenCode-Maikel` |
| Carpeta de memorias | Crea un archivo vacío `.memorias-agente` dentro | `E:\3. HERRAMIENTAS Y RECURSOS\13. AgentesIA\memorias` |

## Contenido

| Ruta | Para qué |
|---|---|
| [`docs/GUIA.md`](docs/GUIA.md) | Guía completa paso a paso. |
| [`docs/COMANDOS.md`](docs/COMANDOS.md) | Palabras exactas que puedes decir y qué hace cada una. |
| [`docs/VM-PASOS.md`](docs/VM-PASOS.md) | Lo específico de una VM de VirtualBox. |
| [`docs/ORGANIZACION.md`](docs/ORGANIZACION.md) | Cómo está organizada mi configuración. |
| `config/` | Reglas globales y plantilla del prompt `Crea Profesor`. |
| `skills/profesor/SKILL.md` | La skill del profesor. |
| `instalar.ps1` | Instala todo y genera `crea-profesor.md` juntando plantilla y skill. |

## Mantenimiento

Si cambias `skills/profesor/SKILL.md` o la plantilla, haz commit y push y vuelve a ejecutar el instalador.
