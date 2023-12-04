$appRef = New-Object -ComObject Photoshop.Application

try 
{

    $appRef.DisplayDialogs = 3 # All dialogs off
    $jpegSaveOptions = New-Object -ComObject Photoshop.JPEGSaveOptions
    $jpegSaveOptions.Quality = 12

    $files = @(    
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M118\Lifestyle\M118_T1_M_024_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M118_T1_M_024_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M118\Lifestyle\M118_T1_M_073_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M118_T1_M_073_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE104\Lifestyle\CE104_3S_M_1114_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE104_3S_M_1114_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE104\Lifestyle\CE104_3S_M_1129_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE104_3S_M_1129_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE104\Lifestyle\CE104_3S_M_1151_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE104_3S_M_1151_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE104\Lifestyle\_DNU\CE104_3S_M_1151_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE104_3S_M_1151_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE104\Lifestyle\CE104_3S_M_1189_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE104_3S_M_1189_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE104\Lifestyle\CE104W_Q5_F_956_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE104W_Q5_F_956_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE104\Lifestyle\CE104W_Q5_F_965_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE104W_Q5_F_965_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE104\Lifestyle\CE104W_Q5_F_1007_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE104W_Q5_F_1007_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE104\Lifestyle\CE104W_Q5_F_1017_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE104W_Q5_F_1017_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE104\Lifestyle\CE104W_Q5_F_1032_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE104W_Q5_F_1032_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE712\Lifestyle\CE712_4M_CE712W_3S_CE104_279_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE712_4M_CE712W_3S_CE104_279_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE712\Lifestyle\CE712_4M_M_CE104_169_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE712_4M_M_CE104_169_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE712\Lifestyle\CE712_4M_M_CE104_RAIN_393_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE712_4M_M_CE104_RAIN_393_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE712\Lifestyle\CE712_4M_M_CE104_RAIN_549_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE712_4M_M_CE104_RAIN_549_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE712\Lifestyle\CE712W_S3_F_CE104_298_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE712W_S3_F_CE104_298_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE712\Lifestyle\CE712W_S3_F_CE104_RAIN_450_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE712W_S3_F_CE104_RAIN_450_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE712\Lifestyle\CE712W_S3_F_CE104_RAIN_494_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE712W_S3_F_CE104_RAIN_494_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE712\Lifestyle\CE712W_S3_F_CE104_RAIN_511_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE712W_S3_F_CE104_RAIN_511_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE510\Lifestyle\CE510_MR_CE510W_R D_Double_653_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE510_MR_CE510W_R D_Double_653_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE510\Lifestyle\CE510_MR_CE510W_R D_Double_701_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE510_MR_CE510W_R D_Double_701_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG537\CE510_MR_CE510W_R D_Double_701_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE510_MR_CE510W_R D_Double_701_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE510\Lifestyle\CE510_MR_CE510W_R D_Double_714_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE510_MR_CE510W_R D_Double_714_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE510\Lifestyle\CE510_MR_CE510W_R D_Double_730_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE510_MR_CE510W_R D_Double_730_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE510\Lifestyle\CE510_MR_M_601_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE510_MR_M_601_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE510\Lifestyle\CE510_MR_M_607_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE510_MR_M_607_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE510\Lifestyle\CE510_MR_M_622_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE510_MR_M_622_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE510\Lifestyle\CE510W_RD_F_778_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE510W_RD_F_778_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE510\Lifestyle\CE510W_RD_F_895_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE510W_RD_F_895_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\CORE365\CE510\Lifestyle\CE510W_RD_F_930_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\CE510W_RD_F_930_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\PRIME LINE\Outdoor\_Lifestyle\OD403_51_670_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\OD403_51_670_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\PRIME LINE\Outdoor\_Lifestyle\OD404_E6_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\OD404_E6_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\PRIME LINE\Outdoor\_Lifestyle\OD401_EH_223_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\OD401_EH_223_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\TEAM 365\TT020\Lifestyle\TT020_EB_1459_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\TT020_EB_1459_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\TEAM 365\TT020\Lifestyle\TT020_EB_1503_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\TT020_EB_1503_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\TEAM 365\TT020\Lifestyle\TT020_EB_1516_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\TT020_EB_1516_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\PRIME LINE\Drinkware\BT010\_Lifestyle\BT010_378_select_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\BT010_378_select_CAT24.jpg';}
   
    
    )
    

    foreach($f in $files)
    {
        $fn = $f.src
        $n=Split-Path $fn -Leaf
        $dst = $f.dest
        $nn = $n.split(".")[0]
        $tmp = "$env:TEMP\$n"
        $nf = "$env:TEMP\$nn.jpg"
        $fn
        $n
        $tmp
    Copy-Item "$fn" "$tmp"
    $docRef = $appRef.Open($tmp)
    start-sleep -Seconds 3
    $srgbProfile = "sRGB IEC61966-2.1"
    $intent = 2 # Relative colorimetric
    $useBlackPointCompensation = $true
    $docRef.ConvertProfile($srgbProfile, $intent, $useBlackPointCompensation, $true)
    start-sleep -Seconds 3
    $docRef.SaveAs($nf, $jpegSaveOptions, $true)
    start-sleep -Seconds 3
    # Do not save changes
    $doNotSaveChanges = 2 # Corresponds to 'Do not save changes' option
    $docRef.Close($doNotSaveChanges)
    start-sleep -Seconds 3
    
    Move-Item -Path "$nf" -Destination "$dst"
    Remove-Item $tmp
    }

    
}
catch 
{
    Write-Host "Caught an exception:"
    Write-Host "Exception Type: $($_.Exception.GetType().FullName)"
    Write-Host "Exception Message: $($_.Exception.Message)"
}
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($appRef)
