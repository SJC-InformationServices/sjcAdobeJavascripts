$appRef = New-Object -ComObject Photoshop.Application

try 
{
    $appRef.DisplayDialogs = 3 # All dialogs off
    $jpegSaveOptions = New-Object -ComObject Photoshop.JPEGSaveOptions
    $jpegSaveOptions.Quality = 12
        
    $in = "\\10.3.0.39\Alpha Broder\HotFolders\AlphaRGBJPG\In"
    $out = "\\10.3.0.39\Alpha Broder\HotFolders\AlphaRGBJPG\Out"
    $files = Get-ChildItem -Path "$in\*.*" -Include *.tif,*.jpg,*.jpeg,*.psd

    foreach($f in $files)
    {
    try {
        $f
        $name = $f.Name
        $src = $f.FullName
        $nn = $name.split(".")[0]+".jpg"
        $dst = "$out\$nn"
        $docRef = $appRef.Open($src)

    
        $srgbProfile = "sRGB IEC61966-2.1"
        $intent = 2 # Relative colorimetric
        $useBlackPointCompensation = $true
        $docRef.ConvertProfile($srgbProfile, $intent, $useBlackPointCompensation, $true)
        $docRef.SaveAs($dst, $jpegSaveOptions, $true)
        # Do not save changes
        $doNotSaveChanges = 2 # Corresponds to 'Do not save changes' option
        $docRef.Close($doNotSaveChanges)
        $fileExists = Test-Path -Path "$src"
        if ($fileExists)
        {

        } else {
            Move-Item -Path "$src" -Destination "$out"
        }
        }catch{
    	Write-Host "Caught an exception:"
	    Write-Host "Error on line $($_.InvocationInfo.ScriptLineNumber)"
    Write-Host "Exception Type: $($_.Exception.GetType().FullName)"
    Write-Host "Exception Message: $($_.Exception.Message)"    
        }
    }
    $appRef.DoJavaScriptFile('E:\repo\sjcAdobeJavascripts\PhotoShop\server.jsx')
        
}
catch 
{
    Write-Host "Caught an exception:"
    Write-Host "Error on line $($_.InvocationInfo.ScriptLineNumber)"
    Write-Host "Exception Type: $($_.Exception.GetType().FullName)"
    Write-Host "Exception Message: $($_.Exception.Message)"
}
[System.Runtime.InteropServices.Marshal]::ReleaseComObject([System.__ComObject]$appRef) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()