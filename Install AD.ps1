$Program = Get-windowsfeature | Select "AD-domain-services"

 Install-windowsfeature $Program

 Import-Module ADDSDeployment

 Install-ADDSForest -CreateDnsDelegation:$false `
 -DatabasePath "C:\Windows\NTDS" `
 -DomainMode "Win2012R2" `
 -DomainName "Gruppe4.Local" `
 -DomainNetbiosName "GRUPPE4" `
 -ForestMode "Win2012R2" `
 -InstallDns:$true `
 -LogPath "C:\Windows\NTDS" `
 -NoRebootOnCompletion:$false `
 -SysvolPath "C:\Windows\SYSVOL" `
 -Force:$true
