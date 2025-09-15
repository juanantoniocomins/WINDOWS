# Script: CalcularDescuentoAplicado.ps1
# Pide precio inicial y precio final, calcula el % de descuento aplicado

$precioInicial = [double](Read-Host "Introduce el precio inicial")
$precioFinal = [double](Read-Host "Introduce el precio final")

# Calculamos descuento en porcentaje
$descuento = (($precioInicial - $precioFinal) / $precioInicial) * 100

Write-Host "El descuento aplicado es de $descuento %"