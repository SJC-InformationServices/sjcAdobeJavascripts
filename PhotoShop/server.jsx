#target "photoshop";
<<<<<<< HEAD
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
executeAction(app.charIDToTypeID('quit'),undefined,DialogModes.No);
=======


#include "alphalaydowns4x5AlignBottom.jsx";

app.displayDialogs = DialogModes.NO;
app.preferences.rulerUnits = Units.PIXELS;



var a = alphalaydownalignbottom();



>>>>>>> d19052d019b75b7d4e3e5caf9d98ffc8b88faad6
