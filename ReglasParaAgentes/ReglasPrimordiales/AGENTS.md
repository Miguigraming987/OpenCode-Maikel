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
