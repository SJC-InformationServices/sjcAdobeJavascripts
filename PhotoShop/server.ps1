$appRef = New-Object -ComObject Photoshop.Application
# Set the dialog mode to psDisplayNoDialogs
$appRef.DisplayDialogs = 3

$appRef.DoJavascript ("C:\Users\KevinNoseworthy\OneDrive - St Joseph Communications, Content Group\Documents\GitHub\photoshopscripts\PhotoShop\server.jsx")