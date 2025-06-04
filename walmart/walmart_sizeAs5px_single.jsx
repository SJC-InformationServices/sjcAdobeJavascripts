

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
            
            /*if (getDimB.cropWidth < getDimB.cropHeight) {
                var newY = getDimB.cropY - padding + " px";
                var newEndY = getDimB.cropEndY + padding + " px";

                var offSet = (fw - getDimB.cropWidth) / 2;

                var newX = getDimB.cropX - offSet + " px";
                var newEndX = getDimB.cropEndX + offSet + " px";
                
            } else {
                var newX = getDimB.cropX - padding + " px";
                var newEndX = getDimB.cropEndX + padding + " px";

                var offSet = (fh  - getDimB.cropHeight) / 2;
                var newY = getDimB.cropY - offSet + " px";
                var newEndY = getDimB.cropEndY + offSet + " px";

                
            }*/

            doc.crop([
                newX,
                newY,
                newEndX,
                newEndY
            ]);
            
            
            //doc.resizeCanvas(getDim.cropWidth+50+"px",getDim.cropHeight+50+"px")
          
          
            //app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
            //f.remove();
    