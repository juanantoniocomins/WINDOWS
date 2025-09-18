# Pedir cuatro números y sumarlos
$n1 = Read-Host "Introduce el primer número"
$n2 = Read-Host "Introduce el segundo número"
$n3 = Read-Host "Introduce el tercer número"
$n4 = Read-Host "Introduce el cuarto número"

$suma = [double]$n1 + [double]$n2 + [double]$n3 + [double]$n4
Write-Host "La suma total es: $suma"
