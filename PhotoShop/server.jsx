#target "photoshop";
app.displayDialogs = DialogModes.NO;
#include "\\lib\\hotfolder.jsx";

try {
    
    var source = $.evalFile(File($.getenv('sjcHotFolders')));
    for(var i = 0;i<source.length;i++)
    {
	try {      
        var cc = new hotFolder(source[i]);
        cc.init();
        cc.process();
	} catch(e) {
	var tmpF = File("tmplog.log");
	 tmpF.open("a");
         tmpF.writeln(source[i].Title+" "+source[i].source+" "+e.message);
         tmpF.close();
}
        

    }
} catch (e){
var tmpF = File("tmplog.log");
	 tmpF.open("a");
         tmpF.writeln(e.message);
         tmpF.close();
}

/*executeAction(app.charIDToTypeID('quit'),undefined,DialogModes.No);*/