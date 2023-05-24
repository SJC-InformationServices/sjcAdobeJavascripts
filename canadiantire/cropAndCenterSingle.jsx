#target "photoshop";
app.displayDialogs = DialogModes.NO;


function removeLayers(layerSet) {
    // loop over all layers in the layer set
   
        for (var i = layerSet.layers.length - 1; i >= 0; i--) {
            // get a reference to the current layer
            var currentLayer = layerSet.layers[i];
 
            // check if the current layer is a layer group
            if (currentLayer.typename === "LayerSet") {
                // if it is, call this function recursively to loop over its layers
                removeLayers(currentLayer);
            } else {
                // otherwise, check if the current layer is not named "Layer 1" or if it is the background layer
                if (currentLayer.name !== "Layer 1" || currentLayer.isBackgroundLayer) {
                    // if it is, remove it
                    currentLayer.remove();
                }
            }
        }
    
}
function getCropDimensions() {
    var dime={};
        for (var y = 0; y < app.activeDocument.pathItems.length; y++) {
            p = app.activeDocument.pathItems[y];
            if (p.name == "Path 1") {
                p.makeSelection(1, 1, SelectionType.REPLACE);
            }
        }

        var crop = app.activeDocument.selection.bounds.join("||").split("||");
        dime.cropX=parseFloat(crop[0]);
        dime.cropY=parseFloat(crop[1]);
        dime.cropEndX=parseFloat(crop[2]);
        dime.cropEndY=parseFloat(crop[3]);
        dime.cropWidth=dime.cropEndX-dime.cropX;
        dime.cropHeight=dime.cropEndY-dime.cropY;
        return dime;
    }

    function makeSelection(){
        try {
            var path = app.activeDocument.pathItems.getByName(this.clippingPath.Value);
            path.makeSelection(1, 1, SelectionType.Replace);
        
        } catch (e) {
            for (var y = 0; y < app.activeDocument.pathItems.length; y++) {
                var p = app.activeDocument.pathItems[y];
                if (p.name == "Path 1") {
                    p.makeSelection(1, 1, SelectionType.REPLACE);
                }
            }
        }
        return;
    }
    //var inFolder = Folder("\\\\10.3.0.39\\Canadian Tire\\hotfolder\\3500x5250_png-jpg\\In");
    var outFolder = Folder("C:\\Users\\KevinNoseworthy\\Desktop\\New folder\\out");
    
    var fw = 3500;
    var fh = 5250;
    var padding = 150;
    var minH=fh-(padding*2);
    var minW=fw-(padding*2);
    var doc = app.activeDocument;
    var w = parseFloat(doc.width);
    var h = parseFloat(doc.height);
    
    
     //var als = doc.layers;
            removeLayers(doc,"visible");
            //doc.resizeCanvas(w + padding * 2 + "px", h + padding * 2 + "px", AnchorPosition.MIDDLECENTER);

    var crop = getCropDimensions();
    /*
            var ratio, rRatio;
            var objWidth = parseFloat(crop[2].replace("px", "")) - parseFloat(crop[0].replace("px", ""));
            var objHeight = parseFloat(crop[3].replace("px", "")) - parseFloat(crop[1].replace("px", ""));

            var wRatio = minW / objWidth;
            var hRatio = minH / objHeight;

            if (wRatio < hRatio) {
                ratio = minW / objWidth;
            } else {
                ratio = minH / objHeight;
            }
            doc.resizeImage(w * ratio + "px");
            //Get New dimensions to validate
            var rCrop = getCropDimensions();
            var rObjHeight = parseFloat(rCrop[3].replace("px", "")) - parseFloat(rCrop[1].replace("px", ""));
            var rObjWidth = parseFloat(rCrop[2].replace("px", "")) - parseFloat(rCrop[0].replace("px", ""));
            if (rObjHeight > minH) {
                rRatio = minH / rObjHeight;
                doc.resizeImage(null, h * ratio + "px");
            }
            if (rObjWidth > minW) {
                rRatio = minW / rObjWidth;
                doc.resizeImage(w * rRatio + "px");
            }
             var cropc = getCropDimensions();
            var nCrop = [
                parseFloat(cropc[0].replace("px", "")) - padding + " px",
                parseFloat(cropc[1].replace("px", "")) - padding + " px",
                parseFloat(cropc[2].replace("px", "")) + padding + " px",
                parseFloat(cropc[3].replace("px", "")) + padding + " px",
            ];
            doc.selection.deselect();
            
            doc.crop(nCrop);
            doc.resizeCanvas(fw, fh, AnchorPosition.MIDDLECENTER);

            var nfpng = File(outFolder + "\\" + app.activeDocument.name.split(".")[0] + ".png");
            exportOptions = new ExportOptionsSaveForWeb();
            exportOptions.format = SaveDocumentType.PNG;
            exportOptions.PNG8 = false; // false = PNG-24
            exportOptions.transparency = true; // true = transparent
            exportOptions.interlaced = false; // true = interlacing on
            exportOptions.includeProfile = true; // false = don't embedd ICC profile
            app.activeDocument.exportDocument(nfpng, ExportType.SAVEFORWEB, exportOptions, Extension.LOWERCASE);

            try{
            var artLayers = doc.layers;
            var fillLayer = artLayers.add();
            fillLayer.name = "Fill";
            doc.selection.selectAll();
            var colorRef = new SolidColor();
            colorRef.cmyk.cyan = "8";
            colorRef.cmyk.magenta = "6";
            colorRef.cmyk.yellow = "6";
            colorRef.cmyk.black = "0";
            doc.selection.fill(colorRef);
            fillLayer.move(artLayers[artLayers.length - 1], ElementPlacement.PLACEAFTER);
            doc.mergeVisibleLayers();
            doc.selection.deselect();

            var nf = File(outFolder + "\\" + app.activeDocument.name.split(".")[0] + ".jpg");
            var jpgSave = new JPEGSaveOptions();
            jpgSave.embedColorProfile = true;
            jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
            jpgSave.matte = MatteType.NONE;
            jpgSave.quality = 12;
            app.activeDocument.saveAs(nf, jpgSave, true, Extension.LOWERCASE);
            } catch( e ){
                alert(e.message);
            }*/


    