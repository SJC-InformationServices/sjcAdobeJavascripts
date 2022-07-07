#target "indesign";

var swatches = app.activeDocument.swatches;

var file = File.selectDialog("Select Swatch Json File");