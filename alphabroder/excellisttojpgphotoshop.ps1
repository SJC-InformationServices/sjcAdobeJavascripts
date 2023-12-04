$appRef = New-Object -ComObject Photoshop.Application

try 
{

    $appRef.DisplayDialogs = 3 # All dialogs off
    $jpegSaveOptions = New-Object -ComObject Photoshop.JPEGSaveOptions
    $jpegSaveOptions.Quality = 12

    $files = @(    
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG537\DG537_T6_DG537W_T5_Double_791_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG537_T6_DG537W_T5_Double_791_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG537\DG537_T6_M_863_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG537_T6_M_863_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG537\DG537_T6_M_912_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG537_T6_M_912_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE112\Lifestyle\NE112_MR_NE112W_3C_Double_760_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE112_MR_NE112W_3C_Double_760_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE112\Lifestyle\NE112_MR_M_465_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE112_MR_M_465_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE112\Lifestyle\NE112W_3C_F_260_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE112W_3C_F_260_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE112\Lifestyle\NE112W_3C_F_320_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE112W_3C_F_320_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE112\Lifestyle\NE112W_3C_F_532_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE112W_3C_F_532_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE112\Lifestyle\NE112W_3C_F_568_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE112W_3C_F_568_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE412\Lifestyle\NE412_9K_NE412W_4M_Double_620_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE412_9K_NE412W_4M_Double_620_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE412\Lifestyle\NE412_9K_NE412W_4M_Double_639_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE412_9K_NE412W_4M_Double_639_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE412\Lifestyle\NE412_9K_NE412W_4M_Double_745_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE412_9K_NE412W_4M_Double_745_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE412\Lifestyle\NE412_9K_M_872_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE412_9K_M_872_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE412W\_Lifestyle\NE412W_4M_F_804_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE412W_4M_F_804_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE75\Lifestyle\NE75_SE_NE75W_TZ_Double_966_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE75_SE_NE75W_TZ_Double_966_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE75\Lifestyle\NE75_SE_NE75W_TZ_Double_1030_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE75_SE_NE75W_TZ_Double_1030_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE75\Lifestyle\NE75_SE_M_1267_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE75_SE_M_1267_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE75\Lifestyle\NE75_SE_M_Inset_1307_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE75_SE_M_Inset_1307_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE75\Lifestyle\NE75W_TZ_F_1169_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE75W_TZ_F_1169_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE75\Lifestyle\NE75W_TZ_F_Inset_1068_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE75W_TZ_F_Inset_1068_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\NORTH END\NE75\Lifestyle\NE75W_TZ_F_Inset_1072_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\NE75W_TZ_F_Inset_1072_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M205\Lifestyle\M205_N8_M205W_Q9_Double_256_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M205_N8_M205W_Q9_Double_256_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M205\Lifestyle\M205_N8_M205W_Q9_Double_277_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M205_N8_M205W_Q9_Double_277_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M205\Lifestyle\DNU\M205_N8_M205W_Q9_Double_277_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M205_N8_M205W_Q9_Double_277_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M205\Lifestyle\M205_N8_M_461_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M205_N8_M_461_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M205\Lifestyle\M205_N8_M_470_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M205_N8_M_470_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M205\Lifestyle\M205W_Q9_F_321_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M205W_Q9_F_321_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M205\Lifestyle\M205W_Q9_F_324_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M205W_Q9_F_324_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M205\Lifestyle\M205W_Q9_F_367_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M205W_Q9_F_367_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M205\Lifestyle\M205P_9K_M_174_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M205P_9K_M_174_SOC24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M205\Lifestyle\M205P_9K_M_192_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M205P_9K_M_192_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M205\Lifestyle\DNU\M205P_9K_M_192_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M205P_9K_M_192_CAT24.jpg';},
@{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\HARRITON\M205\Lifestyle\M205P_9K_M_194_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M205P_9K_M_194_SOC24.jpg';},
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
    }

    
}
catch 
{
    Write-Host "Caught an exception:"
    Write-Host "Exception Type: $($_.Exception.GetType().FullName)"
    Write-Host "Exception Message: $($_.Exception.Message)"
}
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($appRef)
