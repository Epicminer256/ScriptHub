$mode = 0
SHTitle "Dark Mode"
SHPrint "Created By HelpMeGame and improved by EpicMiner256"
function ask
{
    SHPrint "Light or Dark mode?"
    $input = SHInput "light/dark/exit"
    $input = $input.trim()
    if($input -eq "light")
    {
        $mode = 1
        runit
        SHPrint "Light Mode Enabled`n"
        return 0
    }
    if($input -eq "dark")
    {
        $mode = 0
        runit
        SHPrint "Dark Mode Enabled`n"
        return 0
    }
    if($input -eq "exit")
    {
        return 1
        return
    }
    SHPrint "Option not valid"
    return 0
}



function runit
{
    $OrigLocation = Get-Location
    Set-Location -Path 'HKLM:\Software\Microsoft'
    New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Value "${mode}" -PropertyType dword -Force
    New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUseLightTheme' -Value "${mode}" -PropertyType dword -Force
    New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUsesLightTheme' -Value "${mode}" -PropertyType dword -Force
    Pop-Location

    Set-Location -Path $OrigLocation
}

while(1)
{
    $returnVal = ask
    if($returnVal -eq 1)
    {
        break
    }
}