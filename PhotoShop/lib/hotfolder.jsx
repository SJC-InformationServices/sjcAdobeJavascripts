function hotFolder(properties) {
    this.properties = properties;
    this.source;
    this.inFolder;
    this.outFolder;
    this.width;
    this.height;
    this.canvasWidth;
    this.canvasHeight;
    this.clippingPath;
    this.ratio;
    this.align;
    this.saveOptions;
    this.filter;
    this.files;
    this.AnchorPosition;
    this.export_for_web;
    this.logFile;
    this.dpi;
    

    this.set = function (k, v) {
        try {
            this[k] = v;
        } catch (e) {
            this.error(e, "property settings");
        }
    };
    this.get = function (k) {
        if(this.hasOwnProperty(k))
        {
            return this[k];
        }
        return null;
    };
    this.error = function (e,msg) {
        /*alert(msg+"\r\n"+e.line+"\r\n"+e.message);*/

         this.logFile.writeln(msg+"\t"+e.line+"\t"+e.message);
         
        app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
    };

    this.init = function () {
        
            for (var i in this.properties) {
                this.set(i, properties[i]);
            }
            if(this.get("source") != ""){
            this.set("inFolder", Folder(this.get("source") + "\\IN"));
            this.set("outFolder", Folder(this.get("source") + "\\OUT"));
            if(this.inFolder.exists){
                this.set("files", this.get("inFolder").getFiles(/\.(psd|tif|jpg|)$/i));
            }else{
                this.error({"line":54,"message":"Folder Not Found"},"In Folder Not Found");
            }
            }
            if(typeof this.align != 'undefined'){
            switch (this.align.Value) {
                case 'BOTTOMCENTER':
                    this.AnchorPosition = AnchorPosition.BOTTOMCENTER;
                    break;
                case 'MIDDLECENTER':
                    this.AnchorPosition = AnchorPosition.MIDDLECENTER;
                    break;
                case 'TOPCENTER':
                    this.AnchorPosition = AnchorPosition.TOPCENTER;
                    break;
            }}

    };
    this.magicWand = function (x, y, t, a, c, s) {
        try{
        if (arguments.length < 2) return; // make sure have x,y
        if (undefined == t) var t = 35; // set defaults of optional arguments
        if (undefined == a) var a = true;
        if (undefined == c) var c = false;
        if (undefined == s) var s = false;
        var desc = new ActionDescriptor();
        var ref = new ActionReference();
        ref.putProperty(charIDToTypeID('Chnl'), charIDToTypeID('fsel'));
        desc.putReference(charIDToTypeID('null'), ref);
        var positionDesc = new ActionDescriptor();
        positionDesc.putUnitDouble(charIDToTypeID('Hrzn'), charIDToTypeID('#Rlt'), x); // in pixels
        positionDesc.putUnitDouble(charIDToTypeID('Vrtc'), charIDToTypeID('#Rlt'), y);
        desc.putObject(charIDToTypeID('T   '), charIDToTypeID('Pnt '), positionDesc);
        desc.putInteger(charIDToTypeID('Tlrn'), t); // tolerance
        desc.putBoolean(charIDToTypeID('Mrgd'), s); // sample all layers
        if (!c) desc.putBoolean(charIDToTypeID("Cntg"), false); //  contiguous
        desc.putBoolean(charIDToTypeID('AntA'), a); // anti-alias
        executeAction(charIDToTypeID('setd'), desc, DialogModes.NO);
        }catch(e){
            this.error(e,"magicWand");
        }
    };
    this.process = function () {
        try {
            var imgs = this.get("files");
            for (var i = 0; i < imgs.length; i++) {
                var f = imgs[i];

                app.open(f);
                if(this.flattenFile()){
                    if(this.clipFile()){
                        if(this.resizeFile()){
                            if(this.saveCloseFile())
                            {
                                app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
                                f.remove();
                            }
                        }
                    }
                }
            }
        } catch (e) {
            this.error(e,"processing");
        }
    };
    this.flattenFile = function () {
        try {
            var doc = app.activeDocument;
            var als = doc.artLayers;
            for (var ii = 0; ii < als.length; ii++) {
                var al = als[ii];
                al.isBackgroundLayer = false;
                al.visible = true;
            }
            doc.activeLayer = als[als.length - 1];
            doc.flatten();
        } catch (e) {
            this.error(e,"flatten");
            return false;
        }
        return true;
    };
    this.clipFile = function () {
        if(typeof this.clippingPath != 'undefined'){
        try {
            var doc = app.activeDocument;

            if (this.clippingPath.Value == "Auto") {
                var mw = magicWand(5, 5, 3, true, true, false);
                var selection = doc.selection.invert();
                doc.crop(doc.selection.bounds);
                doc.crop(["0 px", "0 px", doc.width, doc.height * 0.62]);
                var mw = magicWand(5, 5, 3, true, true, false);
                var selection = doc.selection.invert();
                doc.crop(doc.selection.bounds);

            } else {
                
                try {
                    var path = app.activeDocument.pathItems.getByName(this.clippingPath.Value);
                    path.makeSelection(1, 1, SelectionType.Replace);
                    doc.crop(doc.selection.bounds);
                    path.makeSelection(1,1, SelectionType.Replace);
                    doc.selection.invert();
                    doc.selection.clear();
                }catch(e){
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
                    }
                }
            }
        } catch (e) {
            this.error(e,"clipping");
            return false;
        }
        return true;
    }
    return true;
    };
    this.resizeFile = function () {
        if(this.width == 0 || this.height == 0)
        {
            return true;
        }
        try {
            var doc = app.activeDocument;
            if(this.ratio != 1.0)
            {
                doc.crop([0,0,doc.width,doc.height*this.ratio]);
            }
            if(this.dpi==72)
            {
                doc.resizeImage(null,null,72);
            }
            if (doc.width > doc.height) {
                doc.resizeImage(this.width + "px");
                if (doc.height > parseInt(this.height)) {
                    doc.resizeImage(null, this.height + "px")
                }
            } else {
                doc.resizeImage(null, this.height + "px");
                if (doc.width > parseInt(this.width)) {
                    doc.resizeImage(this.width);
                }
            }
            
           
            doc.resizeCanvas(this.canvasWidth, this.canvasHeight, this.AnchorPosition);
        } catch (e) {
            this.error(e,"resize");return false;
        }
        return true;
    }
    this.saveCloseFile = function () 
    {
        switch (this.format.Value){
            case 'jpg':
            case 'jpeg':
                var jpgSave = new JPEGSaveOptions();
                jpgSave.embedColorProfile = true;
                jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
                jpgSave.matte = MatteType.NONE;
                jpgSave.quality = 12;
                this.saveOptions = jpgSave;
                break;
            case 'psd':
                var psdSaveOptions = new PhotoshopSaveOptions();
                psdSaveOptions.alphaChannels = true;
                psdSaveOptions.annotations = true;
                psdSaveOptions.embedColorProfile = true;
                psdSaveOptions.layers = true;
                this.saveOptions=psdSaveOptions;
            break;
            case 'png':
                var pngSaveOps = new PNGSaveOptions();
                pngSaveOps.interlaced = false;
                this.saveOptions=pngSaveOps;
            break;
            case 'tiff':
            case 'tif':
               var tifSaveOps = new TiffSaveOptions(); 
               tifSaveOps.byteOrder = "IBM";
               tifSaveOps.alphaChannels=true;
               tifSaveOps.annotations=true;
               tifSaveOps.embedColorProfile=true;               
                this.saveOptions=tifSaveOps;
            break;
            default:
                if(app.activeDocument.name.substr(-3) == 'jpg')
                {
                    var jpgSave = new JPEGSaveOptions();
                    jpgSave.embedColorProfile = true;
                    jpgSave.formatOptions = FormatOptions.STANDARDBASELINE;
                    jpgSave.matte = MatteType.NONE;
                    jpgSave.quality = 12;
                    this.saveOptions = jpgSave;
                }
                else
                {
                    var psdSaveOptions = new PhotoshopSaveOptions();
                psdSaveOptions.alphaChannels = true;
                psdSaveOptions.annotations = true;
                psdSaveOptions.embedColorProfile = true;
                psdSaveOptions.layers = true;
                this.saveOptions=psdSaveOptions;
                }
            break;

        }
        try{
            var nf = File(this.outFolder +"\\"+ app.activeDocument.name.split(".")[0]+".png");
            if (this.export_for_web == true){
                exportOptions = new ExportOptionsSaveForWeb();
                exportOptions.format = SaveDocumentType.PNG;
                exportOptions.PNG8 = false; // false = PNG-24
                exportOptions.transparency = true; // true = transparent
                exportOptions.interlaced = false; // true = interlacing on
                exportOptions.includeProfile = true; // false = don't embedd ICC profile
                app.activeDocument.exportDocument(nf, ExportType.SAVEFORWEB, exportOptions,Extension.LOWERCASE);
                
        } else {
            app.activeDocument.saveAs(nf, this.saveOptions, true, Extension.LOWERCASE);
        }
            return true;
        }
        catch(e)
        {
            this.error(e,"Saving");
            return false;
        }
    }

}