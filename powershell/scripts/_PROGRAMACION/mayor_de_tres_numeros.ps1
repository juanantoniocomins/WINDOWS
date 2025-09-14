# MayorTres.ps1
# Script simple en PowerShell para obtener el mayor de tres números (sin funciones)

# Pedir tres números
$num1 = Read-Host "Introduce el primer número"
$num2 = Read-Host "Introduce el segundo número"
$num3 = Read-Host "Introduce el tercer número"

# Comprobar cuál es el mayor
if ($num1 -ge $num2 -and $num1 -ge $num3) {
    Write-Host "El mayor es $num1"
}
elseif ($num2 -ge $num1 -and $num2 -ge $num3) {
    Write-Host "El mayor es $num2"
}
else {
    Write-Host "El mayor es $num3"
}