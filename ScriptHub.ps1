# When forking or updating, change these settings
$Version = "Prerelease v0.0.0"

# API Variables
$SH_Path = $PSScriptRoot # Note, this may not have ScriptHub in it
$SH_DataPath = Join-Path -Path $SH_Path -ChildPath "Data"
$SH_ThemePath = Join-Path -Path $SH_DataPath -ChildPath "Themes"
$SH_DefaultTheme = Join-Path -Path $SH_ThemePath -ChildPath "default.psm1"

# Private Internal Variables

function SHStart{
    Try
    {
        Import-Module -Force $SH_DefaultTheme -Function SHPrint, SHInput
        get-command SHPrint -ErrorAction Stop | out-null
        get-command SHInput -ErrorAction Stop | out-null
    }
    Catch
    {
        function SHPrint
        {
            # A Long way of making a array
            $Finalout = New-Object System.Collections.Generic.List[System.Object]
            for ( $i = 0; $i -lt $args.count; $i++ )
            {
                $Finalout.add($args[$i])
            }
            Write-Host $Finalout
        }
        function SHInput
        {
            # A Long way of making a array
            $Finalout = New-Object System.Collections.Generic.List[System.Object]
            for ( $i = 0; $i -lt $args.count; $i++ )
            {
                $Finalout.add($args[$i])
            }
            Write-Host -NoNewline ($Finalout + ">")
            return $Host.UI.ReadLine()
        }
        SHPrint "The theme failed to load"
    }
    
    

    # Autostart Module
    # Change scope when nessisary
    function SHAutostart
    {
        SHPrint "Scripthub"
        #Has to wait or color won't be green - No idea why !!Only in ISE!!
        Start-Sleep -mill 10
        SHPrint "Version: $($version)"
        SHPrint "Created by HelpMeGame with help from SCR33M"
        SHPrint "Forked by EpicMiner256"
    }

    SHAutostart

    Set-Location $SH_Path

    echo '
    Program is WIP, come back later for a working version
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