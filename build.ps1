$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    & xelatex -interaction=nonstopmode -halt-on-error -file-line-error main.tex
    if ($LASTEXITCODE -ne 0) { throw 'First XeLaTeX pass failed.' }
    & bibtex main
    if ($LASTEXITCODE -ne 0) { throw 'BibTeX failed.' }
    1..2 | ForEach-Object {
        & xelatex -interaction=nonstopmode -halt-on-error -file-line-error main.tex
        if ($LASTEXITCODE -ne 0) { throw 'XeLaTeX failed.' }
    }
    Write-Host 'Built main.pdf successfully.'
} finally { Pop-Location }
