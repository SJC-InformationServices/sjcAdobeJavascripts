function cdnTire3500jpgPngBkgrd(log) {
    // Get the current date and time
    var current = new Date();
    var cDate = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
    var cTime = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
    var dateTime = cDate + ' ' + cTime;
    log.writeln("Start CDN Tire Square JPG PNG: " + dateTime);

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

    var fw = 3500;
    var fh = 5250;
    var padding = 150;
    var minH = fh - (padding * 2);
    var minW = fw - (padding * 2);

    var inFolder = Folder("\\\\10.3.0.39\\Canadian Tire\\hotfolder\\3500x5250_png-jpg_cc\\In");
    var outFolder = Folder("\\\\10.3.0.39\\Canadian Tire\\hotfolder\\3500x5250_png-jpg_cc\\OUT");

    var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);

    for (var i = 0; i < files.length; i++) {
        
        try {

            try {
                f = files[i];
                
                f.copy(outFolder + "\\" + f.name);
            } catch (e) {
                log.writeln("Copy File Failed " + f.fullName);
                log.writeln("Error:"+e.line+" "+e.message);
                continue;
            }

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
            //doc.resizeImage(null, h * ratio + "px");
            //doc.resizeImage(w * ratio + "px");


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
            doc.resizeImage(null, fh + "px");
            
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
            try {
                // Remove all layers from the document using the removeLayers function defined earlier
                removeLayers(doc);

                // Loop over all path items and make a selection from Path 1, then invert and clear the selection
                for (var y = 0; y < doc.pathItems.length; y++) {
                    var p = doc.pathItems[y];
                    if (p.name == "Path 1") {
                        p.makeSelection(1, 1, SelectionType.REPLACE);
                        doc.selection.invert();

                        try {
                           // doc.selection.cut();
                        } catch (e) {
                            var idFl = charIDToTypeID("Fl  ");
                            var desc55 = new ActionDescriptor();
                            var idUsng = charIDToTypeID("Usng");
                            var idFlCn = charIDToTypeID("FlCn");
                            var idClr = charIDToTypeID("Clr ");
                            desc55.putEnumerated(idUsng, idFlCn, idClr);
                            var idClr = charIDToTypeID("Clr ");
                            var desc56 = new ActionDescriptor();
                            var idGry = charIDToTypeID("Gry ");
                            desc56.putDouble(idGry, 49.799997);
                            var idGrsc = charIDToTypeID("Grsc");
                            desc55.putObject(idClr, idGrsc, desc56);
                            var idOpct = charIDToTypeID("Opct");
                            var idPrc = charIDToTypeID("#Prc");
                            desc55.putUnitDouble(idOpct, idPrc, 100.000000);
                            var idMd = charIDToTypeID("Md  ");
                            var idBlnM = charIDToTypeID("BlnM");
                            var idClar = charIDToTypeID("Clar");
                            desc55.putEnumerated(idMd, idBlnM, idClar);
                           // executeAction(idFl, desc55, DialogModes.NO);
                        }
                    }
                }

                // Save the document as a PNG file with the specified options
                var nfpng = File(outFolder + "\\" + app.activeDocument.name.split(".")[0] + ".png");
                exportOptions = new ExportOptionsSaveForWeb();
                exportOptions.format = SaveDocumentType.PNG;
                exportOptions.PNG8 = false; // false = PNG-24
                exportOptions.transparency = true; // true = transparent
                exportOptions.interlaced = false; // true = interlacing on
                exportOptions.includeProfile = true; // false = don't embedd ICC profile
                app.activeDocument.exportDocument(nfpng, ExportType.SAVEFORWEB, exportOptions, Extension.LOWERCASE);
            } catch (e) {
                app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
                log.writeln("FailedPNG: " + e.message);
                log.writeln("FailedPNG: " + f.name);
            }

            // Close the document without saving changes
            app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);

            // Remove the original file from the input folder
            f.remove();

        } catch (error) {
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