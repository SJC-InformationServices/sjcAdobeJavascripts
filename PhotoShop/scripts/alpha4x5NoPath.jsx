

function magicWand(x,y,t,a,c,s) {
    if(arguments.length < 2) return;// make sure have x,y
    if(undefined == t) var t = 35;// set defaults of optional arguments
    if(undefined == a) var a = true;
    if(undefined == c) var c = false;
     if(undefined == s) var s = false;
    var desc = new ActionDescriptor();
        var ref = new ActionReference();
        ref.putProperty( charIDToTypeID('Chnl'), charIDToTypeID('fsel') );
    desc.putReference( charIDToTypeID('null'), ref );
        var positionDesc = new ActionDescriptor();
        positionDesc.putUnitDouble( charIDToTypeID('Hrzn'), charIDToTypeID('#Rlt'), x );// in pixels
        positionDesc.putUnitDouble( charIDToTypeID('Vrtc'), charIDToTypeID('#Rlt'), y );
    desc.putObject( charIDToTypeID('T   '), charIDToTypeID('Pnt '), positionDesc );
    desc.putInteger( charIDToTypeID('Tlrn'), t);// tolerance
    desc.putBoolean( charIDToTypeID('Mrgd'), s );// sample all layers
    if(!c) desc.putBoolean( charIDToTypeID( "Cntg" ), false );//  contiguous
    desc.putBoolean( charIDToTypeID('AntA'), a );// anti-alias
    executeAction( charIDToTypeID('setd'), desc, DialogModes.NO );
};

function alphaCropNoClipPath() {

var sourcePath = '\\\\10.3.0.39\\Alpha Broder\\AutoCrop4x5NoPaths\\IN\\';
var DestinationPath = '\\\\10.3.0.39\\Alpha Broder\\AutoCrop4x5NoPaths\\OUT\\';

/*var sourcePath = "C:\\Users\\KevinNoseworthy\\OneDrive - St Joseph Communications, Content Group\\Documents\\GitHub\\photoshopscripts\\samples\\";
var DestinationPath = "C:\\Users\\KevinNoseworthy\\OneDrive - St Joseph Communications, Content Group\\Documents\\GitHub\\photoshopscripts\\samples\\";*/

var jpgSave = new JPEGSaveOptions();
    jpgSave.embedColorProfile = true;
    jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
    jpgSave.matte = MatteType.NONE;
    jpgSave.quality = 12;

    var size_w = "1120px";
    var size_h = "1420px";

    var canvassize = "1500px";
    var canvaswidth = "1200px";
    var canvasheight = "1500px";
    var inFolder = Folder(sourcePath);
    var imgs = inFolder.getFiles(/\.(psd|tif|tiff|)$/i);
    
    for (var i = 0; i < imgs.length; i++) {

        try {
            var f = imgs[i];
            var fPath = DestinationPath + imgs[i].name;
            var file = new File(fPath);
            var ext = f.name.split(".")[1];            
            app.open(f);
            
            var doc = app.activeDocument;
            var als = doc.artLayers;
            for (var ii = 0; ii < als.length; ii++) {
                var al = als[ii];
                al.isBackgroundLayer = false;
                al.visible = true;
            }
            doc.activeLayer = als[als.length - 1];
            doc.flatten();

var mw = magicWand(5,5,3,true,true,false);

var selection = doc.selection.invert();

doc.crop(doc.selection.bounds);
doc.crop(["0 px","0 px", doc.width, doc.height*0.62]);

var mw = magicWand(5,5,3,true,true,false);

var selection = doc.selection.invert();

doc.crop(doc.selection.bounds);

            var w = doc.width;
                var h = doc.height;
                if (w > h) {
                    doc.resizeImage(size_w);
                    if (doc.height > parseInt(size_h.replace('px',''))) {
                        doc.resizeImage(null, size_h)
                    }
                } else {
                    doc.resizeImage(null, size_h);
                    if (doc.width > parseInt(size_w.replace('px',''))) {
                        doc.resizeImage(size_w);
                    }}
doc.resizeCanvas(canvaswidth, canvasheight,AnchorPosition.BOTTOMCENTER);
/*
p.makeSelection(1, 1, SelectionType.REPLACE);
                        doc.selection.invert();
                        var colorRef = new SolidColor;
                        colorRef.rgb.red = 255;
                        colorRef.rgb.green = 255;
                        colorRef.rgb.blue = 255;
                        doc.selection.fill(colorRef);*/

                        app.activeDocument.saveAs(file, jpgSave, true, Extension.LOWERCASE);
                        app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
                    } catch (e) {
                        //alert("Error" + e.message);
                       for(i in e){
                           alert(i + "\r\n" + e[i]);
                           
                       }
                        continue;

                    }
    }
    return;
}
