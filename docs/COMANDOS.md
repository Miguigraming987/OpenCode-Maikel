# Comandos

Palabras exactas que puedes decirle al agente. Dentro de OpenCode, escribe `Comandos` para ver esta tabla.

| Di exactamente | Para qué sirve |
|---|---|
| `Crea Profesor` o `Crear Profesor` | Crea en la carpeta actual `AGENTS.md`, `CONTEXTO.md`, `PISTAS.md` y la skill `profesor`. |
| `Guarda memoria` o `Guardar memoria` | Crea un `memoria<N>.md` nuevo en tu carpeta de memorias (la que contiene `.memorias-agente`) y, si está en un repo git, lo sube. |
| `Comandos`, `Ayuda` o `Lista de comandos` | Muestra la tabla de comandos. |
| `Dame una pista` o `Tengo una duda` | (Profesor) 3 pistas incrementales de un archivo en `PISTAS.md`. |
| `Como sigo?` o `Estoy atascado` | (Profesor) Solo el siguiente paso exacto. |
| `Dame la solucion` o `Solucion` | (Profesor) Solución completa con explicación. |

Las tres últimas solo funcionan en carpetas donde ya se hizo `Crea Profesor`.

*Mi ejemplo:* mis memorias están en `E:\3. HERRAMIENTAS Y RECURSOS\13. AgentesIA\memorias` (`Y:\memorias` en mi VM).

## Contexto y memoria

- **Contexto** (`CONTEXTO.md`): estado de un proyecto. Vive dentro del proyecto y se lee solo al empezar.
- **Memoria** (`memoria<N>.md`): lo hablado y configurado con el agente. Vive en tu carpeta de memorias y se guarda con `Guarda memoria`. El agente lee la más reciente al empezar cada sesión, así que puedes seguir la conversación desde otro chat u otra máquina.
