#target "photoshop";
app.displayDialogs = DialogModes.NO;
#include "E:\\repo\\sjcAdobeJavascripts\\PhotoShop\\lib\\hotfolder.jsx";
#include "E:\\repo\\sjcAdobeJavascripts\\sobeys\\convertToSMTEps.jsx";
//#include "E:\\repo\\sjcAdobeJavascripts\\canadiantire\\cropAndCenter3500x5250png.jsx";
#include "E:\\repo\\sjcAdobeJavascripts\\canadiantire\\3500x5250SquareJpgPng.jsx";
#include "E:\\repo\\sjcAdobeJavascripts\\canadiantire\\cropAndCenter3500x5250jpgBkgroud.jsx";
#include "E:\\repo\\sjcAdobeJavascripts\\alphabroder\\alphabroder_keepbackground.jsx";

#include "E:\\repo\\sjcAdobeJavascripts\\alphabroder\\alphabroder_keepbackground 1800x180050px.jsx";
#include "E:\\repo\\sjcAdobeJavascripts\\alphabroder\\alphabroder_keepbackground 800x80050px.jsx";

#include "E:\\repo\\sjcAdobeJavascripts\\alphabroder\\sns_2400x2400_keepbkgd_50px.jsx";

#include "E:\\repo\\sjcAdobeJavascripts\\alphabroder\\WM_3000x3000_300dpi_50px_MagicWand.jsx";

#include "E:\\repo\\sjcAdobeJavascripts\\walmart\\walmart_sizeAs5px.jsx";

var current = new Date();
var cDate = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
var cTime = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
var dateTime = cDate + ' ' + cTime;

var tmpF = File("E:\\repo\\sjcAdobeJavascripts\\PhotoShop\\logs\\tmplog-"+cDate+".log");
	tmpF.open("a");
    tmpF.writeln("Start: " + dateTime);

try {
    try 
     {
        convertToSMTEps(tmpF);
    }
         catch(e) {
            tmpF.writeln("SMT");
            tmpF.writeln(e.message);
     }
     try 
     {
        cdnTire3500jpgPngBkgrd(tmpF);
    }
         catch(e) {
            tmpF.writeln("CDN Tire Jpgs / PNG");
            tmpF.writeln(e.message);
     }
     try 
     {
        cdnTire3500x5250SquareJpgPng(tmpF);        
    }
         catch(e) {
            tmpF.writeln("CDN Tire Resize PNG / JPGS Only");
            tmpF.writeln("Failed to Run");
            tmpF.writeln(e.message);
     }       
     try 
     {
        alphabroderJPGBkgrd(tmpF);        
    }
         catch(e) {
            tmpF.writeln("Alpha Resize PNG / JPGS Only");
            tmpF.writeln("Failed to Run");
            tmpF.writeln(e.message);
     }
     try 
     {
        alphabroderJPGBkgrd1800(tmpF);
    }
         catch(e) {
            tmpF.writeln("alphabroderJPGBkgrd1800: ");
            tmpF.writeln(e.message);
     }   
     try 
     {
        alphabroderJPGBkgrd800(tmpF);
    }
         catch(e) {
            tmpF.writeln("alphabroderJPGBkgrd800: ");
            tmpF.writeln(e.message);
     }    
     try 
     {
        snsPngBkgrd2400(tmpF);
    }
         catch(e) {
            tmpF.writeln("alphabroderJPGBkgrd800: ");
            tmpF.writeln(e.message);
     }    
      
      try 
     {
        WM_3000x3000_300dpi_50px_MagicWand(tmpF);
    }
         catch(e) {
            tmpF.writeln("alphabroderJPGBkgrd800: ");
            tmpF.writeln(e.message);
     }
try 
     {
        walmart_sizeAs5px(tmpF);
    }
         catch(e) {
            tmpF.writeln("walmart_sizeAs5px ");
            tmpF.writeln(e.message);
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
    var idquit = charIDToTypeID( "quit" );

    //executeAction( idquit, undefined, DialogModes.ALL );
/*executeAction(app.charIDToTypeID('quit'),undefined,DialogModes.No);*/