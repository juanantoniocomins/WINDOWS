# Pedir número
$num = Read-Host "Introduce un número"

if ([int]$num % 2 -eq 0) {
    Write-Host "$num es par"
} else {
    Write-Host "$num es impar"
}
