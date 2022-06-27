#Requires -Modules @{ModuleName='AWS.Tools.Common';ModuleVersion='4.0.6.0'}
#Requires -Modules @{ModuleName='AWS.Tools.S3';ModuleVersion='4.0.6.0'}

$path = "\\10.3.0.39\Alpha Broder\SharepointContent\SP2S3"
$images = Get-ChildItem $path -Filter '*.png'

foreach ($img in $images) {
    $key = "images/"+$img.Name
    $key
    Write-S3Object -BucketName "sjm-alphabroder-raw-images" -File $img.FullName -Key $key -Region us-east-1 -CannedACLName bucket-owner-full-control
    aws s3api put-object-acl --bucket "sjm-alphabroder-raw-images" --key $key --grant-read "uri=http://acs.amazonaws.com/groups/global/AllUsers" --grant-full-control "id=5c0984a6616f2d2d921f31dc12dea0e66bf0032f675287859ceb6eb2fa06768c" 
    Remove-Item $img.FullName
}