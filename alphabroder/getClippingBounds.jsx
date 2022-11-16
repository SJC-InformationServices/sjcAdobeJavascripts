try {
    var path = app.activeDocument.pathItems.getByName("Path 1");
    path.makeSelection(1, 1, SelectionType.Replace);

} catch (e) {
    try{
    for (var y = 0; y < app.activeDocument.pathItems.length; y++) {
        var p = app.activeDocument.pathItems[y];
        if (p.name == "Path 1") {
            p.makeSelection(1, 1, SelectionType.REPLACE);
        }
    }
}catch(e){
    alert(e.message);
}
}

var crop = app.activeDocument.selection.bounds.join(",");
alert(crop);