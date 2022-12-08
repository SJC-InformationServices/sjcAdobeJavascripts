
function cdnTire3500jpgBkgrd(){
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
            this.error(e,"magicWand");
        }
    }
    var fw = 3500;
    var fh = 5250;
    var padding = 75;
    var minH = fh - (padding * 2);
    var minW = fw - (padding * 2);
    
    var inFolder =  Folder("\\\\10.3.0.39\\Canadian Tire\\hotfolder\\3500x5250_png-jpg\\In");
    var outFolder = Folder("\\\\10.3.0.39\\Canadian Tire\\hotfolder\\3500x5250_png-jpg\\OUT");
    /*var inFolder = Folder.selectDialog("Select Source Folder");
    var outFolder = Folder.selectDialog("Select Out Folder");*/
    
    
    var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);
    
    for (var i = 0; i < files.length; i++) {
        try {
    
            f = files[i];
            app.open(f);
            var doc = app.activeDocument;
            var w = parseFloat(doc.width);
            var h = parseFloat(doc.height);
            var als = doc.artLayers;
        for (var ii = 0; ii < als.length; ii++) {
            var al = als[ii];
            if (al.isBackgroundLayer || al.name=="Background") {
                al.remove();
            }
        }

    try {
        var mw = magicWand(5, 5, 1, true, true, true);
        doc.selection.invert();
    for(var y=0;y<app.activeDocument.pathItems.length;y++)
    {
        p=app.activeDocument.pathItems[y];
        if(p.name == "Path 1")
        {
        p.makeSelection(1, 1, SelectionType.EXTEND);
        }
    }}
    catch(e){
        
    }

var crop = app.activeDocument.selection.bounds.join(",").split(",");

var objWidth = parseFloat(crop[2].replace("px",""))-parseFloat(crop[0].replace("px",""));
var objHeight = parseFloat(crop[3].replace("px",""))-parseFloat(crop[1].replace("px",""));

if (objWidth > objHeight)
{
    var ratio = minW/objWidth;
    doc.resizeImage(w*ratio+"px");
} else {
    var ratio = minH/objHeight;
    doc.resizeImage(null,h*ratio+"px");
}

var newBounds = [];
var str = [w,h,objWidth,objHeight,minW,minH,ratio];
var mw = magicWand(5, 5, 1, true, true, true);
doc.selection.invert();

for(var y=0;y<app.activeDocument.pathItems.length;y++)
{
p=app.activeDocument.pathItems[y];
if(p.name == "Path 1")
{
p.makeSelection(1, 1, SelectionType.EXTEND);

}
}
var nCrop = app.activeDocument.selection.bounds.join(",").split(",");
var nBounds = [
    parseFloat(nCrop[0].replace("px",""))-padding,
    parseFloat(nCrop[1].replace("px",""))-padding,
    parseFloat(nCrop[2].replace("px",""))+padding,
    parseFloat(nCrop[3].replace("px",""))+padding
];
if((nBounds[2]-nBounds[0])>minW)
{
    var nRatio=minW/(nBounds[2]-nBounds[0]);
    doc.resizeImage(doc.width*nRatio);
}
if((nBounds[3]-nBounds[1])>minH) {
    var nRatio=minH/(nBounds[3]-nBounds[1]);
    doc.resizeImage(doc.width*nRatio);
}

//doc.crop(nBounds);
doc.resizeCanvas(fw, fh, AnchorPosition.MIDDLECENTER);
//alert(crop.join(",")+":::"+nCrop+":::"+str.join(", "));

var fillLayer = als.add();
fillLayer.name="Fill";
doc.selection.selectAll();
var colorRef=new SolidColor;
colorRef.cmyk.cyan="8";
colorRef.cmyk.magenta="6";
colorRef.cmyk.yellow="6";
colorRef.cmyk.black="0";
doc.selection.fill(colorRef);
fillLayer.move(als[als.length-1],ElementPlacement.PLACEAFTER);
doc.flatten();    

            var nf = File(outFolder +"\\"+ app.activeDocument.name.split(".")[0]+".jpg");
            var jpgSave = new JPEGSaveOptions();
                jpgSave.embedColorProfile = true;
                jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
                jpgSave.matte = MatteType.NONE;
                jpgSave.quality = 12;
                app.activeDocument.saveAs(nf, jpgSave, true, Extension.LOWERCASE);
                app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
                f.copy(outFolder + "\\" + f.name);
                f.remove();
        } catch (error) {
            //alert("Error:"+error.line+" "+error.message);
            app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
            return false;
        }
    }
    return true;}
    
    