# Pedir base y altura
$base = Read-Host "Introduce la base"
$altura = Read-Host "Introduce la altura"

# Calcular área
$area = [double]$base * [double]$altura

Write-Host "El área del rectángulo es: $area"