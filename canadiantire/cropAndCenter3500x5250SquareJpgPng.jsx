
function cdnTire3500x5250SquareJpgPng(){
    
    var fw = 3500;
    var fh = 5250;
    var padding = 150;
    var minH=fh-(padding*2);
    var minW=fw-(padding*2);
    
    var inFolder =  Folder("//10.3.0.39/Canadian Tire/hotfolder/3500x5250_png-jpg/In");
    var outFolder = Folder("//10.3.0.39/Canadian Tire/hotfolder/3500x5250_png-jpg/OUT");
    /*var inFolder = Folder.selectDialog("Select Source Folder");
    var outFolder = Folder.selectDialog("Select Out Folder");*/
    
    
    var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);
    
    for (var i = 0; i < files.length; i++) {
        try {
    
            f = files[i];
            f.copy(outFolder + "/" + f.name);
            app.open(f);
            var doc = app.activeDocument;
            var w = parseFloat(doc.width);
            var h = parseFloat(doc.height);
            var als = doc.artLayers;

            for (var ii = 0; ii < als.length; ii++) {
                var al = als[ii];
                al.visible = true;
                al.isBackgroundLayer = false;
                /*if (al.name.toUpperCase() != "LAYER 1" && al.name.toUpperCase() != "SHADOW") {
                    
                    al.remove();
                }*/
            }
            doc.resizeImage(fw+"px",fh+"px");        
            try{
            

                var nf = File(outFolder + "/" + app.activeDocument.name.split(".")[0] + ".jpg");
                var jpgSave = new JPEGSaveOptions();
                jpgSave.embedColorProfile = true;
                jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
                jpgSave.matte = MatteType.NONE;
                jpgSave.quality = 12;
                app.activeDocument.saveAs(nf, jpgSave, true, Extension.LOWERCASE);
                } catch( e ){
                    alert(e.mesage);
                }
                try{
                for (var ii = 0; ii < als.length; ii++) {
                    var al = als[ii];
                    if(ii == 0){
                        al.visible = true;    
                    }
                    else {
                        al.visible = false;
                    }
                }
            
            var nfpng = File(outFolder + "/" + app.activeDocument.name.split(".")[0] + ".png");
            exportOptions = new ExportOptionsSaveForWeb();
            exportOptions.format = SaveDocumentType.PNG;
            exportOptions.PNG8 = false; // false = PNG-24
            exportOptions.transparency = true; // true = transparent
            exportOptions.interlaced = false; // true = interlacing on
            exportOptions.includeProfile = true; // false = don't embedd ICC profile
            app.activeDocument.exportDocument(nfpng, ExportType.SAVEFORWEB, exportOptions, Extension.LOWERCASE);} catch( e ){
                alert(e.mesage);
            }


        }
        catch (e)
        {
            alert(e.message);
            app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
            
        }
    }
    return true;
}
    
