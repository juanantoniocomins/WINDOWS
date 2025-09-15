# Script: CalcularDescuento.ps1
# Pide un precio y un porcentaje de descuento y calcula el precio final

$precio = [double](Read-Host "Introduce el precio")
$porcentaje = [double](Read-Host "Introduce el porcentaje de descuento (por ejemplo 15 para 15%)")

# Calculamos el importe del descuento
$descuento = ($precio * $porcentaje) / 100

# Calculamos precio final
$precioFinal = $precio - $descuento

Write-Host "Descuento: $descuento"
Write-Host "Precio final tras descuento: $precioFinal"
