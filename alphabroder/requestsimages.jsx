var imageDir = Folder.selectDialog("Select Source Directory");
var destinationDir = Folder.selectDialog("Select Destination");
var log = new File(imageDir.fullName + "/log.txt");
log.open("w")
var files = imageDir.getFiles(/\.jpg/i);
var count = 0;
if(files !== null)
{
    for(var i = 0;i<file.length;i++)
    {
        var file = files[i];
        app.open(file);
        var doc = app.activeDocument;
        doc.artLayers[0].isBackgroundLayer = false;
        var pngFile = File(destinationDir+ '/' + file.name.replace(".jpg",".png"));

        var clippaths = doc.pathItems;
                var p;
                for(var y=0;y<clippaths.length;y++)
                {
                    p = clippaths[y];
                    
                    if(p.name == 'Path 1')
                    {
                      p.makeSelection(1,1,SelectionType.REPLACE);
                      break;  
                    }
                }
                if(!doc.selection){
                    doc.close(SaveOptions.DONOTSAVECHANGES);
                    log.writeLn(doc.name);
                    continue;
               }
               
               doc.selection.invert();
               try{
                   doc.selection.clear();
               }catch(err){
                try{
                //TO GET AROUND BUG fill clear
                // =======================================================
                var idFl = charIDToTypeID( "Fl  " );
                var desc55 = new ActionDescriptor();
                var idUsng = charIDToTypeID( "Usng" );
                var idFlCn = charIDToTypeID( "FlCn" );
                var idClr = charIDToTypeID( "Clr " );
                desc55.putEnumerated( idUsng, idFlCn, idClr );
                var idClr = charIDToTypeID( "Clr " );
                    var desc56 = new ActionDescriptor();
                    var idGry = charIDToTypeID( "Gry " );
                    desc56.putDouble( idGry, 49.799997 );
                var idGrsc = charIDToTypeID( "Grsc" );
                desc55.putObject( idClr, idGrsc, desc56 );
                var idOpct = charIDToTypeID( "Opct" );
                var idPrc = charIDToTypeID( "#Prc" );
                desc55.putUnitDouble( idOpct, idPrc, 100.000000 );
                var idMd = charIDToTypeID( "Md  " );
                var idBlnM = charIDToTypeID( "BlnM" );
                var idClar = charIDToTypeID( "Clar" );
                desc55.putEnumerated( idMd, idBlnM, idClar );
                executeAction( idFl, desc55, DialogModes.NO );
                }catch(error){
                    doc.close(SaveOptions.DONOTSAVECHANGES);
                    continue;
                }
               }
               doc.changeMode(ChangeMode.RGB);  
                opts = new PNGSaveOptions();
                opts.format = SaveDocumentType.PNG;
                opts.transparency = true;
                opts.PNGB = false;
                opts.quality = 100;
                opts.includeProfile = true;
                opts.compression= 9;

                doc.saveAs(pngFile, opts, false, Extension.LOWERCASE);
                doc.close(SaveOptions.DONOTSAVECHANGES);


        count++;
    }
    
}
log.close();