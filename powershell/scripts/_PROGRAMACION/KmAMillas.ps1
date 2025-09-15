# Script: KmAMillas.ps1
# Convierte kilómetros a millas

$kms = [double](Read-Host "Introduce la distancia en kilómetros")

# 1 km = 0.621371 millas
$millas = $kms * 0.621371

Write-Host "$kms kilómetros equivalen a $millas millas"
