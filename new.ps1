param (
    [Parameter(Mandatory=$true)]
    [string]$PostNumber
)

# Get the current date in YYYY-MM-DDTHH:MM:SS format
$dateStr = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
$filePath = "content\posts\$PostNumber.md"

# Check if the file already exists so we don't accidentally overwrite it
if (Test-Path $filePath) {
    Write-Host "Error: Post $PostNumber already exists at $filePath" -ForegroundColor Red
    exit 1
}

# Create the TOML frontmatter block
$content = @"
+++
title = "$PostNumber"
date = $dateStr
+++

"@

# Write the content to the new markdown file
Set-Content -Path $filePath -Value $content
Write-Host "Created new post at $filePath!" -ForegroundColor Green
