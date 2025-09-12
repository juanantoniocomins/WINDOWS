<# 
    Script: Gestión de Usuarios Locales (Windows 10/11)
    Autor: Juanan
    Descripción:
      Permite gestionar usuarios locales desde PowerShell con un menú interactivo.
      Es necesario ejecutarlo con privilegios de Administrador.
#>

function Mostrar-Menu {
    Clear-Host
    Write-Host "=============================="
    Write-Host " Gestión de Usuarios Locales "
    Write-Host "=============================="
    Write-Host "1. Listar usuarios locales"
    Write-Host "2. Crear usuario"
    Write-Host "3. Eliminar usuario"
    Write-Host "4. Añadir usuario a un grupo"
    Write-Host "5. Bloquear usuario"
    Write-Host "6. Desbloquear usuario"
    Write-Host "7. Restablecer contraseña"
    Write-Host "0. Salir"
    Write-Host "=============================="
}

function Listar-Usuarios {
    Get-LocalUser | Format-Table Name, Enabled, LastLogon
    Pause
}

function Crear-Usuario {
    $nombre = Read-Host "Introduce el nombre del nuevo usuario"
    $pass = Read-Host "Introduce la contraseña" -AsSecureString
    New-LocalUser -Name $nombre -Password $pass -FullName $nombre -Description "Usuario creado desde PowerShell"
    Write-Host "Usuario $nombre creado correctamente."
    Pause
}

function Eliminar-Usuario {
    $nombre = Read-Host "Introduce el nombre del usuario a eliminar"
    Remove-LocalUser -Name $nombre
    Write-Host "Usuario $nombre eliminado."
    Pause
}

function Añadir-A-Grupo {
    $nombre = Read-Host "Nombre del usuario"
    $grupo = Read-Host "Nombre del grupo (ej: Administrators, Users)"
    Add-LocalGroupMember -Group $grupo -Member $nombre
    Write-Host "Usuario $nombre añadido al grupo $grupo."
    Pause
}

function Bloquear-Usuario {
    $nombre = Read-Host "Usuario a bloquear"
    Disable-LocalUser -Name $nombre
    Write-Host "Usuario $nombre bloqueado."
    Pause
}

function Desbloquear-Usuario {
    $nombre = Read-Host "Usuario a desbloquear"
    Enable-LocalUser -Name $nombre
    Write-Host "Usuario $nombre desbloqueado."
    Pause
}

function Restablecer-Contraseña {
    $nombre = Read-Host "Usuario al que restablecer contraseña"
    $pass = Read-Host "Nueva contraseña" -AsSecureString
    Set-LocalUser -Name $nombre -Password $pass
    Write-Host "Contraseña restablecida para $nombre."
    Pause
}

# Bucle principal del menú
do {
    Mostrar-Menu
    $opcion = Read-Host "Selecciona una opción"

    switch ($opcion) {
        1 { Listar-Usuarios }
        2 { Crear-Usuario }
        3 { Eliminar-Usuario }
        4 { Añadir-A-Grupo }
        5 { Bloquear-Usuario }
        6 { Desbloquear-Usuario }
        7 { Restablecer-Contraseña }
        0 { Write-Host "Saliendo..."; break }
        default { Write-Host "Opción no válida"; Pause }
    }
} while ($true)
