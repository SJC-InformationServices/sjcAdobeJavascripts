#target "photoshop";

#include ".\\lib\\hotfolder.jsx";

try {
        
        
        /*var details = app.Dialog.add({canCancel:true,label:"Ratio of Cropping",name:"ratio_cropping"});*/
       // Dialog Definition 
       var addGroupToWindow = function(window,name,w,h,value){

           try
           {
               var g = window.add("group",undefined,{name:name});
                g.preferredSize.width = w; 
           g.preferredSize.height = h; 
           g.orientation = "row"; 
           g.alignChildren = ["left","center"]; 
           g.spacing = 10; 
           g.margins = 0; 
           
           var label = g.add("statictext", undefined, undefined, {name: name+"_label"}); 
            label.text = name; 
            label.preferredSize.width = w/2-5; 
            label.preferredSize.height = h; 
            label.justify = "center";

            var pv = g.add('edittext {justify: "center", properties: {name: "ratio_value"}}'); 
            pv.text = value; 
            pv.preferredSize.width = w/2-5; 
           
          
          return pv;
       }catch(e){
           alert(e.message +"\r\n"+name);
       }
       return false;
       } 
       


        var dialog =new Window('dialog', 'Cropping Ratio');
        dialog.text = "Image Resize / Cropping "; 
        dialog.preferredSize.width = 300; 
        dialog.preferredSize.height = 230; 
        dialog.orientation = "column"; 
        dialog.alignChildren = ["left","center"]; 
        dialog.spacing = 10; 
        dialog.margins = 16; 

       var ratio = addGroupToWindow(dialog,"ratio",300,25,"0.85");
       var cw=addGroupToWindow(dialog,"width",300,25,1200);
       var ch=addGroupToWindow(dialog,"height",300,25,1500);
       var oW=addGroupToWindow(dialog,"WhiteSpace Width",300,25,1460);
       var oH=addGroupToWindow(dialog,"WhiteSpace Height",300,25,1120);

// GROUP1
// ======
var group1 = dialog.add("group", undefined, {name: "group1"}); 
    group1.preferredSize.width = 285; 
    group1.orientation = "row"; 
    group1.alignChildren = ["center","center"]; 
    group1.spacing = 10; 
    group1.margins = 0; 

var ok = group1.add("button", undefined, undefined, {name: "ok"}); 
    ok.helpTip = "Ok"; 
    ok.text = "OK"; 
    ok.preferredSize.width = 125; 

var cancel = group1.add("button", undefined, undefined, {name: "cancel"}); 
    cancel.helpTip = "Cancel"; 
    cancel.text = "Cancel"; 
    cancel.preferredSize.width = 125; 

dialog.show();

var source = Folder.selectDialog("Source Folder for Images");
var destination = Folder.selectDialog("Save Folder Locations");


        var cc = new hotFolder({align:{Value:"BOTTOMCENTER"}});
        cc.init();
        cc.set("inFolder",source);
        cc.set("outFolder",destination);
        cc.set("ratio",parseFloat(ratio.text));        
        cc.set("canvasWidth",parseFloat(cw.text));
        cc.set("canvasHeight",parseFloat(ch.text));
        cc.set("width",parseFloat(oW.text));
        cc.set("height",parseFloat(oH.text));
        cc.set("clippingPath","Path 1");
        cc.set("format","orginal");
        cc.set("files", cc.get("inFolder").getFiles(/\.(psd|tif|jpg|)$/i));
        /*for(var i in cc)
        {
            alert(i+": \r\n"+cc[i]);
        }*/
        
        cc.process();
        
} catch (e){
    alert(e.message);alert('begin');
}