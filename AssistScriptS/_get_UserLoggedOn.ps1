Write-Host  "          ________________________LEGAL DISCLAIMER AND NOTICES_______________________ "  -ForegroundColor White -BackgroundColor Red
Write-Host "          |                                                                          |"  -ForegroundColor White -BackgroundColor Red
Write-Host "          | THE SOFTWARE IS PROVIDED `AS IS`, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR |"  -ForegroundColor White -BackgroundColor Red
Write-Host "          | IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, |"  -ForegroundColor White -BackgroundColor Red
Write-Host "          | FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL  |"  -ForegroundColor White -BackgroundColor Red
Write-Host "          |THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER|"  -ForegroundColor White -BackgroundColor Red
Write-Host "          | LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING  |"  -ForegroundColor White -BackgroundColor Red
Write-Host "          |   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER    |"  -ForegroundColor White -BackgroundColor Red
Write-Host "          |                     DEALINGS IN THE SOFTWARE.                            |"  -ForegroundColor White -BackgroundColor Red
Write-Host "          |                                                                          |"  -ForegroundColor White -BackgroundColor Red
Write-Host "          |               This code(s) is developed by Agah Sirri,                   |"  -ForegroundColor White -BackgroundColor Red
Write-Host "          |         AgahSirri@hotmail.com / https://linkedin.com/in/agahsirri        |"  -ForegroundColor White -BackgroundColor Red
Write-Host "          |                                 https://github.com/agahsirri             |"  -ForegroundColor White -BackgroundColor Red
Write-Host "          |__________________________________________________________________________|"  -ForegroundColor White -BackgroundColor Red
Write-Host 
Write-Host "[Press CTRL + C for an interrupt the process]"  -ForegroundColor White -BackgroundColor Red
TimeOut 10
Write-Host 

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