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
//f.copy(outFolder + "\\" + f.name);
var als = doc.artLayers;
for (var ii = 0; ii < als.length; ii++) {
    var al = als[ii];
    al.visible=true;
    if (al.isBackgroundLayer) {
        al.isBackgroundLayer=false;
    }
    if (al.name.toUpperCase() != "LAYER 1" && al.name.toUpperCase() != "SHADOW") {
        al.remove();
    }
}
doc.resizeCanvas(w+padding*2+"px",h+padding*2+"px",AnchorPosition.MIDDLECENTER);

//doc.mergeVisibleLayers();
   
var crop = getCropDimensions();

var objWidth = parseFloat(crop[2].replace("px",""))-parseFloat(crop[0].replace("px",""));
var objHeight = parseFloat(crop[3].replace("px",""))-parseFloat(crop[1].replace("px",""));

var wRatio = minW/objWidth;
var hRatio = minH/objHeight;

if (wRatio < hRatio)
{
    var ratio = minW/objWidth;
} else {
    var ratio = minH/objHeight;
}
doc.resizeImage(w*ratio+"px");
    //Get New dimensions to validate
    var rCrop = getCropDimensions();
    var rObjHeight = parseFloat(rCrop[3].replace("px",""))-parseFloat(rCrop[1].replace("px",""));
    var rObjWidth = parseFloat(rCrop[2].replace("px",""))-parseFloat(rCrop[0].replace("px",""));
    if (rObjHeight>minH){
        var rRatio = minH/rObjHeight;
        doc.resizeImage(null,h*ratio+"px");    
    }
    if (rObjWidth>minW){
        var rRatio = minW/rObjWidth;
        doc.resizeImage(w*rRatio+"px");
    }

/*
var cropb = getCropDimensions();

var nObjWidth = parseFloat(cropb[2].replace("px",""))-parseFloat(cropb[0].replace("px",""));
var nObjHeight = parseFloat(cropb[3].replace("px",""))-parseFloat(cropb[1].replace("px",""));

var nw = parseFloat(doc.width);
var nh = parseFloat(doc.height);
/*
var eW =(parseFloat(cropb[2].replace("px",""))+parseFloat(cropb[0].replace("px",""))+padding)-nw;
//Enough Height Canvas
var eH =(parseFloat(cropb[3].replace("px",""))+parseFloat(cropb[1].replace("px",""))+padding)-nh;

if(eW > 0 || eH > 0)
{
 var resizeHeight = eH>0?nh+eH:nh;
 var resizeWidth = eW>0?nw+eW:nw;
   
 doc.resizeCanvas(resizeWidth+"px",resizeHeight+"px",AnchorPosition.MIDDLELEFT);
}
*/
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

var nfpng = File(outFolder +"\\"+ app.activeDocument.name.split(".")[0]+".png");
                exportOptions = new ExportOptionsSaveForWeb();
                exportOptions.format = SaveDocumentType.PNG;
                exportOptions.PNG8 = false; // false = PNG-24
                exportOptions.transparency = true; // true = transparent
                exportOptions.interlaced = false; // true = interlacing on
                exportOptions.includeProfile = true; // false = don't embedd ICC profile
               app.activeDocument.exportDocument(nfpng, ExportType.SAVEFORWEB, exportOptions,Extension.LOWERCASE);
            
var artLayers = doc.artLayers;
var fillLayer = artLayers.add();
fillLayer.name="Fill";
doc.selection.selectAll();
var colorRef=new SolidColor();
colorRef.cmyk.cyan="8";
colorRef.cmyk.magenta="6";
colorRef.cmyk.yellow="6";
colorRef.cmyk.black="0";
doc.selection.fill(colorRef);
fillLayer.move(artLayers[artLayers.length-1],ElementPlacement.PLACEAFTER);
doc.mergeVisibleLayers();  doc.selection.deselect();



           var nf = File(outFolder +"\\"+ app.activeDocument.name.split(".")[0]+".jpg");
            var jpgSave = new JPEGSaveOptions();
                jpgSave.embedColorProfile = true;
                jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
                jpgSave.matte = MatteType.NONE;
                jpgSave.quality = 12;
                app.activeDocument.saveAs(nf, jpgSave, true, Extension.LOWERCASE);
                //app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);