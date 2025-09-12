<# 
    Script: Gestión de Sesiones de Usuario (Windows 10/11)
    Autor: Juanan
    Descripción:
      Permite ver y gestionar sesiones de usuario locales y RDP.
      Necesario ejecutar como Administrador para cerrar sesiones.
#>

function Mostrar-Menu {
    Clear-Host
    Write-Host "=============================="
    Write-Host " Gestión de Sesiones de Usuario "
    Write-Host "=============================="
    Write-Host "1. Listar usuarios conectados"
    Write-Host "2. Listar sesiones activas con detalles"
    Write-Host "3. Cerrar sesión de un usuario"
    Write-Host "0. Salir"
    Write-Host "=============================="
}

function Listar-Usuarios {
    Write-Host "Usuarios actualmente conectados:"
    query user
    Pause
}

function Listar-Sesiones {
    Write-Host "Sesiones activas detalladas:"
    $sessions = Get-CimInstance Win32_LogonSession | Where-Object { $_.LogonType -eq 2 -or $_.LogonType -eq 10 }
    foreach ($session in $sessions) {
        $users = Get-CimInstance Win32_LoggedOnUser | Where-Object { $_.Dependent -match $session.LogonId }
        foreach ($user in $users) {
            $account = $user.Antecedent -replace '.*Domain="(.*?)",Name="(.*?)".*', '$1\$2'
            Write-Host ("Usuario: {0} | LogonId: {1} | Inicio sesión: {2}" -f $account, $session.LogonId, $session.StartTime)
        }
    }
    Pause
}

function Cerrar-Sesion {
    Write-Host "Para ver el ID de sesión ejecute primero '1' o '2'."
    $sessionId = Read-Host "Introduce el ID de sesión a cerrar"
    try {
        logoff $sessionId /V
        Write-Host "Sesión $sessionId cerrada correctamente."
    } catch {
        Write-Host "No se pudo cerrar la sesión $sessionId. $_"
    }
    Pause
}

# Bucle principal del menú
do {
    Mostrar-Menu
    $opcion = Read-Host "Selecciona una opción"

    switch ($opcion) {
        1 { Listar-Usuarios }
        2 { Listar-Sesiones }
        3 { Cerrar-Sesion }
        0 { Write-Host "Saliendo..."; break }
        default { Write-Host "Opción no válida"; Pause }
    }
} while ($true)
