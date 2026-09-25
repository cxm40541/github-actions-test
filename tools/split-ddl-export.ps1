<#
.SYNOPSIS
    Divide un export DDL SSMS (singolo file .sql) in tanti file piccoli,
    uno per oggetto, organizzati nelle sottocartelle del database.

.PARAMETER SourceFile
    Percorso del file .sql originale (es. databases/ALOSW/original/ALOSW.sql).
    Se non passato a riga di comando, viene usato il valore di default impostato
    qui sotto nel blocco param().

.PARAMETER DatabaseRoot
    Cartella radice del database (es. databases/ALOSW), dentro cui verranno
    create/popolate le sottocartelle SQL/, Viste/, Procedure/, Funzioni/.
    Se non passato a riga di comando, viene usato il valore di default impostato
    qui sotto nel blocco param().

.EXAMPLE
    # PowerShell, dalla root del repository (usa i valori di default nel param())
    .\tools\split-ddl-export.ps1

.EXAMPLE
    # PowerShell, dalla root del repository, con parametri espliciti
    .\tools\split-ddl-export.ps1 `
      -SourceFile ".\databases\ALOSW\original\ALOSW.sql" `
      -DatabaseRoot ".\databases\ALOSW"

.EXAMPLE
    # PowerShell, con percorsi assoluti (funziona da qualsiasi cartella)
    & "C:\percorso\repo\tools\split-ddl-export.ps1" `
      -SourceFile "C:\percorso\repo\databases\ALOSW\original\ALOSW.sql" `
      -DatabaseRoot "C:\percorso\repo\databases\ALOSW"

.EXAMPLE
    # Command Prompt (cmd.exe)
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\percorso\repo\tools\split-ddl-export.ps1" -SourceFile "C:\percorso\repo\databases\ALOSW\original\ALOSW.sql" -DatabaseRoot "C:\percorso\repo\databases\ALOSW"
#>
param(
    # Modifica questi due default per lanciare lo script senza parametri,
    # oppure sovrascrivili passando -SourceFile e -DatabaseRoot al lancio.
    [string]$SourceFile = "C:\Repository\Github\Organizations\personal-repository\github-actions-test\databases\Attivazioni\original\Attivazioni.sql",
    [string]$DatabaseRoot = "C:\Repository\Github\Organizations\personal-repository\github-actions-test\databases\Attivazioni"
)

# Solo le intestazioni SSMS reali hanno il nome tra parentesi quadre;
# le intestazioni storiche duplicate dentro i body (es. vecchie CREATE PROCEDURE)
# riportano il nome senza parentesi e vanno ignorate come confine di split.
$boundaryPattern = '^/\*{6}\s*Object:\s+(?<type>.+?)\s+(?<qname>(\[[^\]]+\]\.)?\[[^\]]+\])\s+Script Date: \d{1,2}/\d{1,2}/\d{4} \d{1,2}:\d{2}:\d{2}\s*\*{6}/\s*$'

$folderByType = @{
    'User'                = 'SQL/utenti-ruoli'
    'Role'                = 'SQL/utenti-ruoli'
    'Schema'              = 'SQL/schemi'
    'Table'               = 'SQL/tabelle'
    'Default'             = 'SQL/defaults'
    'ForeignKey'          = 'SQL/constraints'
    'View'                = 'Viste'
    'StoredProcedure'     = 'Procedure'
    'UserDefinedFunction' = 'Funzioni'
    'Database'            = 'SQL/database'
}

$verbByType = @{
    'Default'    = 'alter'
    'ForeignKey' = 'alter'
}

function Get-SafeFileName([string]$name) {
    $invalid = [IO.Path]::GetInvalidFileNameChars() -join ''
    $pattern = "[{0}]" -f [Regex]::Escape($invalid)
    $safe = ($name -replace $pattern, '_').Trim('. ')
    if ($safe.Length -gt 80) { $safe = $safe.Substring(0, 80) }
    if ([string]::IsNullOrWhiteSpace($safe)) { $safe = 'unnamed' }
    return $safe
}

if (-not (Test-Path -LiteralPath $SourceFile)) {
    throw "File sorgente non trovato: $SourceFile"
}

Write-Host "Lettura file sorgente: $SourceFile" -ForegroundColor Cyan
$lines = Get-Content -LiteralPath $SourceFile -Encoding Unicode

