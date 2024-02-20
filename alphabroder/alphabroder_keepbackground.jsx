function alphabroderJPGBkgrd(log) {
    // Get the current date and time
    var current = new Date();
    var cDate = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
    var cTime = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
    var dateTime = cDate + ' ' + cTime;
    log.writeln("Start ALPHA Tire Square JPG PNG: " + dateTime);

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

    var fw = 1800;
    var fh = 1800;
    var padding = 35;
    var minH = fh - (padding * 2);
    var minW = fw - (padding * 2);

    var inFolder = Folder("\\\\10.3.0.39\\Alpha Broder\\HotFolders\\Alpha1800x1800x300dpi_35px_BKGD\\IN");
    var outFolder = Folder("\\\\10.3.0.39\\Alpha Broder\\HotFolders\\Alpha1800x1800x300dpi_35px_BKGD\\OUT");

    var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);

    for (var i = 0; i < files.length; i++) {
        f = files[i];
        try {

            try {
                app.open(f);
                var doc = app.activeDocument;
                
            } catch (e) {
                log.writeln("Failed to Open" + f.fullName);
                log.writeln("Error:"+e.line+" "+e.message);

                continue;
            }
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
            log.writeln("Height: " + doc.height);
            log.writeln("Width: " + doc.width);
            if (getDim.cropWidth > getDim.cropHeight) {
                log.writeln("Resize BY: Width");
                doc.resizeImage(w*ratio + "px");
                if (doc.height > parseInt(fh)) {
                    doc.resizeImage(null, fh + "px")
                }
            } else {
                log.writeln("Resize By: Height");
                doc.resizeImage(null, h * ratio + "px");
                if (doc.width > parseInt(fw)) {
                    doc.resizeImage(fw+"px");
                }
            }
      

            var getDimB = getCropDimensions();
            for(var i in getDimB){
                log.writeln("CropB " +i+":"+ getDimB[i]);
            }
            
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
            
            try {
                // Save the document as a JPEG file with the specified options
                var nf = File(outFolder + "\\" + app.activeDocument.name.split(".")[0] + ".jpg");
                var jpgSave = new JPEGSaveOptions();
                jpgSave.embedColorProfile = true;
                jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
                jpgSave.matte = MatteType.NONE;
                jpgSave.quality = 12;
                app.activeDocument.saveAs(nf, jpgSave, true, Extension.LOWERCASE);
            } catch (e) {
                app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
                log.writeln("FailedJPG: " + e.message);
                log.writeln("FailedJPG: " + f.name);
            }
          
        }catch (error) {
            log.writeln("Error:"+error.line+" "+error.message);
            app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);

        }
    
    }
    var dcurrent = new Date();
    var dcDate = dcurrent.getFullYear() + '-' + (dcurrent.getMonth() + 1) + '-' + dcurrent.getDate();
    var dcTime = dcurrent.getHours() + ":" + dcurrent.getMinutes() + ":" + dcurrent.getSeconds();
    var ddateTime = dcDate + ' ' + dcTime;

    log.writeln("End: " + ddateTime);
    return true;
}