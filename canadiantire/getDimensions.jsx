#target "photoshop";
app.displayDialogs = DialogModes.NO;


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
var doc = app.activeDocument;
var w = parseFloat(doc.width);
var h = parseFloat(doc.height);

var getDim = getCropDimensions();
try{
var ratio = Math.min(minW / getDim.cropWidth, minH / getDim.cropHeight);

doc.resizeImage(w * ratio + "px", h * ratio + "px");
var getDimB = getCropDimensions();
/*for(var i in getDimB){
    alert(i +": "+getDimB[i]);
}*/

if (getDimB.cropWidth < getDimB.cropHeight) {
    var newY=getDimB.cropY - padding + " px";
    var newEndY=getDimB.cropEndY+padding+ " px";

    var offSet = ((fw-padding*2)-getDimB.cropWidth)/2;

    var newX = getDimB.cropX-offSet+ " px";
    var newEndX =getDimB.cropEndX+offSet+ " px";
    var newC=[newY,newEndY,offSet,newX,newEndX];
} else {
    
    var newX = getDimB.cropX - padding + " px";
    var newEndX = getDimB.cropEndX + padding + " px";

    var offSet = ((fh - padding * 2) - getDimB.cropHeight) / 2;
    var newY = getDimB.cropY - offSet + " px";
    var newEndY = getDimB.cropEndY + offSet + " px";
    
    var newC = [newY, newEndY, offSet, newX, newEndX];
}
/*
for(var i in getDimB){
    alert(i +": "+getDimB[i]);
}
for(var i=0;i<newC.length;i++){
    alert(i +": "+newC[i]);
}*/


    doc.crop([
        newX,
        newY,
        newEndX,
        newEndY
    ]
        );




        
} catch(e){
    alert(e.message);
}
