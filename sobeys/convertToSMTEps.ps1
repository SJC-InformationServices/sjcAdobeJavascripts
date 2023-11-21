function convertToSMTEps{
     $inFolder = Folder("\\\\10.136.209.199\\Sobeys_Assets\\_HotFolders\\EpsClippingPath\\In");
     $outFolder = Folder("\\\\10.136.209.199\\Sobeys_Assets\\_HotFolders\\EpsClippingPath\\Out");

     # Create a new Photoshop Application object
$appRef = New-Object -ComObject Photoshop.Application
# Set the dialog mode to psDisplayNoDialogs
$appRef.DisplayDialogs = 3
$Inc =  ".tif",".jpg",".eps",".psd",".jpeg",".tiff",".png"
$files = Get-ChildItem -Path "$inFolder\*.*" -Recurse | Where-Object { $Inc -contains $_.Extension } | Select Name,FullName,LastWriteTime,CreationTime
Foreach($f in $files)
        {
            $n=$f.Name
            $fn = $f.FullName

            $fileRef = $appRef.Open($fn)
            $fileRef.ConvertProfile("U.S. Web Coated (SWOP) v2", 1,0,1)

            $SaveOptions = New-Object -ComObject Photoshop.EPSSaveOptions
            $SaveOptions.EmbedColorProfile=1
            $SaveOptions.



        }

}