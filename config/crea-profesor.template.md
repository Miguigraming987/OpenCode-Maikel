# PROMPT "CREA PROFESOR"

Cuando el usuario escriba "Crea Profesor", crea en la carpeta de trabajo actual
estos cuatro archivos con EXACTAMENTE el contenido indicado (respeta tildes,
emojis y formato). Reglas de ejecución:
- Antes de crear, comprueba cuáles existen. Si alguno existe, pregunta al usuario
  con la herramienta de preguntas si quiere sobrescribirlo o conservarlo. Nunca
  sobrescribas sin preguntar.
- Si ya existe AGENTS.md y el usuario quiere conservarlo, añade solo las secciones
  que falten, sin borrar lo que ya tenga.
- Crea las carpetas intermedias que hagan falta.
- Al terminar, lista los archivos creados o modificados y recuerda al usuario que
  AGENTS.md se aplica a partir de la próxima sesión.
- Esta respuesta, como todas, debe empezar con la palabra "Miguelito".

=== ARCHIVO 1: AGENTS.md ===
# Reglas para agentes

## Formato de respuesta

- Todas las respuestas de cualquier modelo deben comenzar obligatoriamente con la palabra **Miguelito**.

## Memoria entre sesiones

- Al empezar cada sesión, lee `CONTEXTO.md` (si existe) antes de responder a la primera petición.
- Al terminar una tarea o cuando el usuario se despida, actualiza `CONTEXTO.md` con:
  - Qué se hizo.
  - Qué queda pendiente.
  - Decisiones tomadas y dudas abiertas.
- Mantén `CONTEXTO.md` breve: borra lo obsoleto y no acumules historial.
- Si no existe `CONTEXTO.md`, créalo con la plantilla estándar (Estado actual, Hecho, Pendiente, Decisiones y dudas, Última actualización).
=== FIN ARCHIVO 1 ===

=== ARCHIVO 2: CONTEXTO.md ===
# Contexto - (nombre de la carpeta del proyecto)

## Estado actual
(Resumen de una o dos líneas de en qué punto está el proyecto)

## Hecho
- 

## Pendiente
- 

## Decisiones y dudas
- 

## Última actualización
(Fecha)
=== FIN ARCHIVO 2 ===

=== ARCHIVO 3: PISTAS.md ===
# 🧑‍🏫 Pistas

> Aquí aparecerán las pistas cuando escribas "Dame una pista" o "Tengo una duda".
=== FIN ARCHIVO 3 ===

=== ARCHIVO 4: .opencode/skills/profesor/SKILL.md ===
{{SKILL}}
=== FIN ARCHIVO 4 ===
