'            ________________________LEGAL DISCLAIMER AND NOTICES_______________________
'           |                                                                          |
'           |THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR|
'           | IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, |
'           | FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL  |
'           |THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER|
'           | LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING  |
'           |   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER    |
'           |                     DEALINGS IN THE SOFTWARE.                            |
'           |                                                                          |
'           |               This code(s) is developed by Agah Sirri,                   |
'           |         AgahSirri@hotmail.com / https://linkedin.com/in/agahsirri        |
'           |                                 https://github.com/agahsirri             |
'           |__________________________________________________________________________|

Option explicit
dim oShell
set oShell= Wscript.CreateObject("WScript.Shell")
oShell.Run "runas /user:administrator ""PROGRAMNAME"""
WScript.Sleep 100
oShell.Sendkeys "PASSWORD~"
Wscript.Quit