$mode = 0
function ask
{
    SHPrint "Do you want to enable bing/cortana search results?"
    $input = SHInput "enable/disable/exit"
    $input = $input.trim()
    if($input -eq "enable")
    {
        $mode = 1
        runit
        SHPrint "Enabled, Restart or relogin to take effect`n"
        return 0
    }
    if($input -eq "disable")
    {
        $mode = 0
        runit
        SHPrint "Disabled, Restart or relogin to take effect`n"
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

    New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'BingSearchEnabled' -Value "0000000${mode}" -PropertyType dword -Force
    New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'AllowSearchToUseLocation' -Value "0000000${mode}" -PropertyType dword -Force
    New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'CortanaConsent' -Value "00000000" -PropertyType dword -Force
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