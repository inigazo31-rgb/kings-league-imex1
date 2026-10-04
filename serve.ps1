# ============================================================================
# KINGS LEAGUE IMEX - SERVIDOR WEB LOCAL NATIVO EN POWERSHELL
# ============================================================================
# Permite servir los archivos estáticos y ES Modules en http://localhost:8080
# sin requerir Node, Python ni paquetes externos.
# ============================================================================

$port = 8080
$prefix = "http://localhost:$port/"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)

try {
    $listener.Start()
    Write-Host "============================================================" -ForegroundColor Green
    Write-Host "  KINGS LEAGUE IMEX - SERVIDOR LOCAL ACTIVO" -ForegroundColor Yellow
    Write-Host "  URL: $prefix" -ForegroundColor Cyan
    Write-Host "  Presiona Ctrl+C para detener el servidor" -ForegroundColor Gray
    Write-Host "============================================================" -ForegroundColor Green

    # Abrir navegador por defecto automáticamente
    Start-Process $prefix

    $currentPath = Get-Location

    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $rawUrl = $request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($rawUrl)) {
            $rawUrl = "index.html"
        }

        $filePath = Join-Path $currentPath $rawUrl

        if (Test-Path $filePath -PathType Leaf) {
            $extension = [System.IO.Path]::GetExtension($filePath).ToLower()
            $contentType = switch ($extension) {
                ".html" { "text/html; charset=utf-8" }
                ".css"  { "text/css; charset=utf-8" }
                ".js"   { "application/javascript; charset=utf-8" }
                ".json" { "application/json; charset=utf-8" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".svg"  { "image/svg+xml" }
                ".ico"  { "image/x-icon" }
                default { "application/octet-stream" }
            }

            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentType = $contentType
            $response.ContentLength64 = $bytes.Length
            $response.StatusCode = 200
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $notFound = [System.Text.Encoding]::UTF8.GetBytes("404 - Archivo no encontrado")
            $response.OutputStream.Write($notFound, 0, $notFound.Length)
        }

        $response.OutputStream.Close()
    }
}
catch {
    Write-Host "Error en servidor: $_" -ForegroundColor Red
}
finally {
    $listener.Stop()
}
