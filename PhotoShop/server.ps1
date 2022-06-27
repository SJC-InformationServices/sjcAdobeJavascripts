$isrunning = "C:\Users\InformationServices\Documents\PhotoShopScripts\isRunning.log"
<<<<<<< HEAD
$exe = "C:\Program Files\Adobe\Adobe Photoshop 2021\Photoshop.exe"
$args = "C:\Users\InformationServices\OneDrive - St Joseph Communications, Content Group\Documents\GitHub\photoshopscripts\PhotoShop\server.jsx"
$date = Get-Date -Format d
if(Test-Path $isrunning -PathType leaf){
    Write-Host("Running")
    Remove-Item $isrunning -Force
    
}else {
    Add-Content $isrunning $date
    Write-Host(" Not Running")
    $cmd = "$exe" + " " + "$args"
    & $exe $args
    
=======
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
>>>>>>> d19052d019b75b7d4e3e5caf9d98ffc8b88faad6
}
