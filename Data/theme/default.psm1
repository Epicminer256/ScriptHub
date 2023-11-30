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

Export-ModuleMember -Function * -Alias *