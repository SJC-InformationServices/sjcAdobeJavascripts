app.preferences.rulerUnits = Units.PIXELS;
var doc = app.activeDocument;
var oldPath = activeDocument.path;

var outFolder = new Folder(oldPath + "/pngsfromlayers");
if (!outFolder.exists) {
    outFolder.create();
}

var layers = doc.artLayers;

for(var i =0; i<layers.length;i++) {
   /* var tlayers = doc.artLayers
    for(var y = 0; y<tlayers.length;y++)
    {
        doc.artLayers[y].visibile = false
    }
    doc.artLayers[i].visibile = true
    SavePNG(outFolder + "/" + doc.artLayers[i].name + ".png")*/
    layers[i].visibile = true;
    duplicateLayer = layers[i].duplicate();
    dimens = duplicateLayer.bounds;
    duplicateLayer.cut();
    newDoc = documents.add(dimens[2] - dimens[0], dimens[3] - dimens[1], 72,
                         'exportedLayer' + i, NewDocumentMode.RGB,
                         DocumentFill.TRANSPARENT);
    app.activeDocument = newDoc;
    newDoc.paste();
    /*var pngOpts = new ExportOptionsSaveForWeb; 
    pngOpts.format = SaveDocumentType.PNG
    pngOpts.PNG8 = false; 
    pngOpts.transparency = false; 
    pngOpts.interlaced = false; 
    pngOpts.quality = 100;
    activeDocument.exportDocument(new File(outFolder + "/" + layers[i].name + ".png"),ExportType.SAVEFORWEB,pngOpts);
    newDoc.close(SaveOptions.DONOTSAVECHANGES)
    */
   layers[i].visibile
    app.activeDocument = doc
}

