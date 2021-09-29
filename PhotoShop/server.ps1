$isrunning = "C:\Users\InformationServices\Documents\PhotoShopScripts\isRunning.log"
$exe = 'C:\Program Files\Adobe\Adobe Photoshop 2020\Photoshop.exe'
$args = 'C:\Users\InformationServices\Documents\PhotoShopScripts\server.jsx'
$date = Get-Date -Format d
if(Test-Path $isrunning -PathType leaf){
    Write-Host("Running")
    Start-Process -FilePath "notepad.exe" -ArgumentList "isRunning.log"
}else {
    Add-Content $isrunning $date
    Write-Host(" Not Running")
    $cmd = $exe + " " + $args
    Start-Process -FilePath $exe -ArgumentList
}
