param($Name, $GivenName, $SamAccountName, $UserPrincipalName, $AccountPassword, $cpf)

$user = @{
Name = $Name 
GivenName = $GivenName 
SamAccountName = $SamAccountName 
UserPrincipalName = "$SamAccountName@DOMINIO.LOCAL"
Path = "OU=USERS,OU=DOMINIO,DC=DOMINIO,DC=LOCAL"
#cpfisica = $cpf 
AccountPassword = (ConvertTo-SecureString $AccountPassword -AsPlainText -Force)
Enabled = $true
OtherAttributes =@{
    cpfisica = $cpf
    }
}
New-ADUser @user