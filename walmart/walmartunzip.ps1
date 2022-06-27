$in = "Z:\Done\"
$tmp = "Y:\Work In Progress\DAM DropBox\tmp\"
$out = "Y:\Work In Progress\DAM DropBox\extractedtif\"


$zipfiles = Get-ChildItem -Path $in -Filter *.zip 
For($i=0; $i -lt 2; $i++)
{   
    try {
        #Expand-Archive -Path $zipfiles[$i].FullName -DestinationPath $tmp
        #Move-Item $zipfiles[$i].Fullname -Destination $tmp
        Copy-Item $zipfiles[$i].Fullname -Destination $tmp
    } catch {

    }
}

$tiffiles = Get-ChildItem -Path $tmp -Filter *.tif -Recurse
for($y=0; $y -lt $tiffiles.count; $y++)
{
    try {
        #$outfile = $out + $tiffiles[$y].Name
        #Move-Item -Path $tiffiles[$y].FullName -Destination $out
    } catch {

    }
}