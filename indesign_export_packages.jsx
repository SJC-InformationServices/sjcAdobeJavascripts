
app.scriptPreferences.userInteractionLevel = UserInteractionLevels.neverInteract;

var infolder = Folder.selectDialog("Choose Source Folder");
var outfolder = Folder.selectDialog("Chose Destination Folder");

var files = infolder.getFiles("*.indd");

var copyingFonts = true;
var copyingLinkedGraphics = true;
var copyingProfiles = true;
var updatingGraphics = false;
var includingHiddenLayers = false;
var ignorePreflightErrors = true;
var creatingReport = false;
var includeIdml = false;
var includePDF = false;
var pdfstyle = "default";
var useDocumentHyphenationExceptionsOnly = false;
var versionComments = "";
var forceSave = false;

for(var i =0; i<files.length; i++)
{
var f = app.open(files[i]);
var n = f.name;
var Destination = new Folder(outfolder.absoluteURI + "/" + n.replace(".indd",""));
Destination.create();

app.activeDocument.packageForPrint (
    Destination, 
    copyingFonts, 
    copyingLinkedGraphics, 
    copyingProfiles, 
    updatingGraphics, 
    includingHiddenLayers,
    ignorePreflightErrors, 
    creatingReport,
    includeIdml,
    includePDF,
    pdfstyle,
    useDocumentHyphenationExceptionsOnly, 
    versionComments,
    forceSave
   );

f.close (SaveOptions.NO)
}