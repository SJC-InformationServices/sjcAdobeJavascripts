app.preferences.rulerUnits = Units.PIXELS;
var doc = app.activeDocument;
try{
doc.artLayers[0].isBackgroundLayer = false;
var sized = "2325px"
var canvassize = "2400px"
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
}
} catch (e) {
    alert("Error" + e.message)
}