$boundaries = New-Object System.Collections.Generic.List[object]
for ($i = 0; $i -lt $lines.Count; $i++) {
    $m = [Regex]::Match($lines[$i], $boundaryPattern)
    if ($m.Success) {
        $qname = $m.Groups['qname'].Value
        $nameMatch = [Regex]::Match($qname, '\[([^\]]+)\]\s*$')
        $objectName = if ($nameMatch.Success) { $nameMatch.Groups[1].Value } else { $qname }

        $boundaries.Add([pscustomobject]@{
            LineIndex  = $i
            Type       = $m.Groups['type'].Value.Trim()
            ObjectName = $objectName
        })
    }
}

if ($boundaries.Count -eq 0) {
    throw "Nessuna intestazione oggetto trovata in $SourceFile"
}

# Pulizia idempotente: rimuove i file generati da esecuzioni precedenti,
# cosi' rilanciare lo script non produce duplicati con suffisso _2, _3, ecc.
Write-Host "Pulizia file generati da esecuzioni precedenti..." -ForegroundColor Cyan
foreach ($relativeFolder in ($folderByType.Values | Select-Object -Unique)) {
    $folderPath = Join-Path $DatabaseRoot $relativeFolder
    if (Test-Path -LiteralPath $folderPath) {
        Get-ChildItem -LiteralPath $folderPath -Filter '*.sql' -File |
            Where-Object { $_.Name -match '^\d{3}_(create|alter)_.+\.sql$' } |
            Remove-Item -Force
    }
}

Write-Host "Trovati $($boundaries.Count) oggetti, avvio split in: $DatabaseRoot" -ForegroundColor Cyan
$counters = @{}
$createdFiles = New-Object System.Collections.Generic.List[string]
$skippedTypes = New-Object System.Collections.Generic.HashSet[string]

for ($b = 0; $b -lt $boundaries.Count; $b++) {
    $current = $boundaries[$b]
    $startIndex = $current.LineIndex
    $endIndex = if ($b + 1 -lt $boundaries.Count) { $boundaries[$b + 1].LineIndex - 1 } else { $lines.Count - 1 }

    $block = $lines[$startIndex..$endIndex]
    # rimuove righe vuote/spazi finali mantenendo intatto il contenuto interno
    while ($block.Count -gt 0 -and [string]::IsNullOrWhiteSpace($block[$block.Count - 1])) {
        $block = $block[0..($block.Count - 2)]
    }

    if (-not $folderByType.ContainsKey($current.Type)) {
        $skippedTypes.Add($current.Type) | Out-Null
        continue
    }

    $relativeFolder = $folderByType[$current.Type]
    $targetFolder = Join-Path $DatabaseRoot $relativeFolder
    if (-not (Test-Path -LiteralPath $targetFolder)) {
        New-Item -ItemType Directory -Force -Path $targetFolder | Out-Null
    }

    $counterKey = $relativeFolder
    if (-not $counters.ContainsKey($counterKey)) { $counters[$counterKey] = 0 }
    $counters[$counterKey]++
    $seq = '{0:D3}' -f $counters[$counterKey]

    $verb = if ($verbByType.ContainsKey($current.Type)) { $verbByType[$current.Type] } else { 'create' }
    $safeName = Get-SafeFileName $current.ObjectName
    $fileName = "${seq}_${verb}_${safeName}.sql"
    $targetPath = Join-Path $targetFolder $fileName

    $suffix = 2
    while (Test-Path -LiteralPath $targetPath) {
        $fileName = "${seq}_${verb}_${safeName}_${suffix}.sql"
        $targetPath = Join-Path $targetFolder $fileName
        $suffix++
    }

    Set-Content -LiteralPath $targetPath -Value $block -Encoding UTF8
    $createdFiles.Add($targetPath) | Out-Null
    Write-Host "  [$($current.Type)] -> $targetPath" -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "Split completato: $($createdFiles.Count) file creati in $DatabaseRoot" -ForegroundColor Green
if ($skippedTypes.Count -gt 0) {
    Write-Host "Tipi ignorati (nessuna cartella mappata): $($skippedTypes -join ', ')" -ForegroundColor Yellow
}
Write-Host "Riepilogo per cartella:" -ForegroundColor Cyan
$counters.GetEnumerator() | Sort-Object Name | ForEach-Object { Write-Host "  $($_.Name): $($_.Value)" }
Write-Host ""

[pscustomobject]@{
    SourceFile   = $SourceFile
    TotalObjects = $boundaries.Count
    FilesCreated = $createdFiles.Count
    SkippedTypes = ($skippedTypes -join ', ')
    ByFolder     = ($counters.GetEnumerator() | Sort-Object Name | ForEach-Object { "$($_.Name)=$($_.Value)" }) -join '; '
}