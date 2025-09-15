# Script: CalcularPrecioConDescuento.ps1
# Pide precio de artículo y porcentaje de descuento (1–100)

$precio = [double](Read-Host "Introduce el precio del artículo")

do {
    $porcentaje = [double](Read-Host "Introduce el porcentaje de descuento (entre 1 y 100)")
    if ($porcentaje -lt 1 -or $porcentaje -gt 100) {
        Write-Host "El descuento debe estar entre 1 y 100. Inténtalo de nuevo."
    }
} while ($porcentaje -lt 1 -or $porcentaje -gt 100)

$descuento = ($precio * $porcentaje) / 100
$precioFinal = $precio - $descuento

Write-Host "Descuento: $descuento"
Write-Host "Precio final tras descuento: $precioFinal"
