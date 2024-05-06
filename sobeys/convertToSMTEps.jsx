function convertToSMTEps(log){

    var current = new Date();
    var cDate = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
    var cTime = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
    var dateTime = cDate + ' ' + cTime;
    log.writeln("Start Sobeys EPS Convert" + dateTime);


var inFolder = Folder("\\\\10.136.209.199\\Sobeys_Assets\\_HotFolders\\EpsClippingPath\\In");
//var inFolder = Folder.selectDialog("Select Source Folder");
var outFolder = Folder("\\\\10.136.209.199\\Sobeys_Assets\\_HotFolders\\EpsClippingPath\\Out");

var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);
log.writeln("TotalFiles: " + files.length);
    
    for(var i=0;i<files.length;i++)
    {
        try {

        f=files[i];
        app.open(f);
        var doc = app.activeDocument;
        //alert(doc.colorProfileName);
        //doc.colorProfileName = "U.S Web Coated (SWOP) v2";
        //doc.colorProfileType=ColorProfile.CUSTOM; 
        doc.convertProfile("U.S. Web Coated (SWOP) v2",Intent.PERCEPTUAL,false,true);
        try {
            path = doc.pathItems.getByName(this.clippingPath.Value).makeClippingPath(0.2);        
        } catch (e) {
            path = doc.pathItems[0].makeClippingPath(0.2);
        }
        epsSaveOpts = new EPSSaveOptions();
          epsSaveOpts.embedColorProfile = true;
	      epsSaveOpts.flattenOuput = false;
	      epsSaveOpts.includeDocumentThumbnails = true;
	      epsSaveOpts.encoding = SaveEncoding.JPEGMAXIMUM; //syntax was wrong on this
        
      var nf = File(outFolder +"/"+ app.activeDocument.name);
      app.activeDocument.saveAs(nf,epsSaveOpts,true,Extension.LOWERCASE);
      app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
        f.remove();

    }catch(e){
        return e;
    }
}
// Get the current date and time again at the end of processing all files
var dcurrent = new Date();
var dcDate = dcurrent.getFullYear() + '-' + (dcurrent.getMonth() + 1) + '-' + dcurrent.getDate();
var dcTime = dcurrent.getHours() + ":" + dcurrent.getMinutes() + ":" + dcurrent.getSeconds();
var ddateTime = dcDate + ' ' + dcTime;

log.writeln("End: " + ddateTime);
return true;
}