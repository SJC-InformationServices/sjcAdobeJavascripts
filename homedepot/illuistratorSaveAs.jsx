#target "illustrator";

var inFolder = Folder("//10.136.209.199/HomeDepot/Master Assets/Logos");
var outFolder = Folder("\\\\10.136.209.199\\HomeDepot\\Master Assets\\Logos\\Converted");

var files = inFolder.getFiles(/\.(jpg|eps)$/i);

for (var i = 0; i < files.length; i++) {
    try {
        f = files[i];
        if(f.name.substring(0,1)=="."){

        }else{
        app.open(f);
        var nf = File(outFolder + "\\" + app.activeDocument.name.split(".")[0] + ".ai");
        var saveOps = new IllustratorSaveOptions();
        saveOps.EmbedICCProfile=true;
        saveOps.EmbedLinkedFiles=true;

        app.activeDocument.saveAs(nf,saveOps);
        app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
        }
    }
        catch (error) {
            
            alert("Error:"+error.line+" "+error.message);
            app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);

        }
    }