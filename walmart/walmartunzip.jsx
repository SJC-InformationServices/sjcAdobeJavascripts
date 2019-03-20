app.scriptPreferences.userInteractionLevel = UserInteractionLevels.neverInteract;

var infolder = Folder.selectDialog("Choose Source Folder");
var outfolder = Folder.selectDialog("Chose Destination Folder");

var files = infolder.getFiles("*.tif");

for(var i =0; i<files.length; i++)
{



}