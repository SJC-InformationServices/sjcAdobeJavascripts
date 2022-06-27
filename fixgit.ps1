$files = Get-ChildItem "walmart" -Recurse -Depth 4
foreach($file in $files)
{
    $fn = $file.Name
    $full = $file.FullName.replace("C:\Users\KevinNoseworthy\OneDrive - St Joseph Communications, Content Group\Documents\GitHub\photoshopscripts\","").replace("\","/");
    git hash-object -w "$full"
    $fn
    $full
}