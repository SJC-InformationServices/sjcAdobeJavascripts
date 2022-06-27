#Requires -Modules @{ModuleName='AWS.Tools.Common';ModuleVersion='4.0.6.0'}
#Requires -Modules @{ModuleName='AWS.Tools.S3';ModuleVersion='4.0.6.0'}

Try
{
$team = "AlphaBroderContent"
$url = "https://sjccontent.sharepoint.com/teams/$team"
$conn = Connect-PnPOnline -ClientId 9b83a440-7d7a-4d2f-bf72-ae69b6c15768 -CertificatePath "certs\\StJosephContent.pfx" -CertificatePassword (ConvertTo-SecureString -AsPlainText "5jcAdmin!" -Force) -Url $url -Tenant "sjccontent.onmicrosoft.com" 
} Catch {

    $_
    start-sleep -Seconds 45
    Exit;
}

$path = "\\10.3.0.39\Alpha Broder\HotFolders\Alpha_PNG_S3_SP\Out"

$files = Get-Childitem -Path $path -Filter *.png 
if($files.length -gt 0){
for($i=0; $i -lt 30; $i++)
{
    $i
    $file = $files[$i];
    $n = $files[$i].Name.ToUpper().Replace(".PNG","");
    $f_rec = $n.split("_");
    if($f_rec.count -eq 2){
        $style = $f_rec[0];
        $color = $f_rec[1];
        $a = "FF";
    }else {
        $style = $f_rec[0];
        $color = $f_rec[2];
        $a = $f_rec[1];
    }
    switch($a)
    {
        FF {$angel = "Front"}
        BK {$angel = "Back"}
        SD {$angel = "Side"}
        OF1 {$angel = "Off Figure"}
        OFB {$angel = "Off Figure Back"}
        OFS {$angel = "Off Figure Side"}
        OFQ {$angel = "Off Figure Quarter"}
        LSD {$angel = "Left Side"}
        OFLS {$angel = "Off Figure Left Side"}
        QRT {$angel = "Quarter"}
        default {$angel = "Other"}
    }
    $s_qry = "<View><Query><Where><Eq><FieldRef Name='Title'/><Value Type='Text'>$style</Value></Eq></Where></Query></View>"
    $c_qry = "<View><Query><Where><And>
    <Eq><FieldRef Name='color_style'/><Value Type='Text'>$style</Value></Eq>
    <Eq><FieldRef Name='color_code' /><Value Type='Text'>$color</value></Eq>
    </And>
    </Where></Query></View>"
    
    #Style Records
    $s = Get-PnPListItem -List 'Styles' -Query $s_qry;
    $short_desc = $s.FieldValues["short_description"];
    $brand = $s.FieldValues["brand_lookup"];
    $categories = $s.FieldValues["stylecategories"];
    $style_id  = $s.FieldValues["ID"];
    $bn = $s.FieldValues["brandname"];
    #Color Records
    $c = Get-PnPListItem -List 'Colors' -Query $c_qry;
    $c_name = $c.FieldValues["color_name"];

    $attributes = @{
        brandname=$($bn.TermGuid)
        brand_lookup=$($brand.LookUpId);
        short_description=$short_desc;
        color_code=$color;
        colorname1=$c_name;
        featuredstyle=$style;
        Title=$file.Name;
        uniquetitle=$file.Name;
        Keywords="$style,$color,$angel";
        stylecategories=$($categories.TermGuid);
        sendtos3=0;
        imageangle=$angel;
    };
    
    
    $spfile = Add-PnPFile -Path $file.FullName -Folder "WebImages/$($brand.LookUpValue)/$style/" -values $attributes -Checkout;
    
    $key = "images/"+$file.Name
    Write-S3Object -BucketName "sjm-alphabroder-raw-images" -File $file.FullName -Key $key -Region us-east-1 -CannedACLName bucket-owner-full-control
    aws s3api put-object-acl --bucket "sjm-alphabroder-raw-images" --key $key --grant-read "uri=http://acs.amazonaws.com/groups/global/AllUsers" --grant-full-control "id=5c0984a6616f2d2d921f31dc12dea0e66bf0032f675287859ceb6eb2fa06768c" 
    Remove-Item $file.FullName
}}

start-sleep -Seconds 10