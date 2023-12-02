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

Export-ModuleMember -Function * -Alias *