<#
.SYNOPSIS
    Genera i changelog Liquibase (YAML) per un database, leggendo i file .sql
    gia' prodotti da split-ddl-export.ps1 nelle sottocartelle del database.

.PARAMETER DatabaseRoot
    Cartella radice del database (es. databases/Anaconda), contenente le
    sottocartelle SQL/, Viste/, Procedure/, Funzioni/ e changelog/.

.PARAMETER DatabaseName
    Nome del database, usato come prefisso degli id dei changeSet
    (es. Anaconda-tabelle-001_create_xxx).

.PARAMETER Author
    Valore dell'attributo author nei changeSet Liquibase.

.EXAMPLE
    # PowerShell, dalla root del repository (usa i valori di default nel param())
    .\tools\generate-changelog.ps1

.EXAMPLE
    # PowerShell, con parametri espliciti
    .\tools\generate-changelog.ps1 `
      -DatabaseRoot ".\databases\Anaconda" `
      -DatabaseName "Anaconda"
#>
param(
    # Modifica questi default per lanciare lo script senza parametri,
    # oppure sovrascrivili passando -DatabaseRoot/-DatabaseName al lancio.
    [string]$DatabaseRoot = "C:\Repository\Github\Organizations\personal-repository\github-actions-test\databases\Attivazioni",
    [string]$DatabaseName = "Attivazioni",
    [string]$Author = "dba-team"
)

if (-not (Test-Path -LiteralPath $DatabaseRoot)) {
    throw "Cartella database non trovata: $DatabaseRoot"
}

# Ordine di esecuzione: sicurezza/contesto, tabelle, defaults, foreign key,
# viste, funzioni, procedure. Le categorie senza file .sql vengono saltate.
$categories = @(
    @{ Key = 'utenti-ruoli'; Folder = 'SQL/utenti-ruoli'; File = '001-users-roles.yaml' }
    @{ Key = 'schemi';       Folder = 'SQL/schemi';       File = '002-schemas.yaml' }
    @{ Key = 'tabelle';      Folder = 'SQL/tabelle';      File = '003-tables.yaml' }
    @{ Key = 'defaults';     Folder = 'SQL/defaults';     File = '004-defaults.yaml' }
    @{ Key = 'constraints';  Folder = 'SQL/constraints';  File = '005-constraints.yaml' }
    @{ Key = 'viste';        Folder = 'Viste';            File = '006-views.yaml' }
    @{ Key = 'funzioni';     Folder = 'Funzioni';         File = '007-functions.yaml' }
    @{ Key = 'procedure';    Folder = 'Procedure';        File = '008-procedures.yaml' }
)

$changelogFolder = Join-Path $DatabaseRoot 'changelog'
if (-not (Test-Path -LiteralPath $changelogFolder)) {
    New-Item -ItemType Directory -Force -Path $changelogFolder | Out-Null
}

Write-Host "Generazione changelog per database: $DatabaseName" -ForegroundColor Cyan

$includedFiles = New-Object System.Collections.Generic.List[string]

foreach ($category in $categories) {
    $sourceFolder = Join-Path $DatabaseRoot $category.Folder
    if (-not (Test-Path -LiteralPath $sourceFolder)) {
        Write-Host "  [skip] $($category.Folder) non esiste" -ForegroundColor DarkGray
        continue
    }

    $sqlFiles = Get-ChildItem -LiteralPath $sourceFolder -Filter '*.sql' -File | Sort-Object Name
    if ($sqlFiles.Count -eq 0) {
        Write-Host "  [skip] $($category.Folder) e' vuota" -ForegroundColor DarkGray
        continue
    }

    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add('databaseChangeLog:')

    foreach ($file in $sqlFiles) {
        $baseName = [IO.Path]::GetFileNameWithoutExtension($file.Name)
        $id = "$DatabaseName-$($category.Key)-$baseName"

        $lines.Add('  - changeSet:')
        $lines.Add("      id: $id")
        $lines.Add("      author: $Author")
        $lines.Add('      changes:')
        $lines.Add('        - sqlFile:')
        $lines.Add("            path: ../$($category.Folder)/$($file.Name)")
        $lines.Add('            relativeToChangelogFile: true')
        $lines.Add('            splitStatements: true')
        $lines.Add('            endDelimiter: GO')
        $lines.Add('')
    }

    $targetPath = Join-Path $changelogFolder $category.File
    Set-Content -LiteralPath $targetPath -Value $lines -Encoding UTF8
    $includedFiles.Add($category.File) | Out-Null

    Write-Host "  [ok] $($category.File) <- $($sqlFiles.Count) changeSet da $($category.Folder)" -ForegroundColor Green
}

$masterLines = New-Object System.Collections.Generic.List[string]
$masterLines.Add('databaseChangeLog:')
foreach ($fileName in $includedFiles) {
    $masterLines.Add('  - include:')
    $masterLines.Add("      file: $fileName")
    $masterLines.Add('      relativeToChangelogFile: true')
    $masterLines.Add('')
}

$masterPath = Join-Path $changelogFolder 'db.changelog-master.yaml'
Set-Content -LiteralPath $masterPath -Value $masterLines -Encoding UTF8

Write-Host ""
Write-Host "Master changelog: $masterPath" -ForegroundColor Green
Write-Host "Categorie incluse: $($includedFiles.Count) / $($categories.Count)" -ForegroundColor Cyan

[pscustomobject]@{
    DatabaseName    = $DatabaseName
    ChangelogFolder = $changelogFolder
    CategoriesFound = $includedFiles.Count
    Files           = ($includedFiles -join ', ')
}
