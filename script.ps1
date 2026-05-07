# 1. Vérification Admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "ERREUR : Lancez PowerShell en tant qu'administrateur !" -ForegroundColor Red
    exit
}

# 2. Partie BACKEND
Write-Host "Configuration Backend..." -ForegroundColor Cyan
Set-Location "$PSScriptRoot/waha/media"
if (Test-Path "back.txt") { Remove-Item "media.txt" }
docker compose up -d

# 3. Partie API
Write-Host "Configuration API..." -ForegroundColor Cyan
Set-Location "$PSScriptRoot/waha/sessions"
if (Test-Path "api.txt") { Remove-Item "session.txt" }
docker compose up -d

# 4. Affichage des liens
Write-Host "`nTermine ! Accès aux services :" -ForegroundColor Green
Write-Host "http://localhost:3000"
Write-Host "http://localhost:5678"