$Users = Import-csv 'C:\Import.csv' -Delimiter ';' -Encoding UTF7
 
$rootDN = (Get-ADDomain).DistinguishedName
$Domain = (Get-ADDomain).Forest
 
foreach ($User in $Users){
 
    $OU = $User.OU
    $OUPath = "OU=$OU,OU=$Brukere,OU=$Domain,$rootDN"
    $ADUser = $User.Firstname + " " + $User.Name
 
 
   
 
 
        New-ADuser -Name $ADUser `
         -GivenName $User.FirstName `
         -Surname $User.Name`
         -AccountPassword (ConvertTo-SecureString $User.Password -AsPlainText -Force)`
         -Description $User.Year `
 
        # Move-ADObject "CN=$ADUser,CN=Users,DC=Gruppe4,DC=Local" "OU=$OU,OU=Brukere,DC=Gruppe4,DC=Local" Use this if user cannot be created in the correct OU
         
 
 
         }
