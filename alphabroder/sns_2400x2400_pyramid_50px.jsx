function snsPngBkgrd2400(log) {
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

    function getCropDimensions() {
        var dime = {};
        for (var y = 0; y < app.activeDocument.pathItems.length; y++) {
            p = app.activeDocument.pathItems[y];
            if (p.name == "Path 1") {
                p.makeSelection(1, 1, SelectionType.REPLACE);
            }
        }

        var crop = app.activeDocument.selection.bounds.join("||").split("||");
        dime.cropX = parseFloat(crop[0]);
        dime.cropY = parseFloat(crop[1]);
        dime.cropEndX = parseFloat(crop[2]);
        dime.cropEndY = parseFloat(crop[3]);
        dime.cropWidth = dime.cropEndX - dime.cropX;
        dime.cropHeight = dime.cropEndY - dime.cropY;
        return dime;
    }
    var originalBGColor = app.backgroundColor;
    var grey = " 4c 3m 3y";
    var cmykColor = new SolidColor();
        cmykColor.cmyk.cyan = 4;
        cmykColor.cmyk.magenta = 3;
        cmykColor.cmyk.yellow = 3;
        cmykColor.cmyk.black = 0;
       // app.backgroundColor = cmykColor;

    var fw = 2400;
    var fh = 2400;
    var padding = 75;
    var minH = fh - (padding * 2);
    var minW = fw - (padding * 2);

    var inFolder = Folder("\\\\10.3.0.39\\Alpha Broder\\HotFolders\\SNS_2400x2400_KeepBkgd_50px_png\\IN");
    var outFolder = Folder("\\\\10.3.0.39\\Alpha Broder\\HotFolders\\SNS_2400x2400_KeepBkgd_50px_png\\Out");

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
            log.writeln("Height: " + doc.height);
            log.writeln("Width: " + doc.width);
            
            doc.resizeImage(fw+"px", fh + "px");
            doc.resizeImage(undefined,undefined,300,ResampleMethod.NONE);
            
            /*var artLayer = doc.artLayers.add();
artLayer.name = "Background Fill";
doc.selection.selectAll();
doc.selection.fill(cmykColor);
doc.selection.deselect();

// Move the new layer to the bottom
artLayer.move(doc.artLayers[doc.artLayers.length - 1], ElementPlacement.PLACEAFTER);*/
doc.flatten();
            
doc.resizeImage(fw+"px", fh + "px");
doc.resizeImage(undefined,undefined,300,ResampleMethod.NONE);
                // Save the document as a JPEG file with the specified options
                var nf = File(outFolder + "\\" + app.activeDocument.name.split(".")[0] + ".png");
               /* var exportOptions = new ExportOptionsSaveForWeb();
                exportOptions.format = SaveDocumentType.PNG;
                exportOptions.PNG8 = false; // Set to true for PNG-8, false for PNG-24
                exportOptions.transparency = true;
                exportOptions.interlaced = false;
                exportOptions.quality = 100;
                app.activeDocument.exportDocument(nf, ExportType.SAVEFORWEB, exportOptions);*/
                doc.saveAs(nf, new PNGSaveOptions(), true, Extension.LOWERCASE)
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