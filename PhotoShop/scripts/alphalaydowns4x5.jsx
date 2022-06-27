/**
 * @@@BUILDINFO@@@ cropandcenter-server.jsx !Version! Thu Jan 23 2020 18:02:45 GMT-0500
 */
function alphalaydownalt() {

    var sourcePath = '\\\\10.3.0.39\\Alpha Broder\\AutoCrop4x5\\IN\\';
    var DestinationPath = '\\\\10.3.0.39\\Alpha Broder\\AutoCrop4x5\\OUT\\';
/*
    var sourcePath = 'C:\\Users\\KevinNoseworthy\\OneDrive - St Joseph Communications, Content Group\\Desktop\\CropAndCentreTest\\In\\';
    var DestinationPath = 'C:\\Users\\KevinNoseworthy\\OneDrive - St Joseph Communications, Content Group\\Desktop\\CropAndCentreTest\\Out\\';
*/
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
    var size_h = "1420px";

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
            
	            doc.flatten();
            var als = doc.layers;
	    
            for (var ii = 0; ii < als.length; ii++) {
                var al = als[ii];
		al.allLocked = false;
                al.isBackgroundLayer = false;
                al.visible = true;
            }
            doc.activeLayer = als[als.length - 1];
            var p=doc.pathItems.getByName("Path 1");

                    p.makeSelection(1, 1, SelectionType.REPLACE);
                    doc.crop(doc.selection.bounds);
                    p.makeSelection(1, 1, SelectionType.REPLACE);
                    doc.selection.invert();
                    try{
                    doc.selection.clear(); 
                    } catch(e){
                        doc.selection.cut();
                    }           

                var w = doc.width;
                var h = doc.height;
                if (parseInt(w) > parseInt(h)) {
                    doc.resizeImage(size_w);
                    if (doc.height > parseInt(size_h.replace('px',''))) {
                        doc.resizeImage(null, size_h)
                    }
                } else {
                    doc.resizeImage(null, size_h);
                    if (doc.width > parseInt(size_w.replace('px',''))) {
                        doc.resizeImage(size_w);
                    }
                }


                doc.resizeCanvas(canvaswidth, canvasheight,AnchorPosition.MIDDLECENTER);
		p=doc.pathItems.getByName("Path 1");
               
                        p.makeSelection(1, 1, SelectionType.REPLACE);
                        doc.selection.invert();
                        var colorRef = new SolidColor;
                        colorRef.rgb.red = 255;
                        colorRef.rgb.green = 255;
                        colorRef.rgb.blue = 255;
                        doc.selection.fill(colorRef);
                                      
                     
                    if(doc.name.substr(-3) == 'jpg')
                    {
                        var saveop = jpgSave;
                    }
                    else
                    {
                        var saveop = psdSaveOptions;
                    }
                activeDocument.saveAs(file, saveop, true, Extension.LOWERCASE);
doc.close(SaveOptions.DONOTSAVECHANGES);
                f.remove();
            
        } catch (e) {
           alert("Error" + e.message);
                           doc.close(SaveOptions.DONOTSAVECHANGES);
            continue;
        }
    }
    return;
}