@ECHO off
CLS
COLOR 0C
ECHO            ________________________LEGAL DISCLAIMER AND NOTICES_______________________
ECHO           ^|                                                                          ^|
ECHO           ^|THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR^|
ECHO           ^| IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, ^|
ECHO           ^| FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL  ^|
ECHO           ^|THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER^|
ECHO           ^| LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING  ^|
ECHO           ^|   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER    ^|
ECHO           ^|                     DEALINGS IN THE SOFTWARE.                            ^|
ECHO           ^|                                                                          ^|
ECHO           ^|               This code(s) is developed by Agah Sirri,                   ^|
ECHO           ^|         AgahSirri@hotmail.com / https://linkedin.com/in/agahsirri        ^|
ECHO           ^|                                 https://github.com/agahsirri             ^|
ECHO           ^|__________________________________________________________________________^|
ECHO .
ECHO [Press CTRL + C for an interrupt the process]
TimeOut 10
ECHO .
COLOR 0A

call "\\172.2.5.1\Software\ProgramS\_ScriptS\_install_BasicKit.bat"
call "\\172.2.5.1\Software\ProgramS\_ScriptS\_install_AndroidStudio.bat"
call "\\172.2.5.1\Software\ProgramS\_ScriptS\_install_Atom.bat"
call "\\172.2.5.1\Software\ProgramS\_ScriptS\_install_DrJava.bat"
call "\\172.2.5.1\Software\ProgramS\_ScriptS\_install_GitS.bat"
call "\\172.2.5.1\Software\ProgramS\_ScriptS\_install_NetControl.bat"
call "\\172.2.5.1\Software\ProgramS\_ScriptS\_install_PyCharm.bat"
call "\\172.2.5.1\Software\ProgramS\_ScriptS\_install_Python.bat"
call "\\172.2.5.1\Software\ProgramS\_ScriptS\_install_Unity3D.bat"
call "\\172.2.5.1\Software\ProgramS\_ScriptS\_install_VirtualBox.bat"
