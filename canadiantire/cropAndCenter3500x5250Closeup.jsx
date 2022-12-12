
function cdnTire3500x5250Closeup(){
    
    var fw = 3500;
    var fh = 5250;
    var padding = 75;
    var minH = fh - (padding * 2);
    var minW = fw - (padding * 2);
    
    var inFolder =  Folder("/10.3.0.39/Canadian Tire/hotfolder/3500x5250_png-jpg-closeups/In");
    var outFolder = Folder("/10.3.0.39/Canadian Tire/hotfolder/3500x5250_png-jpg-closeups/OUT");
    /*var inFolder = Folder.selectDialog("Select Source Folder");
    var outFolder = Folder.selectDialog("Select Out Folder");*/
    
    
    var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);
    
    for (var i = 0; i < files.length; i++) {
        try {
    
            f = files[i];
            f.copy(outFolder + "/" + f.name);
            app.open(f);
            var doc = app.activeDocument;
            var w = parseFloat(doc.width);
            var h = parseFloat(doc.height);
            var cropPath,pathOne;
            
                for(var y=0;y<app.activeDocument.pathItems.length;y++)
                {
                    p=app.activeDocument.pathItems[y];
                    if(p.name == "Path 1")
                    {
                    pathOne=p;
                    }
                    else if(p.name == "CROP")
                    {
                    cropPath=p;
                    }
                    
                }
                cropPath.makeSelection(1, 1, SelectionType.REPLACE);
                var cropC = app.activeDocument.selection.bounds.join(",").split(",");
                var objHeight = parseFloat(cropC[3].replace("px",""))-parseFloat(cropC[1].replace("px",""));
                var objWidth = parseFloat(cropC[2].replace("px",""))-parseFloat(cropC[0].replace("px",""));
                
                doc.crop([
                    parseFloat(cropC[0].replace("px",""))-padding,
                    parseFloat(cropC[1].replace("px",""))-padding,
                    parseFloat(cropC[2].replace("px",""))+padding,
                    parseFloat(cropC[3].replace("px",""))+padding
                ]);
                
                if (objWidth > objHeight)
                {
                    var ratio = minW/objWidth;
                    doc.resizeImage(w*ratio+"px");
                } else {
                    var ratio = minH/objHeight;
                    doc.resizeImage(null,h*ratio+"px");
                }
                
                if (objWidth > objHeight)
                {
                    doc.resizeImage(fw+"px");
                } else {
                    
                    doc.resizeImage(null,fh+"px");
                }
                var nfpng = File(outFolder +"/"+ app.activeDocument.name.split(".")[0]+".png");

                var exportOptions = new ExportOptionsSaveForWeb();
                exportOptions.format = SaveDocumentType.PNG;
                exportOptions.PNG8 = false; // false = PNG-24
                exportOptions.transparency = true; // true = transparent
                exportOptions.interlaced = false; // true = interlacing on
                exportOptions.includeProfile = true; // false = don't embedd ICC profile
                app.activeDocument.exportDocument(nfpng, ExportType.SAVEFORWEB, exportOptions,Extension.LOWERCASE);

                var als = doc.artLayers;

var fillLayer = als.add();
fillLayer.name="Fill";
doc.selection.selectAll();
var colorRef=new SolidColor;
colorRef.cmyk.cyan="8";
colorRef.cmyk.magenta="6";
colorRef.cmyk.yellow="6";
colorRef.cmyk.black="0";
doc.selection.fill(colorRef);
fillLayer.move(als[als.length-1],ElementPlacement.PLACEAFTER);

doc.flatten();    


            var nf = File(outFolder +"/"+ app.activeDocument.name.split(".")[0]+".jpg");
            var jpgSave = new JPEGSaveOptions();
                jpgSave.embedColorProfile = true;
                jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
                jpgSave.matte = MatteType.NONE;
                jpgSave.quality = 12;
                app.activeDocument.saveAs(nf, jpgSave, true, Extension.LOWERCASE);
                app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);

        }
        catch (e)
        {
            alert(e.message);
            app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
            
        }
    }
    return true;
}
    
cdnTire3500x5250Closeup();