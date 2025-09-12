<# 
    Script: Gestión de Grupos Locales (Windows 10/11)
    Autor: Juanan
    Descripción:
      Permite gestionar grupos locales desde PowerShell con un menú interactivo.
      Es necesario ejecutarlo con privilegios de Administrador.
#>

function Mostrar-Menu {
    Clear-Host
    Write-Host "=============================="
    Write-Host " Gestión de Grupos Locales "
    Write-Host "=============================="
    Write-Host "1. Listar grupos locales"
    Write-Host "2. Crear grupo"
    Write-Host "3. Eliminar grupo"
    Write-Host "4. Ver miembros de un grupo"
    Write-Host "5. Añadir usuario a un grupo"
    Write-Host "6. Quitar usuario de un grupo"
    Write-Host "0. Salir"
    Write-Host "=============================="
}

function Listar-Grupos {
    Get-LocalGroup | Format-Table Name, Description
    Pause
}

function Crear-Grupo {
    $nombre = Read-Host "Introduce el nombre del nuevo grupo"
    $desc = Read-Host "Introduce la descripción (opcional)"
    New-LocalGroup -Name $nombre -Description $desc
    Write-Host "Grupo $nombre creado correctamente."
    Pause
}

function Eliminar-Grupo {
    $nombre = Read-Host "Introduce el nombre del grupo a eliminar"
    Remove-LocalGroup -Name $nombre
    Write-Host "Grupo $nombre eliminado."
    Pause
}

function Ver-Miembros {
    $grupo = Read-Host "Introduce el nombre del grupo"
    Get-LocalGroupMember -Group $grupo | Format-Table Name, ObjectClass, PrincipalSource
    Pause
}

function Añadir-A-Grupo {
    $grupo = Read-Host "Nombre del grupo"
    $usuario = Read-Host "Nombre del usuario o cuenta (ej: Juanan o DOMINIO\Usuario)"
    Add-LocalGroupMember -Group $grupo -Member $usuario
    Write-Host "Usuario $usuario añadido al grupo $grupo."
    Pause
}

function Quitar-De-Grupo {
    $grupo = Read-Host "Nombre del grupo"
    $usuario = Read-Host "Nombre del usuario o cuenta (ej: Juanan o DOMINIO\Usuario)"
    Remove-LocalGroupMember -Group $grupo -Member $usuario
    Write-Host "Usuario $usuario eliminado del grupo $grupo."
    Pause
}

# Bucle principal del menú
do {
    Mostrar-Menu
    $opcion = Read-Host "Selecciona una opción"

    switch ($opcion) {
        1 { Listar-Grupos }
        2 { Crear-Grupo }
        3 { Eliminar-Grupo }
        4 { Ver-Miembros }
        5 { Añadir-A-Grupo }
        6 { Quitar-De-Grupo }
        0 { Write-Host "Saliendo..."; break }
        default { Write-Host "Opción no válida"; Pause }
    }
} while ($true)
