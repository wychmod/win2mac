$ErrorActionPreference = 'Stop'

$scriptPath = Join-Path $PSScriptRoot '..\MacKeyboardMapping.ahk'
$readmePath = Join-Path $PSScriptRoot '..\README.md'
$content = Get-Content -Raw -Encoding UTF8 $scriptPath
$readme = Get-Content -Raw -Encoding UTF8 $readmePath

$failures = New-Object System.Collections.Generic.List[string]

function Assert-Contains {
    param(
        [string] $Needle,
        [string] $Message
    )

    if (-not $content.Contains($Needle)) {
        $failures.Add($Message)
    }
}

function Assert-NotMatches {
    param(
        [string] $Pattern,
        [string] $Message
    )

    if ($content -match $Pattern) {
        $failures.Add($Message)
    }
}

function Assert-ReadmeNotMatches {
    param(
        [string] $Pattern,
        [string] $Message
    )

    if ($readme -match $Pattern) {
        $failures.Add($Message)
    }
}

function ConvertTo-Utf8HexString {
    param([string] $Value)

    return -join ([System.Text.Encoding]::UTF8.GetBytes($Value) | ForEach-Object { $_.ToString('x2') })
}

function Assert-ReadmeContainsUtf8Hex {
    param(
        [string] $Utf8Hex,
        [string] $SectionName
    )

    $needle = [System.Text.Encoding]::UTF8.GetString(
        [byte[]] ($Utf8Hex -split '(.{2})' | Where-Object { $_ } | ForEach-Object { [Convert]::ToByte($_, 16) })
    )

    if (-not $readme.Contains($needle)) {
        $failures.Add("README is missing required section: $SectionName")
    }
}

Assert-NotMatches '(?m)^[ \t]![A-Za-z0-9`]' 'Neutral Alt hotkeys must use left Alt (`<!`) so RAlt/AltGr is not remapped.'
Assert-NotMatches '(?m)^[ \t]\+![A-Za-z0-9]' 'Shift+Alt hotkeys must use left Alt (`<!+`) so RAlt/AltGr is not remapped.'
Assert-NotMatches '(?m)^[ \t]!(Left|Right|Up|Down|Backspace)' 'Named-key Alt hotkeys must use left Alt (`<!`).'
Assert-NotMatches '(?m)^[ \t]\+!(Left|Right|Up|Down)' 'Named-key Shift+Alt hotkeys must use left Alt (`<!+`).'
Assert-NotMatches '(?m)^(LWin|RWin|RAlt)::' 'Do not intercept Win/RAlt just to resend them; omitting a hotkey preserves native behavior.'

Assert-Contains '#UseHook' 'Keyboard hook must be forced so application-level Alt shortcuts do not take priority.'
Assert-Contains 'MacSend(keys)' 'Mapped shortcuts must go through MacSend so physical Alt can be released before forwarding.'
Assert-Contains 'SendInput, {LAlt up}' 'MacSend must release left Alt before forwarding the mapped shortcut.'
Assert-NotMatches '(?m)^\$?<!.*::Send' 'Mapped hotkeys must not call Send directly; use MacSend to avoid leaking Alt into applications.'
Assert-NotMatches '(?m)^\$?<!.*::WinMinimize' 'Mapped hotkeys must not run window actions directly; use helper functions to release Alt first.'

Assert-Contains '$<!+t::MacSend("^+t")' 'Alt+Shift+T should be active for reopening a closed browser tab.'
Assert-Contains '$<!3::MacSend("^3")' 'Alt+3 should remain available for jumping to browser tab 3.'
Assert-Contains '$<!4::MacSend("^4")' 'Alt+4 should remain available for jumping to browser tab 4.'
Assert-Contains '$<!+3::MacSend("#{PrintScreen}")' 'Alt+Shift+3 should remain available for full-screen screenshot.'
Assert-Contains '$<!+4::MacSend("#+s")' 'Alt+Shift+4 should remain available for area screenshot.'

Assert-ReadmeNotMatches '(?m)^.*Alt\s*\+\s*Tab.*Ctrl\s*\+\s*Tab.*$' 'README should not claim Alt+Tab switches browser tabs; the script preserves native Windows Alt+Tab.'
Assert-ReadmeNotMatches 'LAlt & [a-z]' 'README examples should use the current left-Alt modifier syntax (`<!key`) instead of old custom combinations.'

$requiredReadmeSections = @(
    @{ name = 'project-positioning'; hex = '232320e9a1b9e79baee5ae9ae4bd8d' },
    @{ name = 'core-features'; hex = '232320e6a0b8e5bf83e789b9e680a7' },
    @{ name = 'use-cases'; hex = '232320e98082e794a8e59cbae699af' },
    @{ name = 'requirements'; hex = '232320e78eafe5a283e8a681e6b182' },
    @{ name = 'install-and-start'; hex = '232320e5ae89e8a385e4b88ee590afe58aa8' },
    @{ name = 'shortcut-mapping'; hex = '232320e5bfabe68db7e994aee698a0e5b084' },
    @{ name = 'configuration'; hex = '232320e9858de7bdaee8afb4e6988e' },
    @{ name = 'faq'; hex = '232320e5b8b8e8a781e997aee9a298' },
    @{ name = 'troubleshooting'; hex = '232320e69585e99a9ce68e92e69fa5' },
    @{ name = 'contributing'; hex = '232320e8b4a1e78caee68c87e58d97' },
    @{ name = 'license'; hex = '232320e8aeb8e58fafe8af81' }
)

foreach ($section in $requiredReadmeSections) {
    Assert-ReadmeContainsUtf8Hex $section.hex $section.name
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host 'Hotkey mapping checks passed.'
