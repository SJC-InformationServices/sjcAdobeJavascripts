function cdnTire3500png() {

    function getCropDimensions() {
        for (var y = 0; y < app.activeDocument.pathItems.length; y++) {
            p = app.activeDocument.pathItems[y];
            if (p.name == "Path 1") {
                p.makeSelection(1, 1, SelectionType.REPLACE);
            }
        }
        var crop = app.activeDocument.selection.bounds.join("||").split("||");
        return crop;
    }

    var fw = 3500;
    var fh = 5250;
    var padding = 150;
    var minH = fh - (padding * 2);
    var minW = fw - (padding * 2);

    var inFolder = Folder("\\\\10.3.0.39\\Canadian Tire\\hotfolder\\3500x5250_png-jpg\\In");
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
                if (al.isBackgroundLayer) {
                    al.isBackgroundLayer = false;
                }
                if (al.name.toUpperCase() != "LAYER 1") {
                    al.remove();
                }
            }

            var crop = getCropDimensions();

            var objWidth = parseFloat(crop[2].replace("px", "")) - parseFloat(crop[0].replace("px", ""));
            var objHeight = parseFloat(crop[3].replace("px", "")) - parseFloat(crop[1].replace("px", ""));
            var ratio;
            if (objWidth > objHeight) {
                ratio = minW / objWidth;
                doc.resizeImage(w * ratio + "px");
            } else {
                ratio = minH / objHeight;
                doc.resizeImage(null, h * ratio + "px");
            }
            var cropb = getCropDimensions();

            var nObjWidth = parseFloat(cropb[2].replace("px", "")) - parseFloat(cropb[0].replace("px", ""));
            var nObjHeight = parseFloat(cropb[3].replace("px", "")) - parseFloat(cropb[1].replace("px", ""));

            var nw = parseFloat(doc.width);
            var nh = parseFloat(doc.height);

            //Enough Width
            var eW = (parseFloat(cropb[2].replace("px", "")) + parseFloat(cropb[0].replace("px", "")) + padding) - nw;
            //Enough Height
            var eH = (parseFloat(cropb[3].replace("px", "")) + parseFloat(cropb[1].replace("px", "")) + padding) - nh;

            if (eW > 0 || eH > 0) {
                var resizeHeight = eH > 0 ? nh + eH : nh;
                var resizeWidth = eW > 0 ? nw + eW : nw;

                doc.resizeCanvas(resizeWidth + "px", resizeHeight + "px", AnchorPosition.TOPLEFT);
            }
            var cropc = getCropDimensions();
            var nCrop = [
                parseFloat(cropc[0].replace("px", "")) - padding + " px",
                parseFloat(cropc[1].replace("px", "")) - padding + " px",
                parseFloat(cropc[2].replace("px", "")) + padding + " px",
                parseFloat(cropc[3].replace("px", "")) + padding + " px",
            ];
            doc.selection.deselect();
            //alert(cropc.join('\r\n')+"\r\n"+[doc.width,doc.height].join("\r\n")+"\r\n"+nCrop.join("\r\n"));
            doc.crop(nCrop);
            doc.resizeCanvas(fw, fh, AnchorPosition.MIDDLECENTER);
            var nfpng = File(outFolder + "\\" + app.activeDocument.name.split(".")[0] + ".png");
            exportOptions = new ExportOptionsSaveForWeb();
            exportOptions.format = SaveDocumentType.PNG;
            exportOptions.PNG8 = false; // false = PNG-24
            exportOptions.transparency = true; // true = transparent
            exportOptions.interlaced = false; // true = interlacing on
            exportOptions.includeProfile = true; // false = don't embedd ICC profile
            app.activeDocument.exportDocument(nfpng, ExportType.SAVEFORWEB, exportOptions, Extension.LOWERCASE);

        } catch (error) {
            //alert("Error:"+error.line+" "+error.message);
            app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
            continue;
        }
    }
    return true;
}
