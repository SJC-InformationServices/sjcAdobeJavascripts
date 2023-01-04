function getCropDimensions(){
    for(var y=0;y<app.activeDocument.pathItems.length;y++)
    {
        p=app.activeDocument.pathItems[y];
        if(p.name == "Path 1")
        {
            p.makeSelection(1, 1, SelectionType.REPLACE);
        }
    }
    
var crop = app.activeDocument.selection.bounds.join("||").split("||");
return crop;
}
var fw = 3500;
var fh = 5250;
var padding = 150;
var minH = fh - (padding * 2);
var minW = fw - (padding * 2);
var outFolder=Folder("/C/Users/KevinNoseworthy/Desktop/New folder/out");

var doc = app.activeDocument;
var w = parseFloat(doc.width);
var h = parseFloat(doc.height);

var crop = getCropDimensions();

alert("w:"+w+" h:"+h+" crop:"+crop.join(";"));