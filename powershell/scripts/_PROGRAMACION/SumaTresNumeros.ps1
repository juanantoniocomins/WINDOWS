# Script: SumaTresNumeros.ps1
# Pide tres números y muestra la suma

$num1 = [double](Read-Host "Introduce el primer número")
$num2 = [double](Read-Host "Introduce el segundo número")
$num3 = [double](Read-Host "Introduce el tercer número")

$suma = $num1 + $num2 + $num3

Write-Host "La suma de $num1 + $num2 + $num3 es: $suma"