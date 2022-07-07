#target "indesign";

var swatches = app.activeDocument.swatches;
var swa = swatches[0].properties;
/*for (var i in swa) {
    alert(i + ": " + swa[i]);
}*/
txt=[];
var file = File("~/Desktop/New folder/SwatchDetails.csv");
file.open("w");
for (var i = 0; i < swatches.length; i++) {
    var sw = swatches[i];
    var props = sw.properties;
    var mdl, cs, cn, cv;
    switch (props.model) {
        case 1768844664:
            mdl = "MixedINK";
            break;
        case 1886548851:
            mdl = "Process";
            break;
        case 1919248243:
            mdl = "Registration";
            break;
        case 1936748404:
            mdl = "SpotColor";
            break;

        default:
            break;
    }

    switch (props.space) {
        case 1129142603:
            cs = "CMYK";
            break;
        case 1665941826:
            cs = "LAB";
            break;
        case 1666009432:
            cs = "MixedInk";
            break;
        case 1666336578:
            cs = "RGB";
            break;

        default:
            break;
    }

    var cn = props.name;
    cv = props.colorValue;

    var ln = [sw.id, sw.index, sw.name, cs, mdl, cv].join('\t');
    
    file.writeln(ln);
    //txt.push([sw.id,sw.index,sw.label,sw.name,color.model,color.space].join(","));
    //file.writeln(sw.id,sw.index,sw.label,sw.name,color.model,color.space);
}

file.close();