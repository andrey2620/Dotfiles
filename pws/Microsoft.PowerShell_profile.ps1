$GitHubBaseDirectory = "~\Documents\GitHub\"
$PoshThemesPath = "$env:POSH_THEMES_PATH"
$ChocolateyProfilePath = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"

# Remove-Item -Path Alias:nv -Force # Elimina Alias nv para no tener conflictos con la funcion nv

# # Función: Abrir configuraciones de nvim con nvim
# function initn {
#   nvim "C:\Users\Andrey\AppData\Local\nvim\nvim\init.lua"
# }

# # Función: Abrir configuraciones de nvim con vscode
# function initc {
#   code ."C:\Users\Andrey\AppData\Local\nvim\nvim\init.lua"
# }

# # Función: Abrir $PROFILE con nvim
# function profilen {
#   nvim $PROFILE
# }

# # Función: Abrir $PROFILE con vscode
# function profilec {
#   code .$PROFILE
# }

# # Función: Abrir nvim en una carpeta específica dentro del directorio de GitHub. `nv {Nombre carpeta}`
# function nv {
#   param (
#     [string]$project
#   )
#   $fullPath = Join-Path $GitHubBaseDirectory $project

#   # Verifica si el directorio existe
#   if (Test-Path $fullPath -PathType Container) {
#     Set-Location $fullPath  # Cambia al directorio existente
#     Write-Host "Abriendo NVIM👾"
#     & nvim # Abrir nvim en el directorio
#     return
#   }

#   # Pregunta al usuario si desea crear la carpeta
#   $crearCarpeta = Read-Host -Prompt "El directorio '$project' no existe. ¿Desea crearlo? (S/N)"

#   $crearCarpeta = $crearCarpeta.Substring(0, 1).ToLower()

#   # Crea la carpeta si el usuario lo desea
#   if ($crearCarpeta -in @('s', 'y')) {
#     New-Item -ItemType Directory -Path $fullPath | Out-Null
#     Set-Location $fullPath
#     Write-Host "Se creó el directorio '$project'."
#     Write-Host "Abriendo NVIM👾"
#     & nvim # Abrir nvim en el directorio
#   }
#   else {
#     Write-Host "No se realizó ningún cambio."
#     return
#   }
# }

# # Función: Abrir vscode en una carpeta específica dentro del directorio de GitHub. `c {Nombre carpeta}`
# function c {
#   param (
#     [string]$project
#   )
#   $fullPath = Join-Path $GitHubBaseDirectory $project

#   # Verifica si el directorio existe
#   if (Test-Path $fullPath -PathType Container) {
#     Set-Location $fullPath  # Cambia al directorio existente
#     Write-Host "Abriendo VS CODE🚀"
#     & code .  # Ejecuta 'code .' en el directorio
#     return
#   }

#   # Pregunta al usuario si desea crear la carpeta
#   $crearCarpeta = Read-Host -Prompt "El directorio '$project' no existe. ¿Desea crearlo? (S/N)"

#   # Toma solo el primer carácter de la respuesta del usuario
#   $crearCarpeta = $crearCarpeta.Substring(0, 1).ToLower()

#   if ($crearCarpeta -in @('s', 'y')) {
#     # Crea la carpeta si el usuario lo desea
#     New-Item -ItemType Directory -Path $fullPath | Out-Null
#     Set-Location $fullPath
#     Write-Host "Se creó el directorio '$project'."
#     Write-Host "Abriendo VS CODE🚀"
#     & code .  # Ejecuta 'code .' en el directorio
#   }
#   else {
#     Write-Host "No se realizó ningún cambio."
#     return
#   }
# }

# Función para leer la entrada del usuario
function Read-UserInput {
  $key = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown').VirtualKeyCode
  return $key
}

# Función para mostrar el nickname
function Set-Nickname {
  $asciiArt = @"
_________/\\\_____________________________________
_________\/\\\____________________________________
__________\/\\\___________________________________
___________\/\\\______/\\\\\\\\___/\\\____/\\\____
_______/\\\\\\\\\____/\\\/////\\\_\//\\\__/\\\____
_______/\\\////\\\___/\\\\\\\\\\\___\//\\\/\\\____
_______\/\\\__\/\\\__\//\\///////_____\//\\\\\____
________\//\\\\\\\/\\__\//\\\\\\\\\\____\//\\\____
__________\///////\//____\//////////______\///____
"@
  Write-Host $asciiArt -ForegroundColor Red
}


