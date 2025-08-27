function metro_bw_jpg(log) {
    var current = new Date();
    var cDate = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
    var cTime = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
    var dateTime = cDate + ' ' + cTime;
    log.writeln("metro bw " + dateTime);

    var inFolder = Folder("\\\\10.3.0.39\\Metro_Ontario\\hotfolder\\In");
    var outFolder = Folder("\\\\10.3.0.39\\Metro_Ontario\\hotfolder\\Out");

    var files = inFolder.getFiles(/\.(psd|tif|jpg)$/i);

    log.writeln("Total Files: " + files.length);
    for (var i = 0; i < files.length; i++) {
        var f = files[i];
        log.writeln(i + ":" + f.fullName);

        try {
            app.open(f);
            var doc = app.activeDocument;

            // Convert to grayscale
            doc.changeMode(ChangeMode.GRAYSCALE);

            doc.save();
            doc.close(SaveOptions.SAVECHANGES);
            var nf = File(outFolder + "\\" + doc.name);            
            f.copy(nf);
            //f.remove();
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
