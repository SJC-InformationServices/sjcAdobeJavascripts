#target "photoshop";
app.displayDialogs = DialogModes.NO;

var inFolder = Folder("\\\\10.136.209.199\\Sobeys_Assets\\_HotFolders\\EpsClippingPath\\In");
//var inFolder = Folder.selectDialog("Select Source Folder");
var inFolder = Folder("\\\\10.136.209.199\\Sobeys_Assets\\_HotFolders\\EpsClippingPath\\Out");

var files = inFolder.getFiles(/\.(psd|tif|jpg|)$/i);
    
    for(var i=0;i<files.length;i++)
    {
        try {

        f=files[i];
        app.open(f);
        var doc = app.activeDocument;
        //doc.colorProfileType=ColorProfile.CUSTOM;
        doc.convertProfile("U.S Web Coated (SWOP) v2",Intent.PERCEPTUAL,false,true);
        try {
            var path = doc.pathItems.getByName(this.clippingPath.Value).makeClippingPath(0.2);        
        } catch (e) {
            var path = doc.pathItems[0].makeClippingPath(0.2);
        }
        epsSaveOpts = new EPSSaveOptions();
          epsSaveOpts.embedColorProfile = true;
	      epsSaveOpts.flattenOuput = false;
	      epsSaveOpts.includeDocumentThumbnails = true;
	      epsSaveOpts.encoding = SaveEncoding.JPEGMAXIMUM; //syntax was wrong on this
        
      var nf = File(outFolder +"/"+ app.activeDocument.name);
      app.activeDocument.saveAs(nf,epsSaveOpts,true,Extension.LOWERCASE);
      app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);


    }catch(e){
        alert(e.message);
    }
}