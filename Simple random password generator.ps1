$PasswordLength = 10
 
-join ((33..125) | Get-Random -count $PasswordLength | foreach {[Char]$_})
