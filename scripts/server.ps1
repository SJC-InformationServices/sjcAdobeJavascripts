$isrunning = "C:\Users\InformationServices\Documents\PhotoShopScripts\isRunning.log"
$exe = "C:\Program Files\Adobe\Adobe Photoshop 2021\Photoshop.exe"
$args = "C:\Users\InformationServices\Documents\PhotoShopScripts\server.jsx"
$date = Get-Date -Format d
if(Test-Path $isrunning -PathType leaf){
    Write-Host("Running")
    Remove-Item $isrunning -Force
    
}else {
    Add-Content $isrunning $date
    Write-Host(" Not Running")
    $cmd = "$exe" + " " + "$args"
    & $exe $args
    
}