# ui settings
function Set-UI {
  param (
    [string]$title
  )
  Clear-Host
  Set-Nickname
  Write-Host '                                                  ' -BackgroundColor Red
  Write-Host "$title" -BackgroundColor Red
  Write-Host '                                                  ' -BackgroundColor Red
  Write-Host "--------------------------------------------------"
}

# Función: Abre vscode en la carpeta que llega por parametro en el directorio de github, si no existe pregunta por crearla.
# $project: nombre de la carpeta que desea abrir
function Open-ProjectInVSCode {
  param (
    [string]$project
  )

  $fullPath = Join-Path $GitHubBaseDirectory $project

  # Verifica si el directorio existe
  if (Test-Path $fullPath -PathType Container) {
    Open-InVSCode -folder $fullPath
    return
  }

  $optionsOpenVSCode = @('Yes', 'No')
  $selectedIndex = 0
  while ($true) {
    Clear-Host
    Set-Nickname
    Write-Host   "--------------------------------------------------"
    Write-Host   "$project no existe"
    Write-Host   "--------------------------------------------------"
    Write-Host   "                 ¿Desea crearlo?                  " -BackgroundColor Red
    Write-Host   "--------------------------------------------------"
    $selectedIndex = Move-OptionsMenu -options $optionsOpenVSCode
  }
  Select-OptionMenu -selectedIndex $selectedIndex -options $optionsOpenVSCode -menu 3
}

# Función para abrir la carpeta en VS Code
function Open-InVSCode {
  param (
    [string]$folder
  )

  $fullPath = $folder

  # Verificar si el directorio existe
  if (Test-Path $fullPath -PathType Container) {
    Set-Location $fullPath  # Cambiar al directorio existente
    #Write-Host "--------------------------------------------------"
    $optionsOpenVSCode = @('Yes', 'No')
    $selectedIndex = 0
    while ($true) {
      # Clear-Host
      # Set-Nickname
      #Write-Host   "--------------------------------------------------"
      Set-UI -title '               Desea abrir VSCODE?                '
      $selectedIndex = Move-OptionsMenu -options $optionsOpenVSCode
    }
    Select-OptionMenu -selectedIndex $selectedIndex -options $optionsOpenVSCode -menu 2
  }
}

# Función: Mostrar menú principal
function Show-Menu {
  $optionsMenu = @(
    "My Projects 🗃️",
    'Create new project 🪄',
    "Open project in VS Code 📁",
    "Exit ❌"
  )
  $selectedIndex = 0

  while ($true) {
    Clear-Host
    Set-Nickname
    Set-UI -title '                       MENU                       '
    $selectedIndex = Move-OptionsMenu -options $optionsMenu
  }

  Select-OptionMenu -selectedIndex $selectedIndex -options $optionsMenu -menu 0
}

# Función: Moverse entre opciones del menu, recibe como parametro los nombres de las opciones
function Move-OptionsMenu {
  param (
    [array]$options
  )

  $index = 0
  foreach ($option in $options) {
    if ($option -eq 'Exit ❌') {
      Write-Host " "
    }

    if ($index -eq $selectedIndex) {
      Write-Host ("▶️ - {0}" -f $option.ToString().ToUpper()) -ForegroundColor Red
    }
    else {
      Write-Host ("  - {0}" -f $option.ToString().ToUpper())
    }
    $index++
  }
  Write-Host "--------------------------------------------------"


  # Bucle principal para leer la entrada del usuario
  $key = Read-UserInput

  # Flecha arriba
  if ($key -eq 38) {
    $selectedIndex = [Math]::Max(0, $selectedIndex - 1)
  }
  # Flecha abajo
  elseif ($key -eq 40) {
    $selectedIndex = [Math]::Min($options.Count - 1, $selectedIndex + 1)
  }
  # Enter
  elseif ($key -eq 13) {
    break
  }
  # Backspace
  elseif ($key -eq 8) {
    Show-Menu
    return
  }
  # ESC key
  elseif ($key -eq 27) {
    Clear-Host
    return
  }
  return $selectedIndex
}

