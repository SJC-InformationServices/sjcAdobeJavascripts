#target "indesign";


var txt= "";
var f = File.openDialog("Select Swatch Json File","*.json");
f.open("r");
while(!f.eof)
{
    txt+=f.readln();
}
f.close();
//eval("{"+txt+"}"); // return undefined

var obj = eval('{'+txt+'}');
var doc = app.activeDocument;
var cs;

for(var i=0;i<obj.length;i++)
{
    try {
    var sw = obj[i];
    
    var csa= sw.space;
    
    if(sw["space"]["Value"]=="CMYK")
    {
    cs = ColorSpace.CMYK;
    }else{
    cs = ColorSpace.RGB;
    }
    n = sw["{Name}"];
    var nums=[];
    var v = sw.color_values.split(",");
    for(var a=0;a<v.length;a++){
        nums.push(Math.round(v[a]));
    }
    var m = ColorModel.PROCESS;
    var vals={"colorValue":nums,"space":cs,"name":n,"label":n,"model":m};
          
            try {
                var c = doc.colors.add(vals);
            var t = doc.tints.add(vals.name);
            }catch(e){
                
            }
        }catch(e){}
                
}
alert('done');