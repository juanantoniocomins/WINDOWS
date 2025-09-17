<#
  TablaMultiplicar.ps1
  Muestra la tabla de multiplicar de un número hasta un límite (por defecto 10).
#>

[int]$n = Read-Host "Número"
[int]$hasta = Read-Host "¿Hasta qué multiplicador? (Enter = 10)"
if (-not $hasta) { $hasta = 10 }

for ($i = 1; $i -le $hasta; $i++) {
  "{0} x {1} = {2}" -f $n, $i, ($n * $i)
}