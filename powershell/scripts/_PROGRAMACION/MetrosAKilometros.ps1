# Script: MetrosAKilometros.ps1
# Convierte metros a kilómetros

$metros = [double](Read-Host "Introduce la cantidad en metros")
$kilometros = $metros / 1000

Write-Host "$metros metros equivalen a $kilometros kilómetros"
