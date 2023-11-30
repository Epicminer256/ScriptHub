# When forking or updating, change these settings
$Version = "Prerelease v0.0.0"

# API Variables
$SH_Path = $PSScriptRoot # Note, this may not have ScriptHub in it
$SH_DataPath = Join-Path -Path $SH_Path -ChildPath "Data"
$SH_ThemePath = Join-Path -Path $SH_DataPath -ChildPath "Theme"
$SH_DefaultTheme = Join-Path -Path $SH_ThemePath -ChildPath "default.psm1"

# Private Internal Variables

function SHStart{
    Try
    {
        Import-Module -Force -Verbose $SH_DefaultTheme 
        get-command SHPrint -ErrorAction Stop
        get-command SHInput -ErrorAction Stop
    }
    Catch
    {
        function SHPrint
        {
            for ( $i = 0; $i -lt $args.count; $i++ )
            {
                Write-Host $args[$i]
            }
        }
        function SHInput
        {
            for ( $i = 0; $i -lt $args.count; $i++ )
            {
                Write-Host -NoNewline ($args[$i] + ">")
                return $Host.UI.ReadLine()
            }
            if ($args.count -lt 1) {
                Write-Host -NoNewline ">"
                return $Host.UI.ReadLine()
            }
        }
        SHPrint "The theme failed to load"
    }
    
    

    # Autostart Module
    # Change scope when nessisary
    function SHAutostart
    {
        Write-Host "Scripthub"
        #Has to wait or color won't be green - No idea why !!Only in ISE!!
        Start-Sleep -mill 10
        Write-Host "Version: $($version)" -Fore Green
        Write-Host "Created by HelpMeGame with help from SCR33M" -fore Green
        Write-Host "Forked by EpicMiner256" -fore Green
    }

    SHAutostart

    Set-Location $SH_Path

    echo 'Where Would You Like To Go? (Type The Number Of Where You Would Like To Go To)
    1) Background
    2) Dark Mode
    3) Shortcuts
    '

    $Select = SHInput

    if ($Select -eq '1')
    {
        & .\Scripts\Background.ps1
    }
    if($Select -eq '2')
    {   
        & .\Scripts\Darkmode.ps1
    }
    if($Select -eq '3')
    {
        & .\Scripts\Shortcuts.ps1
    }
    cls
    SHPrint 'Error, Not A Valid Response.'
    SHStart
}

# Start
cls
SHStart