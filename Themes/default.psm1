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
function SHTitle
{
    # A Long way of making a array
    $finalin = New-Object System.Collections.Generic.List[System.Object]
    for ( $i = 0; $i -lt $args.count; $i++ )
    {
        $finalin.add($args[$i])
    }
    
    $width = $Host.UI.RawUI.WindowSize.Width
    $avaliablespace = [Math]::Floor([decimal]($width-$finalin.ToCharArray().count-2))
    $finalout = "`n"
    for ( $i = 0; $i -lt $avaliablespace/4; $i++ )
    {
        $finalout = $finalout + " "
    }
    for ( $i = 0; $i -lt $avaliablespace/4; $i++ )
    {
        $finalout = $finalout + "="
    }
    $finalout = $finalout + "[${finalin}]"
    for ( $i = 0; $i -lt $avaliablespace/4; $i++ )
    {
        $finalout = $finalout + "="
    }
    for ( $i = 0; $i -lt $avaliablespace/4; $i++ )
    {
        $finalout = $finalout + " "
    }
    $finalout = $finalout + "`n"
    Write-Host ${finalout}
}
function SHInput
{
    # A Long way of making a array
    $Finalout = New-Object System.Collections.Generic.List[System.Object]
    for ( $i = 0; $i -lt $args.count; $i++ )
    {
        $Finalout.add($args[$i])
    }
    Write-Host -NoNewline "--[${Finalout}]--> "
    return $Host.UI.ReadLine()
}

Export-ModuleMember -Function * -Alias *