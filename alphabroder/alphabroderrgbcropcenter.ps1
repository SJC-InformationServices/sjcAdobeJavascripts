$appRef = New-Object -ComObject Photoshop.Application
#$in = "C:\Users\KevinNoseworthy\Desktop\CropCenterKeepBKGD\In"
#$out = "C:\Users\KevinNoseworthy\Desktop\CropCenterKeepBKGD\Out"
#$out = "\\10.3.0.39\Alpha Broder\HotFolders\AlphaCropCenterKeepBKGD\Out"

$files=@(
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\BELLE MARE_Need to be Cropped\BT010_378_select_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\COLUMBIA_ATLANTA_Need to be Cropped\7130_43_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\COLUMBIA_ATLANTA_Need to be Cropped\7253_ad_7278_55_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\COLUMBIA_ATLANTA_Need to be Cropped\7253_ad_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\COLUMBIA_ATLANTA_Need to be Cropped\7266_48_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\COLUMBIA_ATLANTA_Need to be Cropped\7277_00_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\COLUMBIA_ATLANTA_Need to be Cropped\7278_55_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE104W_Q5_F_1017_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE104W_Q5_F_956_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE104_3S_CE104W_Q5_Double_1093_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE104_3S_M_1114_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE104_3S_M_1189_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE510W_RD_F_930_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE510W_RD_F_Backdetail_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE510_MR_CE510W_R D_Double_701_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE510_MR_M_622_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE712W_S3_F_CE104_298_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE712W_S3_F_CE104_Inset_RAIN_529_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE712W_S3_F_CE104_RAIN_450_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE712_4M_CE712W_3S_CE104_279_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE712_4M_M_CE104_169_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE712_4M_M_CE104_Inset_RAIN_685_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\CORE365_Need to be Cropped\CE712_4M_M_CE104_RAIN_393_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG110W_NJ_F_232_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG110_2A_DG110W_NJ_Double_597_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG110_2A_M_106_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG410_NJ_DG410W_PM_DG 110_Double_279_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG410_NJ_M_DG110_399_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG410_PM_F_329_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG410_PM_F_468_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG536W_T4_M_653_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG536_T5_DG536W_T4_624_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG536_T5_M_712_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG537W_T5_F_809_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG537_T6_DG537W_T5_Double_764_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\DEVON & JONES_Need to be Cropped\DG537_T6_M_863_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\HARRITON_need to be Cropped\M118_T1_M_073_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\HARRITON_need to be Cropped\M205P_9K_M_192_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\HARRITON_need to be Cropped\M205W_Q9_F_324_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\HARRITON_need to be Cropped\M205_N8_M205W_Q9_Double_277_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\HARRITON_need to be Cropped\M205_N8_M_461_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M12402_47_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M12403_47_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M12649_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M12649_51_M12402_47_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M12650_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M12650_54_M12403_47_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M13193_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M13193_54_M13224_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M13194_47_M13223_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M13208_51_M13225_47_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M13208_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M13223_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M13224_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M13225_47_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M15381_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M15381_51_M15391_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M15382_B9_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M15382_B9_M15392_B9_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M15383_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M15383_51_M15393_B9_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M15391_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M15392_B9_CAT23.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M15393_B9_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M15778_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M15778_51_M15779_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\MARMOT_ATLANTA_Need to be Cropped\M15779_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\NORTH END_Need to be Cropped\NE112W_3C_F_260_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\NORTH END_Need to be Cropped\NE112W_3C_F_532_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\NORTH END_Need to be Cropped\NE112_MR_M_465_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\NORTH END_Need to be Cropped\NE112_MR_NE112W_3C_Double_760_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\NORTH END_Need to be Cropped\NE412W_4M_F_804_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\NORTH END_Need to be Cropped\NE412_9K_M_872_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\NORTH END_Need to be Cropped\NE412_9K_NE412W_4M_Double_639_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\NORTH END_Need to be Cropped\NE75W_TZ_F_1087_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\NORTH END_Need to be Cropped\NE75W_TZ_F_Inset_1068_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\NORTH END_Need to be Cropped\NE75W_TZ_F_Inset_1072_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\NORTH END_Need to be Cropped\NE75_SE_M_Inset_1307_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\NORTH END_Need to be Cropped\NE75_SE_NE75W_TZ_Double_1030_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PRIME LINE_Need to be Cropped\OD403_51_670_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PRIME LINE_Need to be Cropped\OD404_E6_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF LICENSED_ATLANTA_Need to be Cropped\PG100W_0_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF LICENSED_ATLANTA_Need to be Cropped\PG100_10_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF LICENSED_ATLANTA_Need to be Cropped\PG100_10_PG100W_0_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF LICENSED_ATLANTA_Need to be Cropped\PG400W_60_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF LICENSED_ATLANTA_Need to be Cropped\PG400_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF LICENSED_ATLANTA_Need to be Cropped\PG400_54_PG400W_600_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF LICENSED_ATLANTA_Need to be Cropped\PG410_60_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\539105_54_625902_0_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\539105_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596799_54_0055_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596799_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596800_53_078_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596800_53_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596801_52_596802_15_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596801_52_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596802_15_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596803_53_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596807_51_596803_53_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596807_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596920_30_596921_59_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596920_30_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\596921_59_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\PUMA GOLF_ATLANTA_Need to be Cropped\625902_0_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\187330_51_187335_0065_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\187330_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\187333_51_187336_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\187333_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\187334_45_187337_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\187334_45_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\187335_50_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\187336_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\187337_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16519_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16522_45_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16523_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16532_45_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16532_45_S16519_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16538_45_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16538_45_S16523_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16539_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16539_51_S16522_45_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16561_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16562_02_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16641_45_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16642_45_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16642_45_S16641_45_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16797_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S16798_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S17999_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S17999_S18000_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S18000_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S18023_45_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S18024_45_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S18027_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S18027_54_S18028_45_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S18028_45_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S18030_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S18030_51_S18031_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SPYDER_ATLANTA_Need to be Cropped\S18031_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SWANNIES_ATLANTA_Need to be Cropped\SW1600_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SWANNIES_ATLANTA_Need to be Cropped\SW2100_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SWANNIES_ATLANTA_Need to be Cropped\SW2200_28_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SWANNIES_ATLANTA_Need to be Cropped\SWC100_54_2_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SWANNIES_ATLANTA_Need to be Cropped\SWC100_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\SWANNIES_ATLANTA_Need to be Cropped\SWL400_28_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\TEAM365_Need to be Cropped\TT020_EB_1446_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\ULTRA CLUB_ATLANTA_Need to be Cropped\8210LS_53_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\ULTRA CLUB_ATLANTA_Need to be Cropped\8210L_co_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\ULTRA CLUB_ATLANTA_Need to be Cropped\8210_93_8210L_co_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\ULTRA CLUB_ATLANTA_Need to be Cropped\8210_93_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\ULTRA CLUB_ATLANTA_Need to be Cropped\8445L_97_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\ULTRA CLUB_ATLANTA_Need to be Cropped\8445_52_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1370155_57_1377332_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1370155_57_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1371585_34_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1371587_34_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1373674_58_0040_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1373674_58_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1374644_54_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1377332_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1377374_03_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1377375_18_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1380871_34_138075_51_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1380871_34_CAT24.jpg",
    "\\10.3.0.39\Alpha Broder\Work in Progress\104963 AB Spring BuyersGuide 2024_US\PrePress\IMAGES\04_Catalogue and Social Images, 4x5 lifestyle Cropped sent to Client\2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd\UNDER ARMOUR_ATLANTA_Need to be Cropped\1380875_51_CAT24.jpg"
)


