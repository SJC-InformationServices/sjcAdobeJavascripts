function walmart_sizeAs5px(log) {
    // Get the current date and time
    var current = new Date();
    var cDate = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
    var cTime = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
    var dateTime = cDate + ' ' + cTime;
    log.writeln("Walmart_sizeAs5px" + dateTime);

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

    var inFolder = Folder("\\\\10.136.209.199\\Walmart Assets\\HotFolders\\WalmartCrop20px\\IN");
    var outFolder = Folder("\\\\10.136.209.199\\Walmart Assets\\HotFolders\\WalmartCrop20px\\Out");

    var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);

    
    log.writeln("Total Files: " + files.length);
    for (var i = 0; i < files.length; i++) {

        f = files[i];
        log.writeln(i +":"+f.fullName);
           
                try {
                    app.open(f);
               var doc = app.activeDocument;
                
            var fw = parseFloat(doc.width);
            var fh = parseFloat(doc.height);

            var padding = 20;
            var minH = fh - (padding * 2);
            var minW = fw - (padding * 2);
            
            var w = parseFloat(doc.width);
            var h = parseFloat(doc.height);
            var als = doc.artLayers;

                // Loop over all art layers and make them visible and not background layers
                for (var ii = 0; ii < als.length; ii++) {
                    var al = als[ii];
                    al.isBackgroundLayer = false;
                    al.visible = true;
                }
                doc.flatten();
        
              var getDimB = getCropDimensions();
            
              var newY = getDimB.cropY - padding + " px";
                var newEndY = getDimB.cropEndY + padding + " px";
                var newX = getDimB.cropX - padding + " px";
                var newEndX = getDimB.cropEndX + padding + " px";
            
            doc.crop([
                newX,
                newY,
                newEndX,
                newEndY
            ]);           
            
            
            var nf = File(outFolder + "\\" + app.activeDocument.name);
            app.activeDocument.close(SaveOptions.SAVECHANGES);   
            f.copy(nf);            
            f.remove();}catch (e) {
                log.writeln("Error" + e.message);
                app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
            }
    
    }
    var dcurrent = new Date();
    var dcDate = dcurrent.getFullYear() + '-' + (dcurrent.getMonth() + 1) + '-' + dcurrent.getDate();
    var dcTime = dcurrent.getHours() + ":" + dcurrent.getMinutes() + ":" + dcurrent.getSeconds();
    var ddateTime = dcDate + ' ' + dcTime;
    //app.backgroundColor = originalBGColor;
    log.writeln("End: " + ddateTime);
    return true;
}