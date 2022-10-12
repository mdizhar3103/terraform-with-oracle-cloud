#ps1_sysnative

$username = "izhar"
$password = ConvertTo-SecureString "MyPassw0rd#123" -AsPlainText -Force
New-LocalUser -Name "$username" -Password $password -FullName "$username" -Description "New default user"
Add-LocalGroupMember -Group "Administrators" -Member $username
Add-LocalGroupMember -Group "Remote Desktop Users" -Member $username
Set-Service -Name msiscsi -StartupType Automatic
Start-Service msiscsi