try 
{
    $appRef.DisplayDialogs = 3 # All dialogs off
    # Set the preferences to always use pixels
    $appRef.Preferences.RulerUnits = 1 # 1 corresponds to pixels

    $jpegSaveOptions = New-Object -ComObject Photoshop.JPEGSaveOptions
    $jpegSaveOptions.Quality = 12
    $srgbProfile = "sRGB IEC61966-2.1"
    $intent = 2 # Relative colorimetric
    $useBlackPointCompensation = $true
        

    $object_fh = 1350
    $object_fw = 1050
    $padding = 150
    $final_width = 1200
    $final_height = 1500

    #$files = Get-ChildItem -Path "$in\*.*" -Include *.tif,*.jpg,*.jpeg,*.psd
    foreach($fs in $files)
    {
        $f = Get-Item -Path $fs
        $name = $f.Name
        $src = $f.FullName
        $nn = $name.split(".")[0]+".jpg"
        $out = $src.replace("\$name","").replace("2_RGB Jpgs 300 DPI_4x5_ No Crop_For Todd","3_RGB Jpgs 300 DPI_Cropped_ For Maggie_CAT ONLY")
        $dst = "$out\$nn"
        Write-Host "Name: $name"
        Write-Host "Src $src"
        Write-Host "New $nn"
        Write-Host "Out: $out"
        Write-Host "outfile: $dst"

        
        $docRef = $appRef.Open($src)
        $dh = $docRef.Height
        $dw = $docRef.Width
        $pathItem = $docRef.PathItems.Item("Path 1")
        Write-Host "$name -start"
        $docRef.ConvertProfile($srgbProfile, $intent, $useBlackPointCompensation, $true)
        $docRef.Flatten()
        if ($pathItem -ne $null) {
            # Get the bounds of the path item
            $pathItem.MakeSelection()
            $selection=$docRef.Selection
            $bounds=$selection.Bounds;
            Write-Host "$name - Doc Size $dw $dh"
            Write-Host "$name - Bounds of Path 1: $bounds"

            $bx = $bounds[0]-$padding
            $by = $bounds[1]-$padding
            $bw = $bounds[2]+$padding
            $bh = $bounds[3]
            $nb = @($bx,$by,$bw,$bh)
            Write-Host "$name New DIM $nb";
            $cx = if ($bw -gt $dw){ $bx-($bw-$dw) }else { $bx}
            $cy = if ($bh -gt $dh){ $by-($bh-$dh)}else {$by}
            $cw = if ($cx -eq $bx){$bw}else{$dw}
            $ch = if ($cy -eq $bh){$bh}else{$dh}
            $crop=@($cx,$cy,$cw,$ch)
            #$y = if($bh > $dh){ 0 } else {$by}

            
            Write-Host "$name - Bounds of Path 1: $crop"
            $docRef.crop($crop)

            # object dimensions
            $ow = $cw-$cx
            $oh = $ch-$cy
            
             # Calculate the width and height ratios
            $width_ratio = $final_width / $docRef.Width
            $height_ratio =$final_height / $docRef.Height

            # Choose the smaller ratio as the resizing ratio
            $resizing_ratio = [Math]::Min($width_ratio, $height_ratio)

            # Resize the image
            $newDH = $docRef.Height * $resizing_ratio
            $newDW = $docRef.Width * $resizing_ratio
            $docRef.ResizeImage($newDW, $newDH)
            


            $docRef.SaveAs($dst, $jpegSaveOptions, $true)
          
        }
        
        $doNotSaveChanges = 2 # Corresponds to 'Do not save changes' option
        $docRef.Close($doNotSaveChanges)

    }

    
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