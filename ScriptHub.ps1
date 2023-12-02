# When forking or updating, change these settings
$Version = "Prerelease v0.0.0"
# ---

$SH_Path = $PSScriptRoot
$SH_ThemePath = Join-Path -Path $SH_Path -ChildPath "Themes"
$SH_DefaultTheme = Join-Path -Path $SH_ThemePath -ChildPath "default.psm1"
$SH_Bin = Join-Path -Path $SH_Path -ChildPath "src"

function SHStart{
    $SH_Run = 1
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
            Write-Host -NoNewline "${Finalout}> "
            return $Host.UI.ReadLine()
        }

        SHPrint "The theme failed to load"
    }
    
    function SHAutostart
    {
        SHPrint "Scripthub Version: $($version)"
        SHPrint "Forked by EpicMiner256, originally created by HelpMeGame with help from SCR33M"
        SHPrint "To Get Started, type `"help`"`n"
    }

    SHAutostart

    function runPrompt()
    {
        $Select = SHInput "SH"
        $Select = $Select.trim()
        if($Select -eq "exit")
        {
            return 1
        }
        if($Select -eq "help")
        {
            SHPrint "All Programs:"
            Get-ChildItem $SH_Bin | 
            Foreach-Object {
                if($_.Extension -eq ".ps1")
                {
                    SHPrint $("   "+$_.Basename)
                    $Doc = Join-Path -Path $SH_Bin -ChildPath ($_.Basename+".desc")
                    $Content = Get-Content -Path $Doc
                    SHPrint $("   --> "+$Content)
                }
            }
            SHPrint $("   help")
            SHPrint $("   --> Lists programs and what they do")
            SHPrint $("   exit")
            SHPrint $("   --> Exits ScriptHub")
            return 0
        }
        $path = Join-Path -Path $SH_Bin -ChildPath $Select
        if (Test-Path $path)
        {
            & $path
            return 0
        }
        $path = Join-Path -Path $SH_Bin -ChildPath "${Select}.ps1"
        if (Test-Path $path)
        {
            & $path
            return 0
        }
        SHPrint "Command not Found"
        return 0
    }

    while(1)
    {
        $returnVal = runPrompt
        if($returnVal -eq 1)
        {
            break
        }
    }

    SHPrint "Exiting...`n"
}

SHStart