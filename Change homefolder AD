$grpname = 'New Home'
$srvname = 'server'

 (Get-ADGroup $grpname -Properties members).members | Get-ADUser -ErrorAction SilentlyContinue | % {
    $ursn = $_.SamAccountName
    $hmdir = '\\'+$srvname+'\'+$ursn+'$'
    Set-ADUser $_ -HomeDrive H: -HomeDirectory $hmdir
    }
