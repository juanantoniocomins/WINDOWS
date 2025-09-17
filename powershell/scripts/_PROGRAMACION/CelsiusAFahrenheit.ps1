<#
  CelsiusAFahrenheit.ps1
  Conversión simple entre °C y °F con menú.
#>

Write-Host "Conversión de temperatura"
Write-Host "1) Celsius -> Fahrenheit"
Write-Host "2) Fahrenheit -> Celsius"
$op = Read-Host "Elige opción (1/2)"

switch ($op) {
  '1' {
    [double]$c = Read-Host "Introduce °C"
    $f = ($c * 9/5) + 32
    "{0:N2} °C = {1:N2} °F" -f $c, $f
  }
  '2' {
    [double]$f = Read-Host "Introduce °F"
    $c = ($f - 32) * 5/9
    "{0:N2} °F = {1:N2} °C" -f $f, $c
  }
  default { Write-Host "Opción no válida." -ForegroundColor Yellow }
}