# Pedir horas y convertir a minutos
$horas = Read-Host "Introduce el número de horas"
$minutos = [int]$horas * 60
Write-Host "$horas horas son $minutos minutos"
