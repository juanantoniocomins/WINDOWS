# Tablas de multiplicar del 1 al 10
for ($num = 1; $num -le 10; $num++) {
    Write-Host "`n--- Tabla del $num ---"
    for ($i = 1; $i -le 10; $i++) {
        $resultado = $num * $i
        Write-Host "$num x $i = $resultado"
    }
}