function Select-OptionMenu {
  param (
    [int]$selectedIndex,
    [array]$options,
    [int]$menu,
    [string]$path

  )
  # Procesar la opción seleccionada
  $selectedOption = $options[$selectedIndex]

  Clear-Host
  Set-Nickname
  Write-Host "--------------------------------------------------"
  Write-Host "                                                  " -BackgroundColor Red
  Write-Host "              Opción Seleccionada                 " -BackgroundColor Red
  Write-Host "                                                  " -BackgroundColor Red
  Write-Host "--------------------------------------------------"
  if ($selectedOption -eq "Open project in VS Code 📁") {
    Write-Host "         $selectedOption       "
  }
  elseif ($selectedOption -eq "Abrir VS Code en una carpeta específica") {
    Write-Host "  $selectedOption  "
  }
  elseif ($selectedOption -eq "Yes") {
    Write-Host "             Abriendo VSCODE 🚀           "
  }


  if ($menu -eq 0) {
    switch ($selectedOption) {
      "Open project in VS Code 📁" {
        Write-Host "--------------------------------------------------"
        Write-Host "Exit para salir."
        $cd = Read-Host -Prompt 'Nombre de la carpeta'
        if (-not $cd) {
          Show-Menu
          return
        }
        elseif ($cd -eq 'Exit' -or $cd -eq 'exit') {
          Show-Menu
          return
        }
        else {
          Open-ProjectInVSCode -project $cd
        }

      }
      "My Projects 🗃️" {
        Show-FoldersList -GitHubBaseDirectory $GitHubBaseDirectory
      }
      "Create new project 🪄" {
        Build-Project
      }
      "Exit ❌" {
        Clear-Host
        return
      }
      default {
        Write-Host "Opción no válida. Inténtelo de nuevo."
      }
    }
  }

  if ($menu -eq 1) {
    switch ($selectedOption) {
      "Vite" {
        Set-Location $GitHubBaseDirectory
        Clear-Host
        Set-Nickname
        Write-Host "--------------------------------------------------"
        Write-Host "                                                  " -BackgroundColor Red
        Write-Host "         Creating new project with Vite           " -BackgroundColor Red
        Write-Host "                                                  " -BackgroundColor Red
        Write-Host "--------------------------------------------------"
        npm create vite@latest
        Write-Host "--------------------------------------------------"

        $carpetaMasReciente = Get-ChildItem -Path $GitHubBaseDirectory -Directory | Sort-Object CreationTime -Descending | Select-Object -First 1

        # Imprime la carpeta más reciente
        Set-Location $carpetaMasReciente
        Write-Host "Carpeta Actual >> $($carpetaMasReciente)"
        Write-Host "--------------------------------------------------"
        $install = Read-Host -Prompt "Desea instalar los paquetes? (Y/N)"
        $install = $install.Substring(0, 1).ToLower()
        if ($install -eq "y") {
          npm install
          Open-InVSCode $carpetaMasReciente.Name
        }
        else {
          Show-Menu
        }
      }
      "NextJS" {

      }

      "Astro" {

      }
      "Exit ❌" {
        Write-Host "Saliendo del menú..."
        Show-Menu
        return
      }
      default {
        Write-Host "Opción no válida. Inténtelo de nuevo."
      }
    }
  }
  if ($menu -eq 2) {
    switch ($selectedOption.ToString().ToUpper()) {
      "YES" {
        Start-Sleep -Seconds 5
        & code .
        Start-Sleep -Seconds 2
        Show-Menu
      }
      "NO" {
        Show-FoldersList -GitHubBaseDirectory $GitHubBaseDirectory
      }
      Default {}
    }
  }
  if ($menu -eq 3) {
    switch ($selectedOption.ToString().ToUpper()) {
      "YES" {
        New-Item -ItemType Directory -Path $fullPath | Out-Null
        Open-InVSCode -folder $fullPath
        return
      }
      "NO" {
        Show-Menu
      }
      Default {}
    }
  }

  # Set-GitActions
  if ($menu -eq 4) {
    $title = $null
    switch ($selectedOption.ToString().ToUpper()) {
      "OPEN IN VSCODE" {
        $title = "              OPEN IN VSCODE               "
      }
      "GET GITHUB STATUS" {
        $title = "              Git File Status              "
      }
      "PENDING FILES TO COMMIT" {
        $title = "          PENDING FILES TO COMMIT          "
      }
    }
    Set-GitActions -selectedOption $selectedOption -title $title -path $path
  }

  if ($menu -eq 6) {
    switch ($selectedOption.ToString().ToUpper()) {
      "SHELL" {
        Clear-Host
        return
      }
      "Terminal Project Manager" {
        Clear-Host
        Show-Menu
      }
    }
  }
}

