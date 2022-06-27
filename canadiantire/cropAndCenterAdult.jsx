#target "photoshop";
app.displayDialogs = DialogModes.NO;


    var fw = 3500;
    var fh = 5250;
    var padding = 450;

    var inFolder =  Folder("\\\\10.3.0.39\\Canadian Tire\\hotfolder\\JEN\\IN");
    var outFolder = Folder("\\\\10.3.0.39\\Canadian Tire\\hotfolder\\JEN\\OUT");
    var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);

    for(var i=0;i<files.length;i++)
    {
        try {

    f=files[i];
    app.open(f);

    try {

        var als = app.activeDocument.artLayers;
        for (var ii = 0; ii < als.length; ii++) {
            var al = als[ii];
            al.isBackgroundLayer = false;
            al.visible = true;
        }
        app.activeDocument.activeLayer = als[als.length - 1];
        app.activeDocument.flatten();
    } catch (e) {
        alert('flatten failed');
    }
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
    w = app.activeDocument.width;
    h = app.activeDocument.width;
    var crop = app.activeDocument.selection.bounds.join(",").split(",");

    var cx=parseFloat(crop[0].replace("px",""))-padding, 
    cy=parseFloat(crop[1].replace("px",""))-padding,
    cw=parseFloat(crop[2].replace("px",""))+padding, 
    ch=parseFloat(crop[3].replace("px",""))+padding; 
    
    var newCX = cx-((fw-(cw-cx))/2);
    var newCW = cw+((fw-(cw-cx))/2);
    var newCY = cy-((fh-(ch-cy))/2);
    var newCH = ch+((fh-(ch-cy))/2);

    app.activeDocument.selection.deselect();

    var bounds = [newCX+" px",newCY+" px",newCW+" px",newCH+" px"];
    app.activeDocument.crop(bounds);
    var jpgSave = new JPEGSaveOptions();
    jpgSave.embedColorProfile = true;
    jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
    jpgSave.matte = MatteType.NONE;
    jpgSave.quality = 12;

    var nf = File(outFolder +"\\"+ app.activeDocument.name);
    app.activeDocument.saveAs(nf,jpgSave,true,Extension.LOWERCASE);
    app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
    f.remove();
    }
    catch (error) {
        app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
        alert(error.message);
    }
} 