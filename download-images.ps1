# Script para baixar as imagens do Framer CDN
# Execute: .\download-images.ps1

$imagesDir = "$PSScriptRoot\images"
if (!(Test-Path $imagesDir)) { New-Item -ItemType Directory -Path $imagesDir | Out-Null }

$images = @(
    @{ url = "https://framerusercontent.com/images/PGe7lS343rJ80VHQztUUuAKilHc.jpg"; file = "hero.jpg" },
    @{ url = "https://framerusercontent.com/images/1IBFNRuNBx6H1M2tiRP7JUxENc.jpg";  file = "lifeway.jpg" },
    @{ url = "https://framerusercontent.com/images/m0dfmfGirWPGI3dRweVl7fAfl0.jpg";  file = "group.jpg" },
    @{ url = "https://framerusercontent.com/images/6OIekwh6r1lvoYxpjUdAHnWbIJ0.png"; file = "workshop-card.png" },
    @{ url = "https://framerusercontent.com/images/nPZovIRUUrr2OV4GpxXrqCOKwm0.jpg"; file = "footer.jpg" }
)

foreach ($img in $images) {
    $dest = Join-Path $imagesDir $img.file
    Write-Host "Baixando $($img.file)..."
    Invoke-WebRequest -Uri $img.url -OutFile $dest -UseBasicParsing
    Write-Host "  OK: $dest"
}

Write-Host ""
Write-Host "Todas as imagens foram baixadas em: $imagesDir"
