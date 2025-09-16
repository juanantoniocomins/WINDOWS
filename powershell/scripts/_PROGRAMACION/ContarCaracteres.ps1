# Script: ContarCaracteres.ps1
# Cuenta los caracteres de una cadena

$cadena = Read-Host "Introduce un texto"
$numCaracteres = $cadena.Length

Write-Host "La cadena '$cadena' tiene $numCaracteres caracteres"
