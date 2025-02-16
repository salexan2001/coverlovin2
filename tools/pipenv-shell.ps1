# start this project's pipenv shell with decorated window title

$ErrorActionPreference = "Stop"
Set-PSDebug -Trace 1

# get path to pipenv installed with local python 3.7 installation 
Set-Location $PSScriptRoot
$pyver = "3.7"
$py = "C:\Windows\py.exe"
Get-ChildItem -Path $py | Out-Null  # test path exists
$pipenv = & py "-$pyver" -c "import sys;import os;print(os.path.join(os.path.dirname(sys.executable), 'Scripts', 'pipenv'));"

# update the shell window title with information about the virtual environment
$title_original = $Host.UI.RawUI.WindowTitle
$venv_loc = & $pipenv --venv
$pyexe = & $pipenv --py
$py_ver = & $pyexe --version
$Host.UI.RawUI.WindowTitle = $Host.UI.RawUI.WindowTitle + " pipenv: $venv_loc ($py_ver)"

# run `pipenv shell` command
Write-Output "$pipenv shell"
Write-Output ""
& $pipenv "shell"

# restore the window title
$Host.UI.RawUI.WindowTitle = $title_original
