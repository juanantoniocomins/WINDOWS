# Script: LoginSimple.ps1
# Comprueba usuario y contraseña contra variables almacenadas

# Variables con usuario y contraseña válidos
$usuarioValido = "juan"
$contrasenaValida = "1234"

# Pedir usuario y contraseña al usuario
$usuario = Read-Host "Introduce tu usuario"
$contrasena = Read-Host "Introduce tu contraseña" -AsSecureString
# Convertimos la contraseña segura a texto para compararla (solo para este ejemplo)
$contrasenaTexto = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($contrasena))

# Comprobamos
if ($usuario -eq $usuarioValido -and $contrasenaTexto -eq $contrasenaValida) {
    Write-Host "Acceso concedido. Bienvenido $usuario."
} else {
    Write-Host "Usuario o contraseña incorrectos. Acceso denegado."
}
