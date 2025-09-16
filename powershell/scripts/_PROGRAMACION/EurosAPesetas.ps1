# Script: EurosAPesetas.ps1
# Convierte euros a pesetas (1 € = 166.386 ptas)

$euros = [double](Read-Host "Introduce la cantidad en euros")
$pesetas = $euros * 166.386

Write-Host "$euros euros equivalen a $pesetas pesetas"