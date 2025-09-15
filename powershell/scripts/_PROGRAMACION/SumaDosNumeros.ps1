# Script: SumaDosNumeros.ps1
# Pide dos números y muestra la suma

# Pedimos el primer número
$num1 = Read-Host "Introduce el primer número"
# Pedimos el segundo número
$num2 = Read-Host "Introduce el segundo número"

# Convertimos a número (por defecto Read-Host es texto)
$num1 = [double]$num1
$num2 = [double]$num2

# Sumamos
$suma = $num1 + $num2

# Mostramos resultado
Write-Host "La suma de $num1 + $num2 es: $suma"