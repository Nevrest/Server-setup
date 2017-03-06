$IP = "10.24.0.2"
$MaskBits = 24
$Gateway = "10.24.0.1"
$IPType = "IPv4"
$DNS = "8.8.8.8"
$NIC = "Ethernet0"


$Adapter = Get-NetAdapter -InterfaceAlias $NIC

if (($Adapter | Get-NetIPConfiguration).IPv4Address)
    { $Adapter | Remove-NetIPAddress -AddressFamily $IPType -Confirm: $False}

    if (($Adapter | Get-NetIPConfiguration).IPv4DefaultGateway)
        { $Adapter | Remove-NetRoute -AddressFamily $IPType -Confirm: $false}

$Adapter | New-NetIPAddress -AddressFamily $IPType -IPAddress $IP -PrefixLength $MaskBits -DefaultGateway $Gateway -Confirm: $false

# $Adapter | Set-DnsClientServerAddress -ServerAddresses $DNS -Confirm: $false
