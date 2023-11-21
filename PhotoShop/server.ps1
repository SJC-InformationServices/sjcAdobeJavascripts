$appRef = New-Object -ComObject Photoshop.Application

try 
{
    $docName = $appRef.ActiveDocument.Name
} catch {
    $appRef.DisplayDialogs = 3

    $appRef.DoJavascript 'E:\repo\sjcAdobeJavascripts\PhotoShop\server.jsx'
}   

$appRef.Quit()