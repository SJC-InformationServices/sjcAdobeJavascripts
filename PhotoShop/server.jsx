#target "photoshop";
app.displayDialogs = DialogModes.NO;
#include "D:\\repo\\sjcAdobeJavascripts\\PhotoShop\\lib\\hotfolder.jsx";

var current = new Date();
var cDate = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
var cTime = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
var dateTime = cDate + ' ' + cTime;

var tmpF = File("D:\\repo\\sjcAdobeJavascripts\\PhotoShop\\logs\\tmplog.log");
	tmpF.open("a");
    tmpF.writeln("Start: " + dateTime);

try {
    
    var source = $.evalFile(File($.getenv('sjcHotFolders')));
    alert(source);
    tmpF.writeln("Start: " + dateTime);
    source[i].logFIle = tmpF;
    for(var i = 0;i<source.length;i++)
    {
        tmpF.writeln("Folder: "+source[i].Title);
	try {      
        var cc = new hotFolder(source[i]);
        cc.init();
        cc.process();
	} catch(e) {
        
         tmpF.writeln("server.jsx " + source[i].Title+" "+source[i].source+" "+e.message);
        
}
tmpF.close();
        

    }
} catch (e){

         tmpF.writeln(e.message);
         
}
var current = new Date();
var cDate = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
var cTime = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
var dateTime = cDate + ' ' + cTime;

    tmpF.writeln("End: " + dateTime);
    tmpF.close();

/*executeAction(app.charIDToTypeID('quit'),undefined,DialogModes.No);*/