# Script: CalcularPotencia.ps1
# Pide base y exponente y calcula la potencia

$base = [double](Read-Host "Introduce la base")
$exponente = [double](Read-Host "Introduce el exponente")

$potencia = [Math]::Pow($base, $exponente)

Write-Host "$base elevado a $exponente es igual a $potencia"
