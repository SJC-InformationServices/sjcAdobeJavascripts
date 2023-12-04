$appRef = New-Object -ComObject Photoshop.Application
$in = "C:\Users\KevinNoseworthy\Desktop\CropCenterKeepBKGD\In"
$out = "C:\Users\KevinNoseworthy\Desktop\CropCenterKeepBKGD\Out"
$in
try 
{
   
    
}
catch 
{
    Write-Host "Caught an exception:"
    Write-Host "Error on line $($_.InvocationInfo.ScriptLineNumber)"
    Write-Host "Exception Type: $($_.Exception.GetType().FullName)"
    Write-Host "Exception Message: $($_.Exception.Message)"
}