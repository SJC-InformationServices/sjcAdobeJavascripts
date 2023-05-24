function cdnTire3500x5250SquareJpgPng(log) {
    // Get the current date and time
    var current = new Date();
    var cDate = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
    var cTime = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
    var dateTime = cDate + ' ' + cTime;
    log.writeln("Start CDN Tire JPG PNG: " + dateTime);
    // Set some variables for the image size and padding
    var fw = 3500;
    var fh = 5250;
    var padding = 150;
    var minH = fh - (padding * 2);
    var minW = fw - (padding * 2);

    // Set the input and output folders
    var inFolder = Folder("\\\\10.3.0.39\\Canadian Tire\\hotfolder\\3500x5250_png-jpg\\In");
    var outFolder = Folder("\\\\10.3.0.39\\Canadian Tire\\hotfolder\\3500x5250_png-jpg\\Out");

    // Function to remove layers from a layer set
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

    // Get all files in the input folder that match the specified file types
    var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);
    
    log.writeln("TotalFiles: " + files.length);

    // Loop over all files in the input folder
    for (var i = 0; i < files.length; i++) {
        try {
            try{
                f = files[i];
                
                f.copy(outFolder + "\\" + f.name);
                } catch(e){
                    alert(e.message);
                    log.writeln("Copy File Failed "+ f.fullName);
                }
            
            try{    app.open(f);
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
        }catch(e){
            log.writeln("Failed to Open "+ f.fullName);
            alert(e.message);
            continue
        }
            // Resize the image to the specified dimensions
            doc.resizeImage(fw + "px", fh + "px");

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
                        doc.selection.clear();
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

        } catch (e) {

            app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
            log.writeln("FailedOpen: " + f.name);

        }
    }

    // Get the current date and time again at the end of processing all files
    var dcurrent = new Date();
    var dcDate = dcurrent.getFullYear() + '-' + (dcurrent.getMonth() + 1) + '-' + dcurrent.getDate();
    var dcTime = dcurrent.getHours() + ":" + dcurrent.getMinutes() + ":" + dcurrent.getSeconds();
    var ddateTime = dcDate + ' ' + dcTime;

    log.writeln("End: " + ddateTime);

    return true;
}
