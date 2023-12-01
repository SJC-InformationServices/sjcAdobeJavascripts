$appRef = New-Object -ComObject Photoshop.Application
$in = "\\10.3.0.39\Alpha Broder\HotFolders\AlphaRGBJPG\In"
$out = "\\10.3.0.39\Alpha Broder\HotFolders\AlphaRGBJPG\Out"
$in
try 
{
    $appRef.DisplayDialogs = 3 # All dialogs off
    $files = Get-ChildItem -Path "$in\*.*" -Include *.tif,*.jpg,*.jpeg

    foreach($f in $files)
    {
        $f
        $name = $f.Name
        $src = $f.FullName
        $nn = $name.split(".")[0]+".jpg"
        $dst = "$out\$nn"
        $docRef = $appRef.Open($src)

    $jpegSaveOptions = New-Object -ComObject Photoshop.JPEGSaveOptions
    $jpegSaveOptions.Quality = 12

    $docRef.SaveAs($dst, $jpegSaveOptions, $true)
    $srgbProfile = "sRGB IEC61966-2.1"
    $intent = 2 # Relative colorimetric
    $useBlackPointCompensation = $true
    $docRef.ConvertProfile($srgbProfile, $intent, $useBlackPointCompensation, $true)

    # Do not save changes
    $doNotSaveChanges = 2 # Corresponds to 'Do not save changes' option
    $docRef.Close($doNotSaveChanges)
    }
    Move-Item $src 
    
}
catch 
{
    Write-Host "Caught an exception:"
    Write-Host "Exception Type: $($_.Exception.GetType().FullName)"
    Write-Host "Exception Message: $($_.Exception.Message)"
}