$ErrorActionPreference = "Stop"

$base = "https://raw.githubusercontent.com/Miguigraming987/OpenCode-Maikel/main"
$destino = Join-Path $env:USERPROFILE ".config\opencode"
$utf8 = New-Object System.Text.UTF8Encoding($false)

function Obtener($nombre) {
    if ($PSScriptRoot) {
        $local = Join-Path $PSScriptRoot $nombre
        if (Test-Path $local) { return [IO.File]::ReadAllText($local, $utf8).Replace("`r`n", "`n") }
    }
    $resp = Invoke-WebRequest -Uri "$base/$nombre" -UseBasicParsing
    return $utf8.GetString($resp.RawContentStream.ToArray()).Replace("`r`n", "`n")
}

function Buscar-Memorias {
    $raices = @(Get-PSDrive -PSProvider FileSystem | ForEach-Object { $_.Root })
    $raices += "\\VBoxSvr\AGENTES_IA\"
    $subs = @("memorias", "13. AgentesIA\memorias", "3. HERRAMIENTAS Y RECURSOS\13. AgentesIA\memorias")
    foreach ($raiz in $raices) {
        foreach ($sub in $subs) {
            $candidata = Join-Path $raiz $sub
            if (Test-Path (Join-Path $candidata ".memorias-agente")) { return $candidata }
        }
    }
    return "NO_ENCONTRADA"
}

New-Item -ItemType Directory -Force -Path $destino | Out-Null

$agents = Join-Path $destino "AGENTS.md"
$prompt = Join-Path $destino "crea-profesor.md"
$memorias = Buscar-Memorias

$textoAgents = (Obtener "config/AGENTS.global.md").Replace("{{CREA_PROFESOR}}", $prompt).Replace("{{MEMORIAS}}", $memorias)
$skill = (Obtener "skills/profesor/SKILL.md").TrimEnd("`n")
$textoPrompt = (Obtener "config/crea-profesor.template.md").Replace("{{SKILL}}", $skill)

if ((Test-Path $agents) -and ([IO.File]::ReadAllText($agents, $utf8) -ne $textoAgents)) {
    Copy-Item $agents "$agents.bak" -Force
    Write-Host "Copia de seguridad creada: $agents.bak"
}

[IO.File]::WriteAllText($agents, $textoAgents, $utf8)
[IO.File]::WriteAllText($prompt, $textoPrompt, $utf8)

if ((Get-Command git -ErrorAction SilentlyContinue) -and ((Get-CimInstance Win32_ComputerSystem).Model -eq "VirtualBox")) {
    git config --global --replace-all safe.directory "*"
}

Write-Host "Instalado en $destino"
if ($memorias -eq "NO_ENCONTRADA") {
    Write-Host "AVISO: no encuentro la carpeta de memorias (revisa las carpetas compartidas Y: y Z: y repite la instalacion)."
} else {
    Write-Host "Memorias en: $memorias"
}
Write-Host "Abre OpenCode en tu proyecto y escribe: Crea Profesor"
