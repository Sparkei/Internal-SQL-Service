Class Component.InternalSQL.GenericInternalSQLService Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

Property SQLQuery As %String(MAXLEN = "");

/// Note Parmameters are not implemented. This is here if required later
Property Parameters As %String(MAXLEN = "");

Property Dialect As %String(VALUELIST = ",IRIS,MSSQL,Sybase");

Property SelectMode As %String(VALUELIST = ",Logical Mode:0,ODBC Mode:1,Display Mode:2");

Property ForwardComponentName As Ens.DataType.ConfigName;

Parameter SETTINGS = "SQLQuery:Basic,SelectMode:Basic,Parameters:Basic,Dialect:Basic,ForwardComponentName:Basic";

/// Description
Method OnProcessInput() As %Status
{
   
    Set sc = $$$OK
    set result=##class(EnsLib.SQL.Snapshot).%New()
    set SelectModeNumber=$PIECE(..SelectMode,":",2)
    set SQLStatement = ##class(%SQL.Statement).%New(SelectModeNumber,,..Dialect)
    set tSQL=..SQLQuery
    set sc= SQLStatement.%Prepare(..SQLQuery)
    set rset = SQLStatement.%Execute()
    $$$TRACE(rset)
    set tSC=result.ImportFromResultSet(rset)
    set tSC=..SendRequestAsync(..ForwardComponentName,result,0)  Quit:$$$ISERR(tSC)
    Return sc
}

}
