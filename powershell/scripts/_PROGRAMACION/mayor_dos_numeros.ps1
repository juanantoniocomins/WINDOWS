# Pide dos números al usuario
$num1 = Read-Host "Introduce el primer número"
$num2 = Read-Host "Introduce el segundo número"

if ($num1 -gt $num2) {
    Write-Host "El mayor es $num1"
} elseif ($num2 -gt $num1) {
    Write-Host "El mayor es $num2"
} else {
    Write-Host "Los números son iguales"
}