/**
 * @@@BUILDINFO@@@ cropandcenter-server.jsx !Version! Thu Jan 23 2020 18:02:45 GMT-0500
 */
function alphalaydowntrimmed() {
var white = new SolidColor();
white.rgb.hexValue = "FFFFFF";
app.backgroundColor=white;

    var sourcePath = '\\\\10.3.0.39\\Alpha Broder\\AutoCrop4x5_Trimmed\\In\\';
    var DestinationPath = '\\\\10.3.0.39\\Alpha Broder\\AutoCrop4x5_Trimmed\\Out\\';
    
    /*var sourcePath = 'C:\\Users\\KevinNoseworthy\\Desktop\\AutoCrop4x5AlignBottom\\In\\';
    var DestinationPath = 'C:\\Users\\KevinNoseworthy\\Desktop\\AutoCrop4x5AlignBottom\\Out\\';*/

    var psdSaveOptions = new PhotoshopSaveOptions();
    psdSaveOptions.alphaChannels = true;
    psdSaveOptions.annotations = true;
    psdSaveOptions.embedColorProfile = true;
    psdSaveOptions.layers = true;

    var jpgSave = new JPEGSaveOptions();
    jpgSave.embedColorProfile = true;
    jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
    jpgSave.matte = MatteType.NONE;
    jpgSave.quality = 12;

    var size_w = "1120px";
    var size_h = "1460px";

    var canvassize = "1500px";
    var canvaswidth = "1200px";
    var canvasheight = "1500px";

    var inFolder = Folder(sourcePath);
    var imgs = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);
    
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

            var clippaths = doc.pathItems;
            var p;
            var activePath = false;
            for (var y = 0; y < clippaths.length; y++) {
                p = clippaths[y];
                if (p.name == 'Path 1') {
                    p.makeSelection(3, true, SelectionType.REPLACE);
                    doc.crop(doc.selection.bounds);
                    p.makeSelection(3, true, SelectionType.REPLACE);
                    doc.selection.invert();
                    try{
                    doc.selection.clear(); 
                    } catch(e){
                        //doc.selection.cut();
                    }
                    activePath = true;                 
                    }
                }
            

            if (!activePath) {
                doc.close(SaveOptions.DONOTSAVECHANGES);
            } else { 

                var w = doc.width;
                var h = doc.height;
		doc.crop(["0 px","0 px", doc.width, doc.height*0.85]);
                    doc.resizeImage(null, size_h);
                    if (doc.width > parseInt(size_w.replace('px',''))) {
                        doc.resizeImage(size_w);
                    }              


                doc.resizeCanvas(canvaswidth, canvasheight,AnchorPosition.BOTTOMCENTER);
                                
                    if(doc.name.substr(-3) == 'jpg')
                    {
                        var saveop = jpgSave;
                    }
                    else
                    {
                        var saveop = psdSaveOptions;
                    }
                activeDocument.saveAs(file, saveop, true, Extension.LOWERCASE);
                doc.close(SaveOptions.SAVECHANGES);
                f.remove();
            }
        } catch (e) {
            //alert("Error" + e.message);
           
            continue;
        }
    }
    return;
}