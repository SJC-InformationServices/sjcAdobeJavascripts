function WM_3000x3000_300dpi_50px_MagicWand(log) {
    // Get the current date and time
    var current = new Date();
    var cDate = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
    var cTime = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
    var dateTime = cDate + ' ' + cTime;
    log.writeln("Start SNS KeepBackground 2400: " + dateTime);

    function removeLayers(layerSet) {
        // loop over all layers in the layer set

        for (var y = layerSet.layers.length - 1; y >= 0; y--) {
            // get a reference to the current layer
            var currentLayer = layerSet.layers[y];

            // check if the current layer is a layer group
            if (currentLayer.typename === "LayerSet") {
                // if it is, call this function recursively to loop over its layers
                removeLayers(currentLayer);
            } else {
                // otherwise, check if the current layer is not named "Layer 1" or if it is the background layer
                if (currentLayer.name !== "Layer 1") {
                    // if it is, remove it
                    currentLayer.remove();
                }
            }
        }
    }
    function magicWand (x, y, t, a, c, s) {
    try{
    if (arguments.length < 2) return; // make sure have x,y
    if (undefined == t) var t = 35; // set defaults of optional arguments
    if (undefined == a) var a = true;
    if (undefined == c) var c = false;
    if (undefined == s) var s = false;
    var desc = new ActionDescriptor();
    var ref = new ActionReference();
    ref.putProperty(charIDToTypeID('Chnl'), charIDToTypeID('fsel'));
    desc.putReference(charIDToTypeID('null'), ref);
    var positionDesc = new ActionDescriptor();
    positionDesc.putUnitDouble(charIDToTypeID('Hrzn'), charIDToTypeID('#Rlt'), x); // in pixels
    positionDesc.putUnitDouble(charIDToTypeID('Vrtc'), charIDToTypeID('#Rlt'), y);
    desc.putObject(charIDToTypeID('T   '), charIDToTypeID('Pnt '), positionDesc);
    desc.putInteger(charIDToTypeID('Tlrn'), t); // tolerance
    desc.putBoolean(charIDToTypeID('Mrgd'), s); // sample all layers
    if (!c) desc.putBoolean(charIDToTypeID("Cntg"), false); //  contiguous
    desc.putBoolean(charIDToTypeID('AntA'), a); // anti-alias
    executeAction(charIDToTypeID('setd'), desc, DialogModes.NO);
    }catch(e){
        this.error(e,"magicWand");
    }
    }

    function getCropDimensions() {
        var dime = {};
        /*for (var y = 0; y < app.activeDocument.pathItems.length; y++) {
            p = app.activeDocument.pathItems[y];
            if (p.name == "Path 1") {
                p.makeSelection(1, 1, SelectionType.REPLACE);
            }
        }*/
       
        var crop = app.activeDocument.selection.bounds.join("||").split("||");
        dime.cropX = parseFloat(crop[0]);
        dime.cropY = parseFloat(crop[1]);
        dime.cropEndX = parseFloat(crop[2]);
        dime.cropEndY = parseFloat(crop[3]);
        dime.cropWidth = dime.cropEndX - dime.cropX;
        dime.cropHeight = dime.cropEndY - dime.cropY;
        return dime;
    }
    var tiffSaveOptions = new TiffSaveOptions();
    tiffSaveOptions.embedColorProfile = true; // Embed color profile
    tiffSaveOptions.alphaChannels = true; // Preserve alpha channels
    tiffSaveOptions.layers = true; // Preserve layers
    tiffSaveOptions.imageCompression = TIFFEncoding.NONE; // No compression

    var originalBGColor = app.backgroundColor;
    var grey = " 4c 3m 3y";
    var cmykColor = new SolidColor();
        cmykColor.cmyk.cyan = 0;
        cmykColor.cmyk.magenta = 0;
        cmykColor.cmyk.yellow = 0;
        cmykColor.cmyk.black = 0;
        app.backgroundColor = cmykColor;

    var fw = 3000;
    var fh = 3000;
    var padding = 50;
    var minH = fh - (padding * 2);
    var minW = fw - (padding * 2);

    var inFolder = Folder("\\\\10.3.0.39\\Alpha Broder\\HotFolders\\WM_3000x3000_300dpi_50px_MagicWand\\IN");
    var outFolder = Folder("\\\\10.3.0.39\\Alpha Broder\\HotFolders\\WM_3000x3000_300dpi_50px_MagicWand\\Out");

    var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);
    log.writeln("Total Files: " + files.length);
    for (var i = 0; i < files.length; i++) {

        f = files[i];
        log.writeln(i +":"+f.fullName);

           
                app.open(f);
                var doc = app.activeDocument;
                
           
            var w = parseFloat(doc.width);
            var h = parseFloat(doc.height);
            var als = doc.artLayers;

                // Loop over all art layers and make them visible and not background layers
                for (var ii = 0; ii < als.length; ii++) {
                    var al = als[ii];
                    al.isBackgroundLayer = false;
                    al.visible = true;
                }
            var mw = magicWand(5,5,1,true,true,true);
                doc.selection.invert();
            var getDim = getCropDimensions();

            var ratio = Math.min(minW / getDim.cropWidth, minH / getDim.cropHeight);
            
            if (getDim.cropWidth > getDim.cropHeight) {
                log.writeln("Resize BY: Width");
                doc.resizeImage(w*ratio + "px");
                /*if (doc.height > parseInt(fh)) {
                    doc.resizeImage(null, fh + "px")
                }*/
            } else {
                log.writeln("Resize By: Height");
                doc.resizeImage(null, h * ratio + "px");
                /*if (doc.width > parseInt(fw)) {
                    doc.resizeImage(fw+"px");
                }*/
            }
      
            var mw = magicWand(5,5,1,true,true,true);
            doc.selection.invert();
            var getDimB = getCropDimensions();
            
            
            if (getDimB.cropWidth < getDimB.cropHeight) {
                var newY = getDimB.cropY - padding + " px";
                var newEndY = getDimB.cropEndY + padding + " px";

                var offSet = (fw - getDimB.cropWidth) / 2;

                var newX = getDimB.cropX - offSet + " px";
                var newEndX = getDimB.cropEndX + offSet + " px";
                var newC = [newY, newEndY, offSet, newX, newEndX];
            } else {
                var newX = getDimB.cropX - padding + " px";
                var newEndX = getDimB.cropEndX + padding + " px";

                var offSet = (fh  - getDimB.cropHeight) / 2;
                var newY = getDimB.cropY - offSet + " px";
                var newEndY = getDimB.cropEndY + offSet + " px";

                var newC = [newY, newEndY, offSet, newX, newEndX];
            }

            doc.crop([
                newX,
                newY,
                newEndX,
                newEndY
            ]);
            
            
            //doc.resizeImage(minW+"px", minH + "px");
            doc.resizeCanvas(fw,fh)
            
 var fillLayer = als.add();
fillLayer.name="Fill";
doc.selection.selectAll();
var colorRef=new SolidColor;
colorRef.cmyk.cyan="0";
colorRef.cmyk.magenta="0";
colorRef.cmyk.yellow="0";
colorRef.cmyk.black="0";
doc.selection.fill(colorRef);
fillLayer.move(als[als.length-1],ElementPlacement.PLACEAFTER);
doc.flatten();
            

                var nf = File(outFolder + "\\" + app.activeDocument.name.split(".")[0] + ".jpg");
               var jpgSave = new JPEGSaveOptions();
        jpgSave.embedColorProfile = true;
        jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
        jpgSave.matte = MatteType.NONE;
        jpgSave.quality = 12;
                doc.saveAs(nf, jpgSave, true, Extension.LOWERCASE)
            app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
            f.remove();
    
    }
    var dcurrent = new Date();
    var dcDate = dcurrent.getFullYear() + '-' + (dcurrent.getMonth() + 1) + '-' + dcurrent.getDate();
    var dcTime = dcurrent.getHours() + ":" + dcurrent.getMinutes() + ":" + dcurrent.getSeconds();
    var ddateTime = dcDate + ' ' + dcTime;
    //app.backgroundColor = originalBGColor;
    log.writeln("End: " + ddateTime);
    return true;
}