$GitHubBaseDirectory = "~\Documents\GitHub\"
$PoshThemesPath = "$env:POSH_THEMES_PATH"
$ChocolateyProfilePath = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"

Remove-Item -Path Alias:nv -Force # Elimina Alias nv para no tener conflictos con la funcion nv

# Función: Abrir configuraciones de nvim con nvim
function initn {
  nvim "C:\Users\Andrey\AppData\Local\nvim\nvim\init.lua"
}

# Función: Abrir configuraciones de nvim con vscode
function initc {
  code "C:\Users\Andrey\AppData\Local\nvim\nvim\init.lua"
}

# Función: Abrir $PROFILE con nvim
function profilen {
  nvim $PROFILE
}

# Función: Abrir $PROFILE con vscode
function profilec {
  code .$PROFILE
}

# Función: Abrir nvim en una carpeta específica dentro del directorio de GitHub. `nv {Nombre carpeta}`
function nv {
  param (
    [string]$project
  )
  $fullPath = Join-Path $GitHubBaseDirectory $project

  # Verifica si el directorio existe
  if (Test-Path $fullPath -PathType Container) {
    Set-Location $fullPath  # Cambia al directorio existente
    Write-Host "Abriendo NVIM👾"
    & nvim # Abrir nvim en el directorio
    return
  }

  # Pregunta al usuario si desea crear la carpeta
  $crearCarpeta = Read-Host -Prompt "El directorio '$project' no existe. ¿Desea crearlo? (S/N)"

  $crearCarpeta = $crearCarpeta.Substring(0, 1).ToLower()

  # Crea la carpeta si el usuario lo desea
  if ($crearCarpeta -in @('s', 'y')) {
    New-Item -ItemType Directory -Path $fullPath | Out-Null
    Set-Location $fullPath
    Write-Host "Se creó el directorio '$project'."
    Write-Host "Abriendo NVIM👾"
    & nvim # Abrir nvim en el directorio
  }
  else {
    Write-Host "No se realizó ningún cambio."
    return
  }
}

# Función: Abrir vscode en una carpeta específica dentro del directorio de GitHub. `c {Nombre carpeta}`
function c {
  param (
    [string]$project
  )
  $fullPath = Join-Path $GitHubBaseDirectory $project

  # Verifica si el directorio existe
  if (Test-Path $fullPath -PathType Container) {
    Set-Location $fullPath  # Cambia al directorio existente
    Write-Host "Abriendo VS CODE🚀"
    & code .  # Ejecuta 'code .' en el directorio
    return
  }

  # Pregunta al usuario si desea crear la carpeta
  $crearCarpeta = Read-Host -Prompt "El directorio '$project' no existe. ¿Desea crearlo? (S/N)"

  $crearCarpeta = $crearCarpeta.Substring(0, 1).ToLower()

  # Crea la carpeta si el usuario lo desea
  if ($crearCarpeta -in @('s', 'y')) {
    New-Item -ItemType Directory -Path $fullPath | Out-Null
    Set-Location $fullPath
    Write-Host "Se creó el directorio '$project'."
    Write-Host "Abriendo VS CODE🚀"
    & code .  # Ejecuta 'code .' en el directorio
  }
  else {
    Write-Host "No se realizó ningún cambio."
    return
  }
}

# Función: Cambiar a una carpeta específica dentro del directorio de GitHub. `gh {Nombre carpeta}`
function gh {
  param (
    [string]$project
  )
  $fullPath = Join-Path $GitHubBaseDirectory $project

  # Verifica si el directorio existe
  if (Test-Path $fullPath -PathType Container) {
    Set-Location $fullPath  # Cambia al directorio existente
    return
  }

  # Pregunta al usuario si desea crear la carpeta
  $crearCarpeta = Read-Host -Prompt "La carpeta '$project' no existe. ¿Desea crearla? (S/N)"

  $crearCarpeta = $crearCarpeta.Substring(0, 1).ToLower()

  # Crea la carpeta si el usuario lo desea
  if ($crearCarpeta -in @('s', 'y')) {
    New-Item -ItemType Directory -Path $fullPath | Out-Null
    Set-Location $fullPath
    Write-Host "Se creó y cambió al directorio '$project'."
  }
  else {
    Write-Host "No se realizó ningún cambio."
  }
}

# Configuración para oh-my-posh
oh-my-posh init pwsh --config "$PoshThemesPath\gruvbox.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons
set-psreadlineoption -predictionsource HistoryAndPlugin
set-psreadlineoption -predictionviewstyle ListView

# Importa el Chocolatey Profile si está presente
if (Test-Path $ChocolateyProfilePath) {
  Import-Module $ChocolateyProfilePath
}