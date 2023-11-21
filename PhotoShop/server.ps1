$appRef = New-Object -ComObject Photoshop.Application

try 
{
    $docName = $appRef.ActiveDocument.Name
} catch {
    $appRef.DisplayDialogs = 3

    $appRef.DoJavascript ("C:\Users\KevinNoseworthy\OneDrive - St Joseph Communications, Content Group\Documents\GitHub\photoshopscripts\PhotoShop\server.jsx")
}   

