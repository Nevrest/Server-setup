$FirstName = 'Test'
$LastName = 'Testerson'
$City = 'Test City'
$Address = 'Test Lane 22'
$ZipCode = '7357'
$Phone = '555 012 234'
$Email = 'User@test.info'
$Class = 'Test'
$Drive = 'D:'
$AccountExpireDate = "05/01/2018 5:00:00 PM"


$PasswordLength = 10
$Password = -join ((33..125) | Get-Random -count $PasswordLength | foreach {[Char]$_})
$Initials = $FirstName.Substring(0,3) + $LastName.Substring(0,3)
$DisplayName = $FirstName + "" + $LastName
$Name = $FirstName + $LastName
$Dir = "\\Users\$Name"
$OU = 'Brukere'

$rootDN = (Get-ADDomain).DistinguishedName
$Domain = (Get-ADDomain).Forest

Import-Module ActiveDirectory

New-ADUser -Name $Name`
           -GivenName $FirstName `
           -Surname $LastName `
           -Initials $Initials `
           -DisplayName = $DisplayName `
           -SamAccountName $Name  `
           -Department $Class `
           -City $City `
           -PostalCode $ZipCode `
           -StreetAdress $Address `
           -MobilePhone $Phone `
           -EmailAdress $Email `
           -Description $Password `
           -Accountpassword (ConvertTo-SecureString -AsPlainText  "$Password" -Force) -passThru `
           -ChangePasswordAtLogon  $true`
           -Path "OU=$Class,OU=$OU,$Domain,$rootDN"`
           -HomeDirectory $Dir`
           -HomeDrive $Drive`
           -Enabled $true`
           -AccountExpirationDate $AccountExpireDate`
