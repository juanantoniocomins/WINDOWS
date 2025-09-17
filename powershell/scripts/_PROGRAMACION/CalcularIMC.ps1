<#
  CalcularIMC.ps1
  Calcula el IMC = peso(kg) / altura(m)^2 y clasifica el resultado.
#>

[double]$peso = Read-Host "Peso en kg (ej. 72.5)"
[double]$altura = Read-Host "Altura en metros (ej. 1.75)"

if ($peso -le 0 -or $altura -le 0) {
  Write-Host "Valores no válidos." -ForegroundColor Yellow
  exit
}

$imc = $peso / ($altura * $altura)
$clasificacion = switch ($imc) {
  {$_ -lt 18.5} { "Bajo peso"; break }
  {$_ -lt 25}   { "Normopeso"; break }
  {$_ -lt 30}   { "Sobrepeso"; break }
  default       { "Obesidad" }
}

"{0:N2} (IMC) -> {1}" -f $imc, $clasificacion
