Class InternalSQLSampleOperation Extends Ens.BusinessOperation
{
Method GetDataTable(pRequest As EnsLib.SQL.Snapshot, html As %String) As %Status
{
set sc=$$$OK
Try{
  //first html obj can be if the styling needs passed
  if $ISOBJECT(html){set html=""}
  //loop get column titles 
  set ColumnIteration=1
  set ColumnCount=pRequest.%ResultColumnCountGet()
  
  set html=html_" <table class=""tg"">"
  set html= html_ " " _"<tr>"
  set meta=pRequest.%GetMetadata() //this is like raw text of the result using it to get the column titles out
  if ColumnCount>0{
    while ColumnIteration<=ColumnCount{
      
      set html= html_ " <th>"_  meta.columns.GetAt(ColumnIteration).colName _" </th>"
      set ColumnIteration=ColumnIteration+1
    }

  }
  set html= html_ " " _"</tr>"
  //not get the data from each row. In html need a <tr> and a td. 
  set coldataiteration=1
  While pRequest.%Next() {
    set html= html_ " <tr>"
    while coldataiteration <=ColumnCount{
      set html= html_ " <td> "_pRequest.%GetData(coldataiteration) _" </td>"
      set coldataiteration=coldataiteration+1
    }
    
    set html= html_ " </tr>"
    set coldataiteration=1
  }
  set html= html_ " " _"</table>"
  $$$TRACE(html)
quit sc
}
Catch err {
quit err.AsStatus()
}
}
XData MessageMap
{
<MapItems>
  <MapItem MessageType="EnsLib.SQL.Snapshot">
    <Method>Test</Method>
  </MapItem>
</MapItems>
}
}
