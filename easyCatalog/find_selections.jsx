var ec = app.easycatalogObject;
var doc = app.activeDocument;
var ds = ec.datasources.item("2020 MC_updated copy_DATA_PrimeLine.xlsx");
var dvs = ds.dataviews;

var selectionKeys = [];

var selection = app.selection;
if (selection.length > 0) {
   for (var i = 0; i<selection.length;i++)
   {
    try{
    var ec_select = ec.getLinks(selection[i]);
    var sel_ds = ec_select[0];
    var sel_key = ec_select[1];
    var sel_fd = ec_select[2];
    } catch (e) {

    }
    if (sel_key){
        selectionKeys.push(sel_key);
    }
   } 
       
    for (var i = 0; i < dvs.length; i++) {
        var dv = dvs[i];
        var recs = dv.records;
        dv.showRecords(selectionKeys);
        //dv.makeSelection(1,selectionKeys.length);
        //dv.showAll();
    }

}