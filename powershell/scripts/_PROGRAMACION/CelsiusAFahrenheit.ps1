# ==========================================================
# Nombre del archivo: CelsiusAFahrenheit.ps1
# Descripción: Convierte una temperatura de Celsius a Fahrenheit.
# Autor: Asistente Gemini
# ==========================================================

# Pedir al usuario que introduzca la temperatura en Celsius
Write-Host "Introduce la temperatura en grados Celsius:"
$celsius = Read-Host

# Convertir la entrada a un número decimal para el cálculo
$celsius_numerico = [decimal]$celsius

# Calcular la temperatura en Fahrenheit usando la fórmula: (C * 9/5) + 32
$fahrenheit = ($celsius_numerico * 9/5) + 32

# Mostrar el resultado al usuario
Write-Host "La temperatura de $celsius grados Celsius equivale a $fahrenheit grados Fahrenheit."