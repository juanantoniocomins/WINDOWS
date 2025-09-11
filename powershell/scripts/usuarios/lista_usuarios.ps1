# Script: ListarUsuarios.ps1
# Muestra todos los usuarios locales del equipo actual,
# si están habilitados y su tipo de cuenta (Administrador/Usuario/Invitado)
# Salida en tabla ordenada

Write-Host "=== Usuarios locales en este equipo ===" -ForegroundColor Cyan

# Función para detectar roles del usuario
function Get-UserRole {
    param(
        [string]$UserName
    )
    $role = @()

    # Consultar grupos locales
    try {
        $groups = (Get-LocalGroupMember -Group "Administrators" -ErrorAction SilentlyContinue).Name
        if ($groups -contains $UserName -or $groups -contains "$env:COMPUTERNAME\$UserName") {
            $role += "Administrador local"
        }
    } catch {}

    try {
        $groups = (Get-LocalGroupMember -Group "Guests" -ErrorAction SilentlyContinue).Name
        if ($groups -contains $UserName -or $groups -contains "$env:COMPUTERNAME\$UserName") {
            $role += "Invitado"
        }
    } catch {}

    if (-not $role) {
        $role = "Usuario estándar"
    }

    return ($role -join ", ")
}

# Recoger datos en una lista
$listaUsuarios = @()

try {
    # Método moderno
    $usuarios = Get-LocalUser
    foreach ($u in $usuarios) {
        $rol = Get-UserRole -UserName $u.Name
        $listaUsuarios += [PSCustomObject]@{
            Usuario    = $u.Name
            Habilitado = $u.Enabled
            Tipo       = $rol
        }
    }
}
catch {
    # Alternativa usando WMI (para versiones antiguas)
    Write-Host "Get-LocalUser no disponible, usando WMI..." -ForegroundColor Yellow
    $usuarios = Get-WmiObject Win32_UserAccount -Filter "LocalAccount=True"
    foreach ($u in $usuarios) {
        # Detectar tipo de cuenta básico
        if ($u.Name -match "Guest") {
            $rol = "Invitado"
        } elseif ($u.SID -match "-500$") {
            $rol = "Administrador local"
        } else {
            $rol = "Usuario estándar"
        }
        $listaUsuarios += [PSCustomObject]@{
            Usuario    = $u.Name
            Habilitado = ($u.Disabled -eq $false)
            Tipo       = $rol
        }
    }
}

# Mostrar en tabla ordenada
$listaUsuarios | Sort-Object Tipo,Usuario | Format-Table -AutoSize
