# Pasos específicos de VirtualBox (VM Windows 11)

La instalación del software, de OpenCode y del profesor está en la guía principal: [`GUIA.md`](GUIA.md). Aquí solo está lo que cambia en una VM. Los datos propios van entre `<...>`, con **Mi ejemplo** después.

## Datos

| Dato | Qué es | Mi ejemplo |
|---|---|---|
| `<NOMBRE_VM>` | Nombre de la VM en VirtualBox | `W11_SERVE_C_2026-2027` |
| `<RUTA_PROYECTOS>` | Carpeta del PC donde guardas proyectos | `E:\CURSO_ACTUAL_2026` |
| `<RUTA_AGENTES>` | Carpeta del PC con tu repo y la carpeta `memorias` | `E:\3. HERRAMIENTAS Y RECURSOS\13. AgentesIA` |

## 1. Comparte las carpetas (en el PC, con la VM apagada)

```powershell
$vb = "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
& $vb sharedfolder add "<NOMBRE_VM>" --name=PROYECTOS --hostpath="<RUTA_PROYECTOS>" --automount --auto-mount-point=Z:
& $vb sharedfolder add "<NOMBRE_VM>" --name=AGENTES_IA --hostpath="<RUTA_AGENTES>" --automount --auto-mount-point=Y:
```

El nombre `AGENTES_IA` lo usa `instalar.ps1` como alternativa de búsqueda; si usas otro, cámbialo también allí.
*Mi ejemplo:* la primera carpeta se llama `CURSO_ACTUAL_2026`; el resto, igual.

## 2. Marca la carpeta de memorias (en el PC)

```powershell
New-Item "<RUTA_AGENTES>\memorias\.memorias-agente" -Force
```

Así el instalador y el agente reconocen la carpeta correcta aunque la letra de unidad cambie.
*Mi ejemplo:* `E:\3. HERRAMIENTAS Y RECURSOS\13. AgentesIA\memorias\.memorias-agente`.

## 3. Guest Additions (dentro de la VM, una vez)

Si `Z:` e `Y:` no aparecen en el Explorador: menú de la VM > Dispositivos > Insertar imagen de CD de las Guest Additions, ejecuta `VBoxWindowsAdditions.exe` y reinicia.

## 4. Sigue la guía principal dentro de la VM

Haz el camino rápido de la guía principal con estas diferencias:
- No uses `E:` (puede ser otro disco): usa `Z:` para proyectos e `Y:` para tu repo y memorias.
- El instalador debe terminar con `Memorias en: Y:\memorias`.
- Dentro de una VM de VirtualBox, el instalador configura git para aceptar las carpetas compartidas.

*Mi ejemplo:* `cd Z:\mi-proyecto; opencode`.
