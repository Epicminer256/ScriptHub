# When forking or updating, change these settings
$local:Version = "Prerelease v0.0.0"

# API Variables
$local:SH_Path = $PSScriptRoot # Note, this may not have ScriptHub in it

function private:Start-ScriptHub{

    #Set the location
    Set-Location $SH_Path

    #cls

    if ($error -eq '1')
    {
        Write-Host 'Error, Not A Valid Response.' -fore Red
    }

    Write-Host "
    #####                               #     #               
    #     #  ####  #####  # #####  ##### #     # #    # #####  
    #       #    # #    # # #    #   #   #     # #    # #    # 
    #####  #      #    # # #    #   #   ####### #    # #####  
        # #      #####  # #####    #   #     # #    # #    # 
    #     # #    # #   #  # #        #   #     # #    # #    # 
    #####   ####  #    # # #        #   #     #  ####  #####
    "

    #Has to wait or color won't be green - No idea why !!Only in ISE!!
    Start-Sleep -mill 10

    Write-Host "Version: $($version)" -Fore Green
    Write-Host "Created by HelpMeGame with help from SCR33M `n" -fore Green

    echo 'Where Would You Like To Go? (Type The Number Of Where You Would Like To Go To)
    1) Background
    2) Dark Mode
    3) Update Log (Non-functional)
    4) Shortcuts
    5) Update (Non-functional)
    '

    $private:Select = Read-Host

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
        & .\UpdateLog.txt
        Start-ScriptHub
    }
    if($Select -eq '4')
    {
        & .\Scripts\Shortcuts.ps1
    }
    if($Select -eq '5')
    {
        & .\Scripts\Update\Update.ps1 $($version)
    }
    if ($Select -eq 'Incognito')
    {
        & .\Scripts\Incognito.ps1
    }
    cls
    $error = 1
    Start-ScriptHub
}

cls
Start-ScriptHub
