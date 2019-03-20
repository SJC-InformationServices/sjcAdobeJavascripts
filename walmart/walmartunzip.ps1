$in = "Z:\todo\=Downloaded"
$tmp = "Y:\Work In Progress\DAM DropBox\tmp"
$out = "Y:\Work In Progress\DAM DropBox\extractedtif"

$zipfiles = Get-ChildItem -Path $in -Filter *.zip 
For($i=0; $i -lt $zipfiles.count; $i++)
{
    Expand-Archive -Path $zipfiles[$i].FullName -DestinationPath $tmp
}

$tiffiles = Get-ChildItem -Path $tmp -Filter *.tif -Recurse
for($y=0; $y -lt $tiffiles.count; $y++)
{
    $outfile = $out + $tiffiles[$y].Name
    Move-Item -Path $tiffiles[$y].FullName -Destination $out
}