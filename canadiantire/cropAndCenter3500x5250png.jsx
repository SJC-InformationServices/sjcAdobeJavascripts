function cdnTire3500png(){
var fw = 3500;
var fh = 5250;
var padding = 150;
var minH = fh - (padding * 2);
var minW = fw - (padding * 2);

var inFolder =  Folder("\\\\10.3.0.39\\Canadian Tire\\hotfolder\\3500x5250_PNG\\In");
var outFolder = Folder("\\\\10.3.0.39\\Canadian Tire\\hotfolder\\3500x5250_PNG\\OUT");
/*var inFolder = Folder.selectDialog("Select Source Folder");
var outFolder = Folder.selectDialog("Select Out Folder");*/


var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);

for (var i = 0; i < files.length; i++) {
    try {

        f = files[i];
        app.open(f);
        var doc = app.activeDocument;
        var als = app.activeDocument.artLayers;
        for (var ii = 0; ii < als.length; ii++) {
            var al = als[ii];
            if (al.isBackgroundLayer) {
                al.remove();
            }
        }
        
        try {
            var path = app.activeDocument.pathItems.getByName("Path 1");
            path.makeSelection(1, 1, SelectionType.Replace);
            doc.crop(doc.selection.bounds);
            path.makeSelection(1,1, SelectionType.Replace);
            doc.selection.invert();
            doc.selection.clear();
        }catch(e){
            
            try {
            for(var y=0;y<app.activeDocument.pathItems.length;y++)
            {
                var p=app.activeDocument.pathItems[y];
                if(p.name == "Path 1")
                {
                p.makeSelection(1, 1, SelectionType.REPLACE);
                doc.crop(doc.selection.bounds);
                p.makeSelection(1,1,SelectionType.REPLACE);
                doc.selection.invert();
                doc.selection.clear();
                }
            }}
            catch(e){
                
            }
        }
       
        try {
            var doc = app.activeDocument;
            
            if (doc.width > doc.height) {
                doc.resizeImage(minW + "px");
                if (doc.height > parseInt(minH)) {
                    doc.resizeImage(null, minH + "px");
                }
            } else {
                doc.resizeImage(null, minH + "px");
                if (doc.width > parseInt(minW)) {
                    doc.resizeImage(minW);
                }
            }
           
            doc.resizeCanvas(fw, fh, AnchorPosition.MIDDLECENTER);
        } catch (e) {
            //alert("Resize: "+e.message);
        }
        

        var nf = File(this.outFolder +"\\"+ app.activeDocument.name.split(".")[0]+".png");
        exportOptions = new ExportOptionsSaveForWeb();
                exportOptions.format = SaveDocumentType.PNG;
                exportOptions.PNG8 = false; // false = PNG-24
                exportOptions.transparency = true; // true = transparent
                exportOptions.interlaced = false; // true = interlacing on
                exportOptions.includeProfile = true; // false = don't embedd ICC profile
                app.activeDocument.exportDocument(nf, ExportType.SAVEFORWEB, exportOptions,Extension.LOWERCASE);
                app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);

    } catch (error) {
        //alert("Error:"+error.line+" "+error.message);
        app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
        return false;
    }
}
return true;}