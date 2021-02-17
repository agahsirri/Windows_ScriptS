$UserToFind = "agah.sarioglu"
$StartTime = (Get-Date).AddMinutes(-90)
$DCs = Get-ADDomainController -Filter * | Sort-Object -Property Hostname
foreach($DC in $DCs){
    Write-Host ("Searching "+$DC.hostname)
    Get-WinEvent -FilterHashtable @{logname="security"; id=4624; keywords=9007199254740992; starttime=$StartTime} -ComputerName $DC.Hostname `
     | Where-Object -Property Message -like "*$UserToFind*" | Select-Object -Property Message | Select-String -Pattern "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" `
     | ForEach-Object {$_.Matches} | ForEach-Object {nslookup $_.Value}
    Get-WinEvent -FilterHashtable @{logname="security"; id=4776; keywords=9007199254740992; starttime=$StartTime} -ComputerName $DC.Hostname `
     | Where-Object -Property Message -like "*$UserToFind*" | Select-Object -Property Message | Select-String -Pattern "workstation(.)*" `
     | ForEach-Object {$_.Matches} | ForEach-Object {$_.Value}
}