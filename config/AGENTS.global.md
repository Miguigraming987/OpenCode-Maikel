# Reglas globales para agentes

## Formato de respuesta

- Todas las respuestas de cualquier modelo deben comenzar obligatoriamente con la palabra **Miguelito**.
- Al final de casi todas las respuestas, añade una línea corta de recordatorio con las palabras clave exactas, por ejemplo: `Comandos: Crea Profesor · Guarda memoria · Comandos (tabla completa)`. Si la respuesta ya incluye la tabla completa, no repitas la línea.

## Contexto y memoria (son cosas distintas)

- **Contexto** (`CONTEXTO.md`): estado de un proyecto concreto. Vive dentro de cada proyecto y se lee solo al empezar.
- **Memoria** (`memoria<N>.md`): resumen de la configuración y de lo hablado con el agente. Vive en la carpeta de memorias y se guarda solo con `Guarda memoria`.
- Al empezar cada sesión, lee `CONTEXTO.md` (si existe en la carpeta de trabajo) antes de responder a la primera petición.
- Al terminar una tarea o cuando el usuario se despida, actualiza `CONTEXTO.md` (si existe) con:
  - Qué se hizo.
  - Qué queda pendiente.
  - Decisiones tomadas y dudas abiertas.
- Mantén `CONTEXTO.md` breve: borra lo obsoleto y no acumules historial.

## Palabras clave disponibles

| Di exactamente | Para qué sirve |
|---|---|
| `Crea Profesor` o `Crear Profesor` | Crea en la carpeta actual `AGENTS.md`, `CONTEXTO.md`, `PISTAS.md` y la skill `profesor`. |
| `Guarda memoria` o `Guardar memoria` | Crea un archivo nuevo `memoria<N>.md` en la carpeta de memorias. |
| `Comandos`, `Ayuda` o `Lista de comandos` | Muestra esta tabla. |
| `Dame una pista` o `Tengo una duda` | (Profesor) 3 pistas incrementales de un archivo en `PISTAS.md`. |
| `Como sigo?` o `Estoy atascado` | (Profesor) Te da solo el siguiente paso exacto. |
| `Dame la solucion` o `Solucion` | (Profesor) Solución completa con explicación. |

- Las tres últimas filas solo funcionan en carpetas donde ya se haya hecho `Crea Profesor`.
- Cuando el usuario escriba "Comandos", "Ayuda" o "Lista de comandos", muestra esta tabla completa.
- Muestra esta tabla completa también al terminar de ejecutar un disparador y siempre que ofrezcas al usuario una lista de cosas que puede hacer, con las palabras exactas y para qué sirve cada una.
- Si se añade un disparador nuevo, añádelo también a esta tabla.

## Disparador "Crea Profesor"

- Si el usuario escribe "Crea Profesor" o "Crear Profesor", lee `{{CREA_PROFESOR}}` y sigue sus instrucciones en la carpeta de trabajo actual.

## Disparador "Guarda memoria"

- Si el usuario escribe "Guarda memoria" o "Guardar memoria":
  1. Guarda en `{{MEMORIAS}}`. Antes de guardar, comprueba que esa carpeta contiene el archivo marcador `.memorias-agente` (así te aseguras de que no es otro disco con la misma letra). Si la ruta es `NO_ENCONTRADA` o no tiene el marcador, NO guardes: pregunta al usuario la ruta de la carpeta `memorias` (debe contener `.memorias-agente`) y recuérdale que repita la línea de instalación para que quede fijada.
  2. Lista los archivos `memoria<N>.md` que ya haya y crea uno nuevo con el número siguiente (`memoria1.md` si no hay ninguno). Nunca sobrescribas uno existente.
  3. Contenido breve del archivo: título `# Memoria <N> - <tema o carpeta de trabajo>`, y las secciones Estado actual, Hecho, Pendiente, Decisiones y dudas, y Última actualización (fecha).
  4. Al terminar, di la ruta del archivo creado. Este archivo no sustituye al `CONTEXTO.md` del proyecto.
