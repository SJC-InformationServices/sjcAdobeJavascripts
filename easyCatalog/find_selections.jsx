var ec = app.easycatalogObject;
var doc = app.activeDocument;

var selectionKeys = [];

var selection = app.selection;
if (selection.length > 0) {
   for (var i = 0; i<selection.length;i++)
   {
    try {
    var ec_select = ec.getLinks(selection[i]);
    var sel_ds = ec_select[0];
    var sel_key = ec_select[1];
    var sel_fd = ec_select[2];
    } catch (e) {

    }
    if (sel_key){
        if (typeof selectionKeys[sel_ds] == "undefined")
        {
            selectionKeys[sel_ds] = [];
        }
        selectionKeys[sel_ds].push(sel_key);
    }
   } 
    
   for(sel_ds in selectionKeys){
       alert(sel_ds);
        var ds =  ec.datasources.item(sel_ds);
        var keys = selectionKeys[sel_ds];
        var dvs = ds.dataviews;
        for (var i = 0; i < dvs.length; i++) {
            var dv = dvs[i];
            dv.showRecords(keys);
            //dv.makeSelection(1,selectionKeys.length);
            //dv.showAll();
        }
    
   }
    
}