function Set-GitActions {
  param (
    [string]$selectedOption,
    [string]$title,
    [string]$path
  )
  Clear-Host
  Set-Nickname
  Write-Host "--------------------------------------------------"
  Write-Host "                                                  " -BackgroundColor Red
  Write-Host "$title" -BackgroundColor Red
  Write-Host "                                                  " -BackgroundColor Red
  Write-Host "--------------------------------------------------"
  switch ($selectedOption.ToString().ToUpper()) {
    "OPEN IN VSCODE" {
      Open-InVSCode -folder $path
    }
    "OPEN DIRECTORY" {
      Invoke-Item .
      Show-Menu
    }
    "RUN DEV" {
      npm run dev
    }
    "GET GITHUB STATUS" {


    }
    "PENDING FILES TO COMMIT" {
      git config --global core.whitespace trailing-space, space-before-tab

      $statusOutput = git status -s




      # Verificar si la variable está vacía
      if ($null -eq $statusOutput) {
        Write-Host "        No hay cambios pendientes.         "
        Write-Host "--------------------------------------------------"
        timeout.exe /t 3
        Show-FoldersList -GitHubBaseDirectory $GitHubBaseDirectory
      }
      else {
        # Dividir la salida en líneas
        $lines = $statusOutput -split "`n"
        # Iterar a través de las líneas
        foreach ($line in $lines) {
          # Realizar acciones con cada línea
          Write-Host "$line"
        }
        Write-Host "--------------------------------------------------"
        Write-Host "                                                  "-BackgroundColor Red
        Write-Host "                 Nombre del archivo               "-BackgroundColor Red
        Write-Host "                         0                        "-BackgroundColor Red
        Write-Host "        (.) para agregar todos los archivos       "-BackgroundColor Red
        Write-Host "                                                  "-BackgroundColor Red
        Write-Host "--------------------------------------------------"
        $nameFile = Read-Host -Prompt 'Nombre'
        # Iterar a través de las líneas
        $ToPass = $false
        while ($true) {
          foreach ($line in $lines) {
            if ($nameFile -eq "exit") {
              Show-FoldersList -GitHubBaseDirectory $GitHubBaseDirectory
            }
            if ($nameFile -eq ".") {
              foreach ($line in $lines) {
                Write-Host "Estado de Git para el archivo: $line"
              }
            }
            if ($line -like "*$nameFile*") {
              Write-Host "Estado de Git para el archivo: $line"
              $ToPass = $true
              break
            }
            else {
              $nameFile = Read-Host -Prompt 'Nombre'
            }
          }
          if ($ToPass -eq $true) {
            break
          }
        }
        Add-FileToCommit -nameFile $nameFile -title "          PENDING FILES TO COMMIT          "

      }
    }
    "EXIT ❌" {
      Show-FoldersList -GitHubBaseDirectory $GitHubBaseDirectory
      return
    }
    Default {}
  }

}

function Add-FileToCommit {
  param (
    [string]$nameFile,
    [string]$title
  )

  if ($nameFile -eq '.') {
    git add .
  }
  elseif ($nameFile -eq 'EXIT' -OR $nameFile -eq 'exit') {
    Show-FoldersList -GitHubBaseDirectory $GitHubBaseDirectory
  }
  else {
    git add $nameFile
  }
  Write-Host "--------------------------------------------------"
  $confirmMessage = Read-Host -Prompt 'Mensaje descriptivo de la confirmación'
  if ($confirmMessage -eq 'EXIT' -OR $confirmMessage -eq 'exit') {
    Show-FoldersList -GitHubBaseDirectory $GitHubBaseDirectory
  }
  git commit -m $confirmMessage
  Write-Host "--------------------------------------------------"
  $branch = Read-Host -Prompt 'Cual es la rama de la que se hará el push'
  git push origin $branch
  Set-GitActions -selectedOption "PENDING FILES TO COMMIT" -title $title
}

# create project
function Build-Project {
  $optionsMenu = @(
    "Vite",
    "NextJS",
    'Astro'
    "Exit ❌"
  )

  $selectedIndex = 0

  while ($true) {
    Clear-Host
    Set-Nickname
    Set-UI -title '       Seleccione un entorno de desarrollo        '
    $selectedIndex = Move-OptionsMenu -options $optionsMenu
  }
  Select-OptionMenu -selectedIndex $selectedIndex -options $optionsMenu -menu 1
}

