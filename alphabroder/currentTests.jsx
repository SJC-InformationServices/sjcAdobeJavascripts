
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

var als = doc.artLayers;
for (var ii = 0; ii < als.length; ii++) {
var al = als[ii];
if (al.isBackgroundLayer || al.name=="Background") {
    al.remove();
}
}
   
var crop = getCropDimensions();

var objWidth = parseFloat(crop[2].replace("px",""))-parseFloat(crop[0].replace("px",""));
var objHeight = parseFloat(crop[3].replace("px",""))-parseFloat(crop[1].replace("px",""));

if (objWidth > objHeight)
{
    var ratio = minW/objWidth;
    doc.resizeImage(w*ratio+"px");
} else {
    var ratio = minH/objHeight;
    doc.resizeImage(null,h*ratio+"px");
}
var cropb = getCropDimensions();

var nObjWidth = parseFloat(cropb[2].replace("px",""))-parseFloat(cropb[0].replace("px",""));
var nObjHeight = parseFloat(cropb[3].replace("px",""))-parseFloat(cropb[1].replace("px",""));

var nw = parseFloat(doc.width);
var nh = parseFloat(doc.height);

//Enough Width
var eW =(parseFloat(cropb[2].replace("px",""))+parseFloat(cropb[0].replace("px",""))+padding)-nw;
//Enough Height
var eH =(parseFloat(cropb[3].replace("px",""))+parseFloat(cropb[1].replace("px",""))+padding)-nh;

if(eW > 0 || eH > 0)
{
 var resizeHeight = eH>0?nh+eH:nh;
 var resizeWidth = eW>0?nw+eW:nw;
   
 doc.resizeCanvas(resizeWidth+"px",resizeHeight+"px",AnchorPosition.TOPLEFT);
}
var cropc = getCropDimensions();
var nCrop = [
    parseFloat(cropc[0].replace("px",""))-padding+" px",
    parseFloat(cropc[1].replace("px",""))-padding+" px",
    parseFloat(cropc[2].replace("px",""))+padding+" px",
    parseFloat(cropc[3].replace("px",""))+padding+" px",
];
doc.selection.deselect();
//alert(cropc.join('\r\n')+"\r\n"+[doc.width,doc.height].join("\r\n")+"\r\n"+nCrop.join("\r\n"));
doc.crop(nCrop);
doc.resizeCanvas(fw,fh,AnchorPosition.MIDDLECENTER);
var fillLayer = als.add();
fillLayer.name="Fill";
doc.selection.selectAll();
var colorRef=new SolidColor();
colorRef.cmyk.cyan="8";
colorRef.cmyk.magenta="6";
colorRef.cmyk.yellow="6";
colorRef.cmyk.black="0";
doc.selection.fill(colorRef);
fillLayer.move(als[als.length-1],ElementPlacement.PLACEAFTER);
doc.flatten();    

            var nf = File(outFolder +"\\"+ app.activeDocument.name.split(".")[0]+".jpg");
            var jpgSave = new JPEGSaveOptions();
                jpgSave.embedColorProfile = true;
                jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
                jpgSave.matte = MatteType.NONE;
                jpgSave.quality = 12;
                app.activeDocument.saveAs(nf, jpgSave, true, Extension.LOWERCASE);