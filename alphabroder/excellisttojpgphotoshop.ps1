$appRef = New-Object -ComObject Photoshop.Application

try 
{

    $appRef.DisplayDialogs = 3 # All dialogs off
    
    $files = @(    
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15778\Lifestyle\M15778_51_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15778_51_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15779\Lifestyle\M15779_51_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15779_51_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M13193\Lifestyle\M13193_54_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M13193_54_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M13193\Lifestyle\M13193_54_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M13193_54_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M13193\Lifestyle\M13193_54_M13224_54_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M13193_54_M13224_54_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M13224\Lifestyle\M13224_54_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M13224_54_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M13194\Lifestyle\M13194_47_M13223_51_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M13194_47_M13223_51_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M13223\Lifestyle\M13223_51_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M13223_51_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M13223\Lifestyle\M13223_51_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M13223_51_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M13208\Lifestyle\M13208_54_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M13208_54_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M13225\Lifestyle\M13225_47_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M13225_47_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M13225\Lifestyle\M13225_47_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M13225_47_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15381\Lifestyle\M15381_51_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15381_51_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15381\Lifestyle\M15381_51_M15391_51_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15381_51_M15391_51_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15381\Lifestyle\M15381_51_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15381_51_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15391\Lifestyle\M15391_51_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15391_51_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15391\Lifestyle\M15391_51_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15391_51_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15382\Lifestyle\M15382_B9_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15382_B9_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15382\Lifestyle\M15382_B9_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15382_B9_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15382\Lifestyle\M15382_B9_M15392_B9_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15382_B9_M15392_B9_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15392\Lifestyle\M15392_B9 SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15392_B9 SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15392\Lifestyle\M15392_B9_CAT23.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15392_B9_CAT23.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15383\Lifestyle\M15383_51_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15383_51_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15383\Lifestyle\M15383_51_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15383_51_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15383\Lifestyle\M15383_51_M15393_B9_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15383_51_M15393_B9_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15393\Lifestyle\M15393_B9_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15393_B9_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\MARMOT\M15393\Lifestyle\M15393_B9_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\M15393_B9_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1380871\Lifestyle\1380871_34_138075_51_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1380871_34_138075_51_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1380875\Lifestyle\1380875_51_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1380875_51_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1380875\Lifestyle\1380875_51_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1380875_51_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1380871\Lifestyle\1380871_34_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1380871_34_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1380871\Lifestyle\1380871_34_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1380871_34_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1380875\Lifestyle\1380875_51_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1380875_51_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1370155\Lifestyle\1370155_57_1377332_51_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1370155_57_1377332_51_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1370155\Lifestyle\1370155_57_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1370155_57_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1377332\Lifestyle\1377332_51_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1377332_51_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1377332\Lifestyle\1377332_51_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1377332_51_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1371585\Lifestyle\1371585_34_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1371585_34_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1371585\Lifestyle\1371585_34_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1371585_34_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1373674\Lifestyle\1373674_58_0040_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1373674_58_0040_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1373674\Lifestyle\DNU\1373674_58_0040_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1373674_58_0040_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1373674\Lifestyle\1373674_58_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1373674_58_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1373674\Lifestyle\1373674_58_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1373674_58_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1377374\Lifestyle\1377374_03_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1377374_03_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1377375\Lifestyle\1377375_18_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1377375_18_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1377375\Lifestyle\1377375_18_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1377375_18_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1371587\Lifestyle\1371587_34_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1371587_34_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1374644\Lifestyle\1374644_54_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1374644_54_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Under Armour\1374644\Lifestyle\1374644_54_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\1374644_54_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Swannies\SW2200\Lifestyle\SW2200_28_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\SW2200_28_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Swannies\SW2200\Lifestyle\SW2200_28_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\SW2200_28_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Swannies\SWC100\Lifestyle\SWC100_54_2_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\SWC100_54_2_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Swannies\SWC100\Lifestyle\SWC100_54_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\SWC100_54_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Swannies\SWL400\Lifestyle\SWL400_28_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\SWL400_28_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\Swannies\SWL400\Lifestyle\SWL400_28_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\SWL400_28_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG110W\DG110_2A_DG110W_NJ_Double_257_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG110_2A_DG110W_NJ_Double_257_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG110W\DG110_2A_DG110W_NJ_Double_405_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG110_2A_DG110W_NJ_Double_405_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG110W\DG110_2A_DG110W_NJ_Double_597_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG110_2A_DG110W_NJ_Double_597_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG110W\DG110_2A_M_106_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG110_2A_M_106_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG110W\DG110_2A_M_214_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG110_2A_M_214_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG110W\DG110W_NJ_F_232_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG110W_NJ_F_232_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG410\Lifestyle\DG410_NJ_M_DG110_399_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG410_NJ_M_DG110_399_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG410\Lifestyle\DNU\DG410_NJ_M_DG110_399_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG410_NJ_M_DG110_399_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG410\Lifestyle\DG410_NJ_M_DG110_429_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG410_NJ_M_DG110_429_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG410\Lifestyle\DNU\DG410_NJ_M_DG110_429_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG410_NJ_M_DG110_429_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG536\Lifestyle\DG536_T5_DG536W_T4_624_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG536_T5_DG536W_T4_624_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG536\Lifestyle\DG536_T5_M_712_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG536_T5_M_712_CAT24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG536\Lifestyle\DG536_T5_M_720_SOC24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG536_T5_M_720_SOC24.jpg';},
    @{src='\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\DEVON&JONES\DG536\Lifestyle\DG536W_T4_M_653_CAT24.tif';dest='\\10.3.0.39\Alpha Broder\HotFolders\ExportedJpgs\DG536W_T4_M_653_CAT24.jpg';},
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
        $src = $f.src
        $dst = $f.dest

$src
$dst
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

    
}
catch 
{
    Write-Host "Caught an exception:"
    Write-Host "Exception Type: $($_.Exception.GetType().FullName)"
    Write-Host "Exception Message: $($_.Exception.Message)"
}