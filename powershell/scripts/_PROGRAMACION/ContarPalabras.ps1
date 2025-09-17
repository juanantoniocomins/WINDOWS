<# 
  ContarPalabras.ps1
  Pide un texto y muestra nº de palabras, nº de caracteres (con y sin espacios).
#>

$texto = Read-Host "Escribe un texto"
# Palabras separadas por espacios en blanco (múltiples, tabs, etc.)
$palabras = ($texto -split '\s+' | Where-Object { $_ -ne '' })
$numPalabras = $palabras.Count

$charsConEspacios = $texto.Length
$charsSinEspacios = ($texto -replace '\s', '').Length

Write-Host "Palabras: $numPalabras"
Write-Host "Caracteres (con espacios): $charsConEspacios"
Write-Host "Caracteres (sin espacios): $charsSinEspacios"