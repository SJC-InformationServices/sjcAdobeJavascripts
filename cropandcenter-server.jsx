/**
* @@@BUILDINFO@@@ cropandcenter-server.jsx !Version! Thu Jan 23 2020 18:02:45 GMT-0500
*/
#target "photoshop"

app.displayDialogs = DialogModes.NO;
app.preferences.rulerUnits = Units.PIXELS;

var sourcePath = '\\\\10.3.0.39\\PrePress_RAID\\_Crop_Centre_Scripts_DoNotDelete\\Process_2400_2400_25WHT\\';
var DestinationPath = '\\\\10.3.0.39\\PrePress_RAID\\_Crop_Centre_Scripts_DoNotDelete\\Completed_2400_2400_25WHT\\';
var jpgSaveOptions = new JPEGSaveOptions();
jpgSaveOptions.formatOptions = FormatOptions.OPTIMIZEDBASELINE;
jpgSaveOptions.embedColorProfile = true;
jpgSaveOptions.matte = MatteType.NONE;
jpgSaveOptions.quality = 12;

var tifSaveOptions = new TiffSaveOptions();
tifSaveOptions.ByteOrder = ByteOrder.IBM;
tifSaveOptions.embedColorProfile = true;
tifSaveOptions.imageCompression = TIFFEncoding.NONE;
tifSaveOptions.saveImagePyramid = true;

var sized = "2250px"
var canvassize = "2400px"


var inFolder = Folder(sourcePath);
var imgs = inFolder.getFiles(/\.(jpg|tif|)$/i);

for(var i=0; i < imgs.length; i++)
{

try
{
app.open(imgs[i]);

var doc = app.activeDocument;
var fPath = DestinationPath + doc.name;
doc.artLayers[0].isBackgroundLayer = false;
var clippaths = doc.pathItems;
var p;
for(var y=0;y<clippaths.length;y++)
{
    p = clippaths[y];
    if(p.name == 'Path 1')
    {
        p.makeSelection(1,1,SelectionType.REPLACE);
        break;
    }
}
if(!doc.selection){
    alert("No Valid Path Found");
}else{

    doc.crop(doc.selection.bounds);
    var w = doc.width
    var h = doc.height
if (w > h)
{
    doc.resizeImage(sized);
}
else {
    doc.resizeImage(null,sized);
}
    doc.resizeCanvas(canvassize, canvassize);
    var orgLayer = doc.artLayers[0];

    var newLayer = doc.artLayers.add();
    newLayer.name = 'White';
    newLayer.blendMode = BlendMode.NORMAL;
    doc.selection.selectAll;

    var colorRef = new SolidColor;
    colorRef.rgb.red = 255;
    colorRef.rgb.green = 255;
    colorRef.rgb.blue = 255;
    doc.selection.fill(colorRef);
    orgLayer.move(newLayer, ElementPlacement.PLACEBEFORE);
    doc.flatten();

    var jpgFile = new File(fPath);

    if(doc.name.substr(-3) == 'tif')
    {
        var saveop = tifSaveOptions;
    }else{
        var saveop = jpgSaveOptions;
    }
    activeDocument.saveAs(jpgFile, saveop, true, Extension.LOWERCASE);
    activeDocument.close(SaveOptions.DONOTSAVECHANGES);
    imgs[i].remove()

}
} catch (e) {
    alert("Error" + e.message);
}
}
