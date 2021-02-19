#powershell -executionPolicy bypass -file "\\172.2.5.1\Software\ProgramS\_ScriptS\_set_Domain_ComputerName.ps1"
Write-Host "Please enter your desired computer's current name: [Default $env:computername]:"
$computernameOld = Read-Host
Write-Host "Please enter your desired computer's new name: [Default $env:computername]:"
$computernameNew = Read-Host
$credentials = New-Object System.Management.Automation.PsCredential("oss.local\install", (ConvertTo-SecureString "Florida61" -AsPlainText -Force))
#Write-Host "Adding $computername to the domain"
#Add-Computer -DomainName "oss.local" -Credential $credentials <#-OUPath $ou#>
#if ($renamecomputer -eq $true) { Rename-Computer -ComputerName $computernameOld -NewName $computernameNew -DomainCredential $credentials -Force }
Rename-Computer -ComputerName $computernameOld -NewName $computernameNew -DomainCredential $credentials -Force