#target "photoshop";
app.displayDialogs = DialogModes.NO;
#include "lib/hotfolder.jsx";

try {
    
    var source = $.evalFile(File($.getenv('sjcHotFolders')));
    for(var i = 0;i<source.length;i++)
    {

        var cc = new hotFolder(source[i]);
        cc.init();
        cc.process();
        

    }
} catch (e){
    
}

