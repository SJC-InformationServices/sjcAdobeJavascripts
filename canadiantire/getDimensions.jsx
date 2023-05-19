#target "photoshop";
app.displayDialogs = DialogModes.NO;

function getCropDimensions() {
    var dime={};
        for (var y = 0; y < app.activeDocument.pathItems.length; y++) {
            p = app.activeDocument.pathItems[y];
            if (p.name == "Path 1") {
                p.makeSelection(1, 1, SelectionType.REPLACE);
            }
        }

        var crop = app.activeDocument.selection.bounds.join("||").split("||");
        dime.cropX=parseFloat(crop[0]);
        dime.cropY=parseFloat(crop[1]);
        dime.cropEndX=parseFloat(crop[2]);
        dime.cropEndY=parseFloat(crop[3]);
        dime.cropWidth=dime.cropEndX-dime.cropX;
        dime.cropHeight=dime.cropEndY-dime.cropY;
        return dime;
    }

    var fw = 3500;
    var fh = 5250;
    var padding = 150;
    var minH=fh-(padding*2);
    var minW=fw-(padding*2);
    var doc = app.activeDocument;
    var w = parseFloat(doc.width);
    var h = parseFloat(doc.height);

    var getDim = getCropDimensions();

    var wRatio = minW/getDim.cropWidth ;
    var hRatio =  minH/getDim.cropHeight;
    
    if (wRatio < hRatio) {
        ratio = wRatio;
    } else {
        ratio = hRatio;
    }
    for(var i in getDim){
        alert(i +": "+getDim[i]);
    }
    
doc.resizeImage(w * ratio + "px",h * ratio + "px");
 var nCropEndX = (w*ratio)-(getDim.cropEndX*ratio)
    doc.crop([
        "0 px",
        getDim.cropY*ratio-padding+" px",
        -getDim.cropX*ratio+" px",
        getDim.cropEndY*ratio+padding+" px",
    ]
        );
