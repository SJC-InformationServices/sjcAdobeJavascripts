#target "photoshop";
app.displayDialogs = DialogModes.NO;

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
try {
    var fw = 3500;
    var fh = 5250;
    var padding = 450;
    var paddingTop = 750;
    w = app.activeDocument.width;
    h = app.activeDocument.width;
    var crop = app.activeDocument.selection.bounds.join(",").split(",");

    var cx=parseFloat(crop[0].replace("px",""))-padding, 
    cy=parseFloat(crop[1].replace("px",""))-paddingTop,
    cw=parseFloat(crop[2].replace("px",""))+padding, 
    ch=parseFloat(crop[3].replace("px",""))+padding; 
    

    var newCX = cx-((fw-(cw-cx))/2);
    var newCW = cw+((fw-(cw-cx))/2);
    var newCY = cy-((fh-(ch-cy))/2);
    var newCH = ch+((fh-(ch-cy))/2);

    
    app.activeDocument.selection.deselect();

    var bounds = [newCX+" px",newCY+" px",newCW+" px",newCH+" px"];
    
    app.activeDocument.crop(bounds);
} catch (error) {
    alert(error.message);
}