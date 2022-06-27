let
    Source = Excel.CurrentWorkbook(){[Name="Table5"]}[Content],
    #"Capitalized Each Word" = Table.TransformColumns(Source,{{"Item Colors", Text.Proper, type text}}),
    #"Replaced Value" = Table.ReplaceValue(#"Capitalized Each Word",";","",Replacer.ReplaceText,{"Item Colors"}),
    #"Changed Type" = Table.TransformColumnTypes(#"Replaced Value",{{"Item Colors", type text}, {"Item Colors - Copy", type text}, {"Swatch ID", type text}}),
    #"Filtered Rows1" = Table.SelectRows(#"Changed Type", each ([Swatch ID] <> null)),
    #"Split Column by Delimiter" = Table.SplitColumn(#"Filtered Rows1", "Swatch ID", Splitter.SplitTextByDelimiter(",", QuoteStyle.None), {"Swatch ID.1", "Swatch ID.2"}),
    #"Renamed Columns" = Table.RenameColumns(#"Split Column by Delimiter",{{"Swatch ID.1", "swatch1"}, {"Swatch ID.2", "swatch2"}}),
    #"Added Custom" = Table.AddColumn(#"Renamed Columns", "allswatches", each Text.Combine(List.Distinct(List.Combine({Table.Column(#"Renamed Columns","swatch1"),Table.Column(#"Renamed Columns","swatch2")})),",")),
    #"Removed Columns" = Table.RemoveColumns(#"Added Custom",{"Item Colors - Copy"}),
    #"Added Custom1" = Table.AddColumn(#"Removed Columns", "colortokey", each if [swatch2] = null and [swatch1] <> null then Text.Combine({""""&[Item Colors]&"""",""""&[swatch1]&""""},"=") else let 
clist=Text.Split(Text.Replace([Item Colors],":","/"),"/"), 
c1 = Text.Combine({""""&List.First(clist)&"""",""""&[swatch1]&""""},"="),
c2 = Text.Combine({""""&List.First(List.Skip(clist,1))&"""",""""&[swatch2]&""""},"=")
in Text.Combine({c1,c2},",")),
    #"Split Column by Delimiter1" = Table.ExpandListColumn(Table.TransformColumns(#"Added Custom1", {{"colortokey", Splitter.SplitTextByDelimiter(",", QuoteStyle.None), let itemType = (type nullable text) meta [Serialized.Text = true] in type {itemType}}}), "colortokey"),
    #"Trimmed Text" = Table.TransformColumns(#"Split Column by Delimiter1",{{"colortokey", Text.Trim, type text}}),
    #"Added Conditional Column" = Table.AddColumn(#"Trimmed Text", "Custom", each if Text.Contains([colortokey], "=") then 1 else 0),
    #"Filtered Rows" = Table.SelectRows(#"Added Conditional Column", each [Custom] = 1),
    #"Split Column by Delimiter2" = Table.SplitColumn(#"Filtered Rows", "colortokey", Splitter.SplitTextByDelimiter("=", QuoteStyle.Csv), {"colortokey.1", "colortokey.2"}),
    #"Changed Type2" = Table.TransformColumnTypes(#"Split Column by Delimiter2",{{"colortokey.1", type text}, {"colortokey.2", type text}}),
    #"Removed Columns1" = Table.RemoveColumns(#"Changed Type2",{"Item Colors", "swatch1", "swatch2", "allswatches", "Custom"}),
    #"Trimmed Text1" = Table.TransformColumns(#"Removed Columns1",{{"colortokey.1", Text.Trim, type text}}),
    #"Renamed Columns1" = Table.RenameColumns(#"Trimmed Text1",{{"colortokey.1", "colorname"}, {"colortokey.2", "swatchname"}}),
    #"Removed Duplicates" = Table.Distinct(#"Renamed Columns1"),
    #"Sorted Rows" = Table.Sort(#"Removed Duplicates",{{"colorname", Order.Ascending}, {"swatchname", Order.Ascending}})
in
    #"Sorted Rows"