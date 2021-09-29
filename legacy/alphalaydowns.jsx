/**
 * @@@BUILDINFO@@@ cropandcenter-server.jsx !Version! Thu Jan 23 2020 18:02:45 GMT-0500
 */
function alphalaydowns() {
   
    var sourcePath = '\\\\10.3.0.39\\Alpha Broder\\AutoCrop1200x1500\\IN\\';
    var DestinationPath = '\\\\10.3.0.39\\Alpha Broder\\AutoCrop1200x1500\\OUT\\';
/*
    var sourcePath = 'C:\\Users\\KevinNoseworthy\\OneDrive - St Joseph Communications, Content Group\\Desktop\\CropAndCentreTest\\In\\';
    var DestinationPath = 'C:\\Users\\KevinNoseworthy\\OneDrive - St Joseph Communications, Content Group\\Desktop\\CropAndCentreTest\\Out\\';
*/
    var psdSaveOptions = new PhotoshopSaveOptions();
    psdSaveOptions.alphaChannels = true;
    psdSaveOptions.annotations = true;
    psdSaveOptions.embedColorProfile = true;
    psdSaveOptions.layers = true;

    var sized = "400px";
    var size_w = "1120px";
    var size_h = "1420px";

    var canvassize = "1500px";
    var canvaswidth = "1200px";
    var canvasheight = "1500px";

    var inFolder = Folder(sourcePath);
    var imgs = inFolder.getFiles(/\.(psd|tif|)$/i);
    
    for (var i = 0; i < imgs.length; i++) {

        try {
            var fPath = DestinationPath + imgs[i].name;
            var file = new File(fPath);
            imgs[i].copy(file)
            
            app.open(file);
            
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
                    p.makeSelection(1, 1, SelectionType.REPLACE);
                    doc.crop(doc.selection.bounds);
                    p.makeSelection(1, 1, SelectionType.REPLACE);
                    doc.selection.invert();
                    doc.selection.clear(); 
                    activePath = true;                 
                    }
                }
            

            if (!activePath) {
                doc.close(SaveOptions.DONOTSAVECHANGES);
                file.remove();
            } else { 
                doc.save();             
                //
                var w = doc.width;
                var h = doc.height;
                if (w > h) {
                    doc.resizeImage(size_w);
                    doc.save();
                    if (doc.height > parseInt(size_h.replace('px',''))) {
                        doc.resizeImage(null, size_h)
                    }
                } else {
                    doc.resizeImage(null, size_h);
                    doc.save();
                    if (doc.width > parseInt(size_w.replace('px',''))) {
                        doc.resizeImage(size_w);
                    }
                }


                doc.resizeCanvas(canvaswidth, canvasheight,AnchorPosition.MIDDLECENTER);
                for (var y = 0; y < clippaths.length; y++) {
                    p = clippaths[y];
                    if (p.name == 'Path 1') {
                        p.makeSelection(1, 1, SelectionType.REPLACE);
                        doc.selection.invert();
                        var colorRef = new SolidColor;
                        colorRef.rgb.red = 255;
                        colorRef.rgb.green = 255;
                        colorRef.rgb.blue = 255;
                        doc.selection.fill(colorRef);
                                      
                        }
                    }

                doc.close(SaveOptions.SAVECHANGES);
                imgs[i].remove();
            }
        } catch (e) {
            alert("Error" + e.message);
        }
    }
}