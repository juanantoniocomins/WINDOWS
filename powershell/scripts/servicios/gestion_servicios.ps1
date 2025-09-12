<# Gestión de Servicios Windows 10/11 #>

function Mostrar-Menu {
    Clear-Host
    Write-Host "=============================="
    Write-Host " Gestión de Servicios "
    Write-Host "=============================="
    Write-Host "1. Listar servicios"
    Write-Host "2. Iniciar servicio"
    Write-Host "3. Detener servicio"
    Write-Host "4. Reiniciar servicio"
    Write-Host "5. Cambiar tipo de arranque"
    Write-Host "0. Salir"
    Write-Host "=============================="
}

function Listar-Servicios {
    Get-Service | Sort-Object Status, DisplayName | Format-Table -AutoSize
    Pause
}

function Iniciar-Servicio {
    $nombre = Read-Host "Nombre del servicio (ej: wlansvc)"
    Start-Service -Name $nombre
    Write-Host "Servicio $nombre iniciado."
    Pause
}

function Detener-Servicio {
    $nombre = Read-Host "Nombre del servicio"
    Stop-Service -Name $nombre
    Write-Host "Servicio $nombre detenido."
    Pause
}

function Reiniciar-Servicio {
    $nombre = Read-Host "Nombre del servicio"
    Restart-Service -Name $nombre
    Write-Host "Servicio $nombre reiniciado."
    Pause
}

function Cambiar-Arranque {
    $nombre = Read-Host "Nombre del servicio"
    $tipo = Read-Host "Tipo de arranque (Automatic, Manual, Disabled)"
    Set-Service -Name $nombre -StartupType $tipo
    Write-Host "Servicio $nombre cambiado a arranque $tipo."
    Pause
}

# Bucle principal
do {
    Mostrar-Menu
    $opcion = Read-Host "Selecciona una opción"
    switch ($opcion) {
        1 { Listar-Servicios }
        2 { Iniciar-Servicio }
        3 { Detener-Servicio }
        4 { Reiniciar-Servicio }
        5 { Cambiar-Arranque }
        0 { Write-Host "Saliendo..."; break }
        default { Write-Host "Opción no válida"; Pause }
    }
} while ($true)
