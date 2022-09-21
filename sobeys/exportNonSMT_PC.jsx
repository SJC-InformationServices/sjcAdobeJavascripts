#target "indesign";
app.scriptPreferences.userInteractionLevel = UserInteractionLevels.NEVER_INTERACT;
var inFolder = Folder.selectDialog("Select Source Folder");
var outFolder = Folder.selectDialog("Select Destination Folder");

var files = inFolder.getFiles(/\.(indd)$/i);

for(var i=0;i<files.length;i++)
{
    var file = files[i];
        app.open(file.fsName);
    var links = app.activeDocument.links;
    for(var l=0;l<links.length;l++)
    {
        var link = links[l];
        
        if(link.filePath.indexOf("Sobeys_SMT") == -1 && link.filePath.indexOf("Logos_Icons") == -1)
        {
            
            var asset = new File(link.filePath.replace("\\Volumes\\","\\\\10.136.209.199\\"));
            var newAsset = new File(outFolder.fullName+"/"+link.name);
            
            if(!newAsset.exists){
                try {
                    asset.copy(outFolder.fullName+"/"+link.name);
                }catch(e){

                }
            }
        }

    }
app.activeDocument.close(SaveOptions.NO);

}