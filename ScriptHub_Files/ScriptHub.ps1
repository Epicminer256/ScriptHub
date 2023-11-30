# When forking or updating, change these settings
$Version = "Prerelease v0.0.0"


$updateError = 0

function Get-ScriptDirectory {
    Split-Path -parent $PSCommandPath
}

#cls

Function Start-ScriptHub{

#Get the script location
$localLocation = Get-ScriptDirectory

#Set the location
Set-Location $localLocation

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

$Select = Read-Host

if ($Select -eq '1')
{
    & .\SetBackground\Background.ps1
} elseif($Select -eq '2')
    {
    & .\Darkmode\Darkmode.ps1
    } elseif($Select -eq '3')
        {
        & .\UpdateLog.txt
        Start-ScriptHub
        } elseif($Select -eq '4')
            {
            & .\Shortcuts\Shortcuts.ps1
            } elseif($Select -eq '5')
                {
                & .\Update\Update.ps1 $($version)
                } elseif ($Select -eq 'Incognito')
                    {
                    & .\Incognito\Incognito.ps1
                    } else
                        {
                        cls
                        $error = 1
                        Start-ScriptHub
                        }
}

cls
Start-ScriptHub