# Función para mostrar la lista de carpetas
function Show-FoldersList {
  param (
    [string]$GitHubBaseDirectory
  )
  # Obtener la lista de carpetas en GitHubBaseDirectory
  $folders = Get-ChildItem -Path $GitHubBaseDirectory -Directory | Select-Object -ExpandProperty Name
  $folders += 'Exit ❌'
  $selectedIndex = 0

  while ($true) {
    Write-Host    "--------------------------------------------------"
    Set-UI -title '                    MY PROJECTS                   '
    $selectedIndex = Move-OptionsMenu -options $folders
  }
  Open-Project -selectedIndex $selectedIndex


}

# function Craterepository {
#   param (

#   )
#   $githubStatus = git status
#   $githubStatus
#   if ($githubStatus -eq "nothing to commit, working tree clean") {
#     <# Action to perform if the condition is true #>
#     Write-Host "        No hay cambios pendientes.         "
#     timeout.exe /t 5
#     Show-FoldersList -GitHubBaseDirectory $GitHubBaseDirectory
#   }
#   elseif ($null -eq $githubStatus) {
#     Write-Host "--------------------------------------------------"
#     Write-Host "El proyecto no esta en un repositorio"
#     Write-Host "--------------------------------------------------"
#     $createRepository = Read-Host -Prompt "Desea crear un repositorio? (Y/N)"
#     $createRepository = $createRepository.Substring(0, 1).ToLower()
#     if ($createRepository -eq "y") {
#       Write-Host "--------------------------------------------------"
#       Write-Host "Descargar antes de seguir"
#       Write-Host "https://github.com/cli/cli/releases/download/v2.42.1/gh_2.42.1_windows_amd64.msi"
#       Write-Host "--------------------------------------------------"
#       # Verificar el estado de autenticación
#       $authStatus = gh auth status
#       $authStatus
#       $usernameMatch = [regex]::Match($authStatus, 'Logged in to github\.com account (\S+)')
#       # Comprobar si se encontró un match
#       if ($usernameMatch.Success) {
#         $username = $usernameMatch.Groups[1].Value
#       }
#       else {
#         Write-Host "No se pudo obtener el nombre de usuario."
#       }
#       # Comprobar si el estado de autenticación contiene información del usuario
#       if ($authStatus -like "*Logged in to github.com account*") {
#         Write-Host "Nombre de usuario: $username"
#         $nameRepository = Read-Host -Prompt "Nombre del repositorio?"
#         gh repo create $nameRepository --private
#         git init
#         git add README.md
#         git add .
#         $commentCommit = Read-Host -Prompt "comentario para el commit"
#         git commit -m "$commentCommit"
#         git branch -M main
#         git remote add origin "https://github.com/$username/$nameRepository.git"
#         git push -u origin main
#       }
#       else {
#         Write-Host "No estás autenticado en GitHub."
#         gh auth login
#       }
#       Set-Location $path
#     }
#     # Show-FoldersList -GitHubBaseDirectory $GitHubBaseDirectory
#   }
#   else {
#     Write-Host "--------------------------------------------------"
#   }
# }



# Función: Mostrar lista de proyectos
function Open-Project {
  param (
    [int]$selectedIndex
  )

  # Obtener la carpeta seleccionada
  $selectedFolder = $folders[$selectedIndex]

  # Usar la carpeta seleccionada
  Write-Host "  Carpeta Seleccionada >> $selectedFolder  "
  Write-Host "--------------------------------------------------"
  if ($selectedFolder -eq "EXIT ❌") {
    Show-Menu
    return
  }
  else {
    $optionsOpenVSCode = @('OPEN IN VSCODE', 'OPEN DIRECTORY', 'RUN DEV', 'RUN BUILD', 'PENDING FILES TO COMMIT', 'EXIT ❌')
    $selectedIndex = 0
    while ($true) {
      Clear-Host
      Set-Nickname
      #Write-Host   "--------------------------------------------------"
      Set-UI -title "               Que quieres hacer?                 "
      $selectedIndex = Move-OptionsMenu -options $optionsOpenVSCode
    }
    Set-Location ($GitHubBaseDirectory + $selectedFolder)
    $path = ($GitHubBaseDirectory + $selectedFolder)
    Select-OptionMenu -selectedIndex $selectedIndex -options $optionsOpenVSCode -menu 4 -path $path
    Write-Host "--------------------------------------------------"
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