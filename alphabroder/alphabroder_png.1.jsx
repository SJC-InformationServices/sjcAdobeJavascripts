app.preferences.rulerUnits = Units.PIXELS;
displayDialogs = DialogModes.NO;

var filepath = "/C/Users/KevinNoseworthy/Documents/GitHub/sjcAdobeJavascripts/Image Library.txt"

var read_file = new File(filepath);
      read_file.open('r', undefined, undefined);
    
var count = 0;
while(!read_file.eof)
{
    
    var str = read_file.readln();
    var ary = str.split("\t");
    var imgpath = ary[0].replace("\\\\10.3.0.39\\Alpha Broder Web Images\\","/w/").replace(/\\/g,"/");
    
    var brand = ary[1];
    var style = ary[2];
    var basename = ary[3];
    
    if(count < 10000)
    {
        try{
        var folder = new Folder("/w/PNGS/" + brand + "/" + style);
        if(!folder.exists){
            folder.create();
        }
        var pngname = "/w/PNGS/" + brand + "/" + style + "/" + basename.replace(".jpg","") + ".png"
        var oldpngname = "/w/PNGS/" + brand + "/" + basename.replace(".jpg","") + ".png"
        var pngFile = new File(pngname);
        var oldpng = new File(oldpngname);
        if(!pngFile.exists && !oldpng.exists){
        var img = new File(imgpath);
        app.open(img);

        var doc = app.activeDocument;
        doc.artLayers[0].isBackgroundLayer = false;
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
            continue;
        }
        else{
        doc.selection.invert();
        //doc.selection.clear();
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

    doc.changeMode(ChangeMode.RGB);  
            opts = new PNGSaveOptions();
            opts.format = SaveDocumentType.PNG;
            opts.transparency = true
            opts.PNGB = false;
            opts.quality = 100;
            opts.includeProfile = true;
            opts.compression= 9;

        doc.saveAs(pngFile, opts, false, Extension.LOWERCASE);
        doc.close(SaveOptions.DONOTSAVECHANGES);
        }
    }
    }
    catch(error){}
}
    
    /*
    \\10.3.0.39\Alpha Broder Web Images\ESEC_Hollows\A4\n3001\n3001_12.jpg	A4	N3001	n3001_12.jpg	12	
    */
   count++;
}

read_file.close()
alert("End");