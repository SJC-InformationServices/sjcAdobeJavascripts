function cdnTire3500x5250SquareJpgPng() {

    var fw = 3500;
    var fh = 5250;
    var padding = 150;
    var minH = fh - (padding * 2);
    var minW = fw - (padding * 2);

    var inFolder = Folder("//10.3.0.39/Canadian Tire/hotfolder/3500x5250_png-jpg/In");
    var outFolder = Folder("//10.3.0.39/Canadian Tire/hotfolder/3500x5250_png-jpg/OUT");
    /*var inFolder = Folder.selectDialog("Select Source Folder");
    var outFolder = Folder.selectDialog("Select Out Folder");*/

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
    var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);

    for (var i = 0; i < files.length; i++) {
        try {

            f = files[i];
            f.copy(outFolder + "/" + f.name);
            app.open(f);
            var doc = app.activeDocument;
            var w = parseFloat(doc.width);
            var h = parseFloat(doc.height);
            var als = doc.artLayers;

            for (var ii = 0; ii < als.length; ii++) {
                var al = als[ii];
                al.isBackgroundLayer = false;
                al.visible = true;
            }
            doc.resizeImage(fw + "px", fh + "px");

            try {


                var nf = File(outFolder + "/" + app.activeDocument.name.split(".")[0] + ".jpg");
                var jpgSave = new JPEGSaveOptions();
                jpgSave.embedColorProfile = true;
                jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
                jpgSave.matte = MatteType.NONE;
                jpgSave.quality = 12;
                app.activeDocument.saveAs(nf, jpgSave, true, Extension.LOWERCASE);
            } catch (e) {

            }
            try {
                removeLayers(doc);

                for (var y = 0; y < doc.pathItems.length; y++) {
                    var p = doc.pathItems[y];
                    if (p.name == "Path 1") {
                        p.makeSelection(1, 1, SelectionType.REPLACE);
                        doc.selection.invert();
                        doc.selection.clear();
                    }
                }

                var nfpng = File(outFolder + "/" + app.activeDocument.name.split(".")[0] + ".png");
                exportOptions = new ExportOptionsSaveForWeb();
                exportOptions.format = SaveDocumentType.PNG;
                exportOptions.PNG8 = false; // false = PNG-24
                exportOptions.transparency = true; // true = transparent
                exportOptions.interlaced = false; // true = interlacing on
                exportOptions.includeProfile = true; // false = don't embedd ICC profile
                app.activeDocument.exportDocument(nfpng, ExportType.SAVEFORWEB, exportOptions, Extension.LOWERCASE);
            } catch (e) {

            }
            app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);

            f.remove();

        } catch (e) {

            app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);

        }
    }
    return true;
}
