# EnergyCraft Modpack - Mod Packaging Script (Windows PowerShell)
# Creates a zip archive of all mods for GitHub Release upload

param(
    [string]$OutputDir = ".",
    [string]$Version = "dev"
)

$ErrorActionPreference = "Stop"
$ModsDir = "mods"
$ArchiveName = "energycraft-mods.zip"

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  EnergyCraft Mod Packaging Script   " -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# Check mods folder exists
if (-not (Test-Path $ModsDir)) {
    Write-Host "[!] Mods directory not found!" -ForegroundColor Red
    exit 1
}

# Count and list mods
$Mods = Get-ChildItem -Path $ModsDir -Filter "*.jar"
$ModCount = $Mods.Count

Write-Host "[*] Found $ModCount mods:" -ForegroundColor Yellow
$Mods | ForEach-Object { Write-Host "    - $($_.Name)" -ForegroundColor Gray }
Write-Host ""

# Create archive
$OutputPath = Join-Path $OutputDir $ArchiveName

Write-Host "[*] Creating archive: $OutputPath" -ForegroundColor Yellow

try {
    if (Test-Path $OutputPath) {
        Remove-Item $OutputPath -Force
    }
    
    # Compress mods folder contents (not the folder itself)
    Compress-Archive -Path "$ModsDir\*.jar" -DestinationPath $OutputPath -CompressionLevel Optimal
    
    $ArchiveSize = [math]::Round((Get-Item $OutputPath).Length / 1MB, 2)
    Write-Host "[+] Archive created successfully" -ForegroundColor Green
    Write-Host "    Size: $ArchiveSize MB" -ForegroundColor Gray
} catch {
    Write-Host "[!] Failed to create archive: $_" -ForegroundColor Red
    exit 1
}

# Generate mod manifest
$ManifestPath = Join-Path $OutputDir "mod-manifest.txt"

Write-Host "[*] Generating mod manifest..." -ForegroundColor Yellow

$ManifestContent = @"
# EnergyCraft Modpack - Mod Manifest
# Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
# Version: $Version
# Total Mods: $ModCount

"@

$Mods | Sort-Object Name | ForEach-Object {
    $ManifestContent += "$($_.Name)`n"
}

$ManifestContent | Out-File -FilePath $ManifestPath -Encoding UTF8
Write-Host "[+] Manifest saved to: $ManifestPath" -ForegroundColor Green

Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  Packaging Complete!                " -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Archive: $ArchiveName ($ArchiveSize MB)" -ForegroundColor Green
Write-Host "  Mods: $ModCount" -ForegroundColor Green
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor Yellow
Write-Host "  1. Create a GitHub Release" -ForegroundColor White
Write-Host "  2. Upload $ArchiveName as a release asset" -ForegroundColor White
Write-Host "  3. Users can then run setup.ps1 to download" -ForegroundColor White
Write-Host ""
