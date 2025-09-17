<#
  EsPrimo.ps1
  Dice si un número entero es primo. Si no lo es, muestra un divisor encontrado.
#>

[int]$n = Read-Host "Introduce un número entero"
if ($n -lt 2) {
  Write-Host "$n NO es primo (por definición)."
  return
}

$esPrimo = $true
$divisor = $null
$lim = [int][math]::Sqrt($n)

for ($i = 2; $i -le $lim; $i++) {
  if ($n % $i -eq 0) { $esPrimo = $false; $divisor = $i; break }
}

if ($esPrimo) {
  Write-Host "$n es PRIMO."
} else {
  Write-Host "$n NO es primo. Un divisor es $divisor (porque $n = $divisor x $($n / $divisor))."
}
