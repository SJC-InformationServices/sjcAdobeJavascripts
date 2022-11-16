#target "photoshop";
app.displayDialogs = DialogModes.NO;

var fw = 1200;
var fh = 1500;
var padding = 20;
var minH = fh - (padding * 2);
var minW = fw - (padding * 2);

var inFolder =  Folder("\\\\10.3.0.39\\Alpha Broder\\HotFolders\\Alpha1200x1500_OffFig_KeepBackground\\IN");
var outFolder = Folder("\\\\10.3.0.39\\Alpha Broder\\HotFolders\\Alpha1200x1500_OffFig_KeepBackground\\OUT");
/*var inFolder = Folder.selectDialog("Select Source Folder");
var outFolder = Folder.selectDialog("Select Out Folder");*/


var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);

for (var i = 0; i < files.length; i++) {
    try {

        f = files[i];
        app.open(f);
        try {

            var als = app.activeDocument.artLayers;
            for (var ii = 0; ii < als.length; ii++) {
                var al = als[ii];
                al.isBackgroundLayer = false;
                al.visible = true;
            }
            app.activeDocument.activeLayer = als[als.length - 1];
            app.activeDocument.flatten();
        } catch (e) {
            alert('flatten failed');
        }

        try {
            var path = app.activeDocument.pathItems.getByName("Path 1");
            path.makeSelection(1, 1, SelectionType.Replace);

        } catch (e) {
            try{
            for (var y = 0; y < app.activeDocument.pathItems.length; y++) {
                var p = app.activeDocument.pathItems[y];
                if (p.name == "Path 1") {
                    p.makeSelection(1, 1, SelectionType.REPLACE);
                }
            }
        }catch(e){
            alert(e.message);
        }
        }
        w = app.activeDocument.width;
        h = app.activeDocument.height;
        var crop = app.activeDocument.selection.bounds.join(",").split(",");

        var cx = (parseFloat(crop[0].replace("px", "")) - 40),
            cy = (parseFloat(crop[1].replace("px", "")) - 20),
            cw = (parseFloat(crop[2].replace("px", "")) + 40),
            ch = (parseFloat(crop[3].replace("px", "")) + 20);

        var bounds = [cx + " px", cy + " px", cw + " px", ch + " px"];
        app.activeDocument.crop(bounds);

        if(h>w){
            app.activeDocument.resizeImage(null, fh + "px");
        }else{
            app.activeDocument.resizeImage(fw + "px");
        }       

        var jpgSave = new JPEGSaveOptions();
        jpgSave.embedColorProfile = true;
        jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
        jpgSave.matte = MatteType.NONE;
        jpgSave.quality = 12;

        var nf = File(outFolder + "/" + app.activeDocument.name);
        app.activeDocument.saveAs(nf, jpgSave, true, Extension.LOWERCASE);
        app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
        
    } catch (error) {
        alert(error.message);
        app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
    }
}