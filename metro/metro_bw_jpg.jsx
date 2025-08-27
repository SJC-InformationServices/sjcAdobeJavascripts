function metro_bw_jpg(log) {
    var current = new Date();
    var cDate = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
    var cTime = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
    var dateTime = cDate + ' ' + cTime;
    log.writeln("metro bw " + dateTime);

    var inFolder = Folder("\\\\10.3.0.39\\Metro_Ontario\\hotfolder\\Metro_BW\\In");
    var outFolder = Folder("\\\\10.3.0.39\\Metro_Ontario\\hotfolder\\Metro_BW\\Out");

    var files = inFolder.getFiles(/\.(psd|tif|jpg|jpeg|tiff|eps)$/i);

    log.writeln("Total Files: " + files.length);
    for (var i = 0; i < files.length; i++) {
        var f = files[i];
        log.writeln(i + ":" + f.fullName);

        try {
            app.open(f);
            var doc = app.activeDocument;

            // Convert to grayscale
            doc.changeMode(ChangeMode.GRAYSCALE);
                        
            var ext = f.name.split('.').pop().toLowerCase();
            var saveFile = File(outFolder + "/" + doc.name);

            if (ext === "jpg" || ext === "jpeg") {
                var saveOps = new JPEGSaveOptions();
                saveOps.quality = 12;
                
            } else if (ext === "tif" || ext === "tiff") {
                var saveOps = new TiffSaveOptions();
                saveOps.imageCompression = TIFFEncoding.NONE;
                
            } else if (ext === "psd") {
                var saveOps = new PhotoshopSaveOptions();
                
            } else {
                log.writeln("Unsupported format: " + ext);
                doc.close(SaveOptions.DONOTSAVECHANGES);
                continue;
            }
            doc.saveAs(saveFile, saveOps, true);
            doc.close(SaveOptions.DONOTSAVECHANGES);
            f.remove();

        } catch (e) {
            log.writeln("Error: " + e.message);
            if (app.documents.length > 0) {
                app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
            }
        }
    }

    var dcurrent = new Date();
    var dcDate = dcurrent.getFullYear() + '-' + (dcurrent.getMonth() + 1) + '-' + dcurrent.getDate();
    var dcTime = dcurrent.getHours() + ":" + dcurrent.getMinutes() + ":" + dcurrent.getSeconds();
    var ddateTime = dcDate + ' ' + dcTime;
    log.writeln("End: " + ddateTime);
    return true;
}
