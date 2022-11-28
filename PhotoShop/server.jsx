#target "photoshop";
/*app.displayDialogs = DialogModes.NO;*/
#include "E:\\repo\\sjcAdobeJavascripts\\PhotoShop\\lib\\hotfolder.jsx";
#include "E:\\repo\\sjcAdobeJavascripts\\sobeys\\convertToSMTEps.jsx";
//#include "E:\\repo\\sjcAdobeJavascripts\\sobeys\\cropAndCenter3500x5250png.jsx"

var current = new Date();
var cDate = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
var cTime = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
var dateTime = cDate + ' ' + cTime;

var tmpF = File("E:\\repo\\sjcAdobeJavascripts\\PhotoShop\\logs\\tmplog.log");
	tmpF.open("a");
    tmpF.writeln("Start: " + dateTime);

try {
    try 
     {
        convertToSMTEps();
        //cdnTire3500png();
        
    }
         catch(e) {
            tmpF.writeln("SMT or CDNTIRE");
     }
    var source = $.evalFile(File($.getenv('sjcHotFolders')));
    tmpF.writeln("Total Folders:" + source.length);
    for(var i = 0;i<source.length;i++)
    {
        tmpF.writeln("Folder: "+source[i].source);
	try {      
        var x = source[i];
        x.logFile = tmpF;
        
        var cc = new hotFolder(x);
        
        cc.init();
        tmpF.writeln(x.source+" Total Files: "+cc.get("files").length);
        cc.process();
	} catch(e) {
        
     tmpF.writeln("server.jsx " + source[i].Title+" "+source[i].source+" "+e.message);
        
}
tmpF.close();
        

    }
} catch (e){
        tmpF.writeln($.getenv('sjcHotFolders'));
         tmpF.writeln("Can't Parse Source File" + e.message);
         
}
var dcurrent = new Date();
var dcDate = dcurrent.getFullYear() + '-' + (dcurrent.getMonth() + 1) + '-' + dcurrent.getDate();
var dcTime = dcurrent.getHours() + ":" + dcurrent.getMinutes() + ":" + dcurrent.getSeconds();
var ddateTime = dcDate + ' ' + dcTime;

    tmpF.writeln("End: " + ddateTime);
    tmpF.close();

/*executeAction(app.charIDToTypeID('quit'),undefined,DialogModes.No);*/