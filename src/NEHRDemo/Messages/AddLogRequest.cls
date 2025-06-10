Class NEHRDemo.Messages.AddLogRequest Extends Ens.Request
{

Property log As NEHRDemo.Logs.DataExceptionLog;

/// Callback for object deletion
ClassMethod %OnDelete(oid As %ObjectIdentity) As %Status [ Private ]
{
      // Delete the property object references.
      Set tSC = $$$OK, tThis = ##class(NEHRDemo.Messages.AddLogRequest).%Open(oid)
      If $ISOBJECT(tThis.log) Set tSC = ##class(NEHRDemo.Logs.DataExceptionLog).%DeleteId(tThis.log.%Id())
      Quit tSC
}

/// Callback/Trigger for SQL delete
Trigger OnDelete [ Event = DELETE ]
{
      // Delete the property object references. {%%ID} holds the id of the record being deleted.
      Set tID={%%ID}
      Set tThis = ##class(NEHRDemo.Messages.AddLogRequest).%OpenId(tID)
      If $ISOBJECT(tThis.log) Set tSC = ##class(NEHRDemo.Logs.DataExceptionLog).%DeleteId(tThis.log.%Id())
      Quit
}

Storage Default
{
<Data name="AddLogRequestDefaultData">
<Subscript>"AddLogRequest"</Subscript>
<Value name="1">
<Value>log</Value>
</Value>
</Data>
<DefaultData>AddLogRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
