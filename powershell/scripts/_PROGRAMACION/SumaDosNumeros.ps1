# ==========================================================
# Nombre del archivo: SumaDosNumeros.ps1
# Descripción: Pide dos números al usuario y muestra la suma.
# Autor: Asistente Gemini
# ==========================================================

# Pedir al usuario el primer número
Write-Host "Introduce el primer número:"
$numero1 = Read-Host

# Pedir al usuario el segundo número
Write-Host "Introduce el segundo número:"
$numero2 = Read-Host

# Convertir las entradas de texto a números para poder sumarlos
$suma = [decimal]$numero1 + [decimal]$numero2

# Mostrar el resultado
Write-Host "La suma de los dos números es: $suma"