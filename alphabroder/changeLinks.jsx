var numLinks=0; 
var note="";
for ( var p = 0; p < this.numPages; p++) 
{
var b = this.getPageBox("Crop", p);
var l = this.getLinks(p, b);
for (var i=0; i< l.length;i++){
  var link = l[i];
  link.setAction("app.launchURL('https://google.com')");
  for(var y in link)
  {
    note += ","+y+",`n";
  }
}
numLinks += l.length;
}

var annot = this.addAnnot({
    page: 0,
type: "Square",
rect: [20, 20, 100, 100],
    type: "Square",
    author: "Kevin.Noseworthy",
    contents: "Number of Links in Document is " + numLinks + "--" +note
    }); 