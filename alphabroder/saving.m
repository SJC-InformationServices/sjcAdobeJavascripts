let 
x = [color_1],
cnt = 1, 
rows = Table.SelectRows(SwatchesCap,each [Item Colors] = x),
seperator = List.First(Table.Column(rows,"Seperator")),
colors = List.First(Table.Column(rows,"Swatch ID")),
c = 
if seperator = null then colors 
else if 
cnt = 1 then List.First(Text.Split(colors,",")) 
else List.First(List.Skip(Text.Split(colors,","),1)),
in 
d

 let swatchlookup = (c,idx) => 
    if c = null then null else 
    let rows = Table.SelectRows(SwatchesCap, each [Item Colors] = c),
        seperator = List.First(Table.Column(rows,"Seperator")),
        colors = List.First(Table.Column(rows,"Swatch ID"))
    in colors
  in swatchlookup