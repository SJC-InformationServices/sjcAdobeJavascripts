 function magicWand (x, y, t, a, c, s) {
    try{
    if (arguments.length < 2) return; // make sure have x,y
    if (undefined == t) var t = 35; // set defaults of optional arguments
    if (undefined == a) var a = true;
    if (undefined == c) var c = false;
    if (undefined == s) var s = false;
    var desc = new ActionDescriptor();
    var ref = new ActionReference();
    ref.putProperty(charIDToTypeID('Chnl'), charIDToTypeID('fsel'));
    desc.putReference(charIDToTypeID('null'), ref);
    var positionDesc = new ActionDescriptor();
    positionDesc.putUnitDouble(charIDToTypeID('Hrzn'), charIDToTypeID('#Rlt'), x); // in pixels
    positionDesc.putUnitDouble(charIDToTypeID('Vrtc'), charIDToTypeID('#Rlt'), y);
    desc.putObject(charIDToTypeID('T   '), charIDToTypeID('Pnt '), positionDesc);
    desc.putInteger(charIDToTypeID('Tlrn'), t); // tolerance
    desc.putBoolean(charIDToTypeID('Mrgd'), s); // sample all layers
    if (!c) desc.putBoolean(charIDToTypeID("Cntg"), false); //  contiguous
    desc.putBoolean(charIDToTypeID('AntA'), a); // anti-alias
    executeAction(charIDToTypeID('setd'), desc, DialogModes.NO);
    }catch(e){
        alert(e.message);
    }
    }

    function getCropDimensions() {
        var dime = {};
        /*for (var y = 0; y < app.activeDocument.pathItems.length; y++) {
            p = app.activeDocument.pathItems[y];
            if (p.name == "Path 1") {
                p.makeSelection(1, 1, SelectionType.REPLACE);
            }
        }*/
        //var mw = magicWand(5, 5, 1, true, true, true);
        //doc.selection.invert();

        var crop = app.activeDocument.selection.bounds.join("||").split("||");
        dime.cropX = parseFloat(crop[0]);
        dime.cropY = parseFloat(crop[1]);
        dime.cropEndX = parseFloat(crop[2]);
        dime.cropEndY = parseFloat(crop[3]);
        dime.cropWidth = dime.cropEndX - dime.cropX;
        dime.cropHeight = dime.cropEndY - dime.cropY;
        return dime;
    }
var fw = 3000;
    var fh = 3000;
    var padding = 50;
    var minH = fh - (padding * 2);
    var minW = fw - (padding * 2);
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
            var mw = magicWand(5,5,1,true,true,true);
                doc.selection.invert();
            var getDim = getCropDimensions();

            var ratio = Math.min(minW / getDim.cropWidth, minH / getDim.cropHeight);
            
            if (getDim.cropWidth > getDim.cropHeight) {
                alert("Resize BY: Width");
                doc.resizeImage(w*ratio + "px");
                /*if (doc.height > parseInt(fh)) {
                    doc.resizeImage(null, fh + "px")
                }*/
            } else {
                alert("Resize By: Height");
                doc.resizeImage(null, h * ratio + "px");
                /*if (doc.width > parseInt(fw)) {
                    doc.resizeImage(fw+"px");
                }*/
            }
  var mw = magicWand(5,5,1,true,true,true);
                doc.selection.invert();
               var getDimB = getCropDimensions();
            
            
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
            ])
            doc.resizeCanvas(fw, fh, AnchorPosition.MIDDLECENTER);
            var fillLayer = als.add();
fillLayer.name="Fill";
doc.selection.selectAll();
var colorRef=new SolidColor;
colorRef.cmyk.cyan="0";
colorRef.cmyk.magenta="0";
colorRef.cmyk.yellow="0";
colorRef.cmyk.black="0";
doc.selection.fill(colorRef);
fillLayer.move(als[als.length-1],ElementPlacement.PLACEAFTER);