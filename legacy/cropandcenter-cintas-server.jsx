/**
* @@@BUILDINFO@@@ cropandcenter-server.jsx !Version! Thu Jan 23 2020 18:02:45 GMT-0500
*/
function cropcentercintas(){
var sourcePath = 'C:\\Users\\KevinNoseworthy\\OneDrive - St Joseph Communications, Content Group\\Desktop\\New folder\\';
var DestinationPath = 'C:\\Users\\KevinNoseworthy\\OneDrive - St Joseph Communications, Content Group\\Desktop\\New folder\\';
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

var sized = "400px"
var canvassize = "500px"


var inFolder = Folder(sourcePath);
var imgs = inFolder.getFiles(/\.(jpg|tif|)$/i);

for(var i=0; i < imgs.length; i++)
{

try
{
app.open(imgs[i]);

var doc = app.activeDocument;
var fPath = DestinationPath + doc.name;
var als = doc.artLayers;
for(var ii=0;ii<als.length;ii++)
{
    var al = als[ii];
    al.isBackgroundLayer = false;
    al.visible = true;
}
doc.activeLayer = als[als.length-1];
doc.flatten();
var clippaths = doc.pathItems;
var p = clippaths[0];
p.makeSelection(1,1,SelectionType.REPLACE);
     
if(!doc.selection){
    doc.close(SaveOptions.DONOTSAVECHANGES);
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
    p.makeSelection(1,1,SelectionType.REPLACE);
    var selection = doc.selection
    selection.invert();
    selection.clear();
    

    /*var orgLayer = doc.artLayers[0];

    var newLayer = doc.artLayers.add();
    newLayer.name = 'White';
    newLayer.blendMode = BlendMode.NORMAL;
    doc.selection.selectAll;
    */
    var colorRef = new SolidColor;
    colorRef.rgb.red = 255;
    colorRef.rgb.green = 255;
    colorRef.rgb.blue = 255;
    selection.fill(colorRef);
    
    var jpgFile = new File(fPath);

    //doc.saveAs(jpgFile, tifSaveOptions, true, Extension.LOWERCASE);
    doc.saveAs(jpgFile, jpgSaveOptions, true, Extension.LOWERCASE);
    doc.close(SaveOptions.DONOTSAVECHANGES);
    /*imgs[i].remove()*/

}
} catch (e) {
    alert("Error" + e.message);
}
}
}