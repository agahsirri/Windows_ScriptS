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