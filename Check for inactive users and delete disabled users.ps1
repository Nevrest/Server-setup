Import-Module Activedirectory

$then = (Get-Date).AddDays(-365)

Get-ADComputer -Property Name,lastLogonDate -Filter {lastLogonDate -lt $then} | Format-Table Name,lastLogonDate

$rootDN = (Get-ADDomain).DistinguishedName
$Domain = (Get-ADDomain).Forest

search-adaccount -searchbase "OU=$Domain,$rootDN" -AccountDisabled | where {$_.objectclass -eq 'user'} |  remove-aduser -confirm:$true
