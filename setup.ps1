# EnergyCraft Modpack - Setup Script (Windows PowerShell)
# Downloads and extracts the mod archive from GitHub Releases

param(
    [string]$Version = "latest"
)

$ErrorActionPreference = "Stop"
$RepoOwner = "huskywingspan"
$RepoName = "ENERGYCRAFT"
$ModsDir = "mods"
$ArchiveName = "energycraft-mods.zip"

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  EnergyCraft Modpack Setup Script   " -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# Check if mods folder exists
if (-not (Test-Path $ModsDir)) {
    New-Item -ItemType Directory -Path $ModsDir | Out-Null
    Write-Host "[+] Created mods directory" -ForegroundColor Green
}

# Get release info from GitHub API
Write-Host "[*] Fetching release information..." -ForegroundColor Yellow

if ($Version -eq "latest") {
    $ReleaseUrl = "https://api.github.com/repos/$RepoOwner/$RepoName/releases/latest"
} else {
    $ReleaseUrl = "https://api.github.com/repos/$RepoOwner/$RepoName/releases/tags/$Version"
}

try {
    $Release = Invoke-RestMethod -Uri $ReleaseUrl -Headers @{"Accept"="application/vnd.github.v3+json"}
    Write-Host "[+] Found release: $($Release.tag_name)" -ForegroundColor Green
} catch {
    Write-Host "[!] Failed to fetch release info. Check your internet connection." -ForegroundColor Red
    Write-Host "[!] Or download manually from: https://github.com/$RepoOwner/$RepoName/releases" -ForegroundColor Red
    exit 1
}

# Find the mods archive asset
$ModsAsset = $Release.assets | Where-Object { $_.name -eq $ArchiveName }

if (-not $ModsAsset) {
    Write-Host "[!] Could not find $ArchiveName in release assets" -ForegroundColor Red
    Write-Host "[!] Available assets:" -ForegroundColor Red
    $Release.assets | ForEach-Object { Write-Host "    - $($_.name)" }
    exit 1
}

$DownloadUrl = $ModsAsset.browser_download_url
$TempFile = Join-Path $env:TEMP $ArchiveName

Write-Host "[*] Downloading mods archive ($([math]::Round($ModsAsset.size / 1MB, 2)) MB)..." -ForegroundColor Yellow

try {
    # Use BITS for better download experience, fallback to Invoke-WebRequest
    if (Get-Command Start-BitsTransfer -ErrorAction SilentlyContinue) {
        Start-BitsTransfer -Source $DownloadUrl -Destination $TempFile -Description "Downloading EnergyCraft mods..."
    } else {
        Invoke-WebRequest -Uri $DownloadUrl -OutFile $TempFile -UseBasicParsing
    }
    Write-Host "[+] Download complete" -ForegroundColor Green
} catch {
    Write-Host "[!] Download failed: $_" -ForegroundColor Red
    exit 1
}

# Extract archive
Write-Host "[*] Extracting mods to $ModsDir..." -ForegroundColor Yellow

try {
    # Clear existing mods (optional - comment out if you want to preserve custom mods)
    # Get-ChildItem -Path $ModsDir -Filter "*.jar" | Remove-Item -Force
    
    Expand-Archive -Path $TempFile -DestinationPath $ModsDir -Force
    Write-Host "[+] Extraction complete" -ForegroundColor Green
} catch {
    Write-Host "[!] Extraction failed: $_" -ForegroundColor Red
    exit 1
}

# Cleanup
Remove-Item $TempFile -Force -ErrorAction SilentlyContinue

# Count mods
$ModCount = (Get-ChildItem -Path $ModsDir -Filter "*.jar").Count

Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  Setup Complete!                    " -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Mods installed: $ModCount" -ForegroundColor Green
Write-Host "  Version: $($Release.tag_name)" -ForegroundColor Green
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor Yellow
Write-Host "  1. Launch Minecraft 1.12.2 with Forge 14.23.5.2855" -ForegroundColor White
Write-Host "  2. Select this instance folder" -ForegroundColor White
Write-Host "  3. Enjoy EnergyCraft!" -ForegroundColor White
Write-Host ""
