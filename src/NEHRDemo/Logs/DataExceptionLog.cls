Class NEHRDemo.Logs.DataExceptionLog Extends (%Persistent, %XML.Adaptor)
{

Property MessageId As %String;

Property SessionId As %String;

Property srcInstitution As %String;

Property srcApplication As %String;

Property eventTypeCode As %String;

Property Content As %Stream.GlobalCharacter;

Property Cause As %String;

Property Issues As list Of NEHRDemo.Validate.ValidateIssue;

/// Callback for object deletion
ClassMethod %OnDelete(oid As %ObjectIdentity) As %Status [ Private ]
{
      // Delete the property object references.
      Set tSC = $$$OK, tThis = ##class(NEHRDemo.Logs.DataExceptionLog).%Open(oid)
      If $ISOBJECT(tThis.Issues) {
        For i=1:1:tThis.Issues.Count()
        {
            Set tSC = ##class(NEHRDemo.Validate.ValidateIssue).%DeleteId(tThis.Issues.GetAt(i).%Id())
        }
      }
      Quit tSC
}

/// Callback/Trigger for SQL delete
Trigger OnDelete [ Event = DELETE ]
{
      // Delete the property object references. {%%ID} holds the id of the record being deleted.
      Set tID={%%ID}
      Set tThis = ##class(NEHRDemo.Logs.DataExceptionLog).%OpenId(tID)
      If $ISOBJECT(tThis.Issues) {
        For i=1:1:tThis.Issues.Count()
        {
            Set tSC = ##class(NEHRDemo.Validate.ValidateIssue).%DeleteId(tThis.Issues.GetAt(i).%Id())
        }
      }
      Quit
}

Storage Default
{
<Data name="DataExceptionLogDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>MessageId</Value>
</Value>
<Value name="3">
<Value>SessionId</Value>
</Value>
<Value name="4">
<Value>srcInstitution</Value>
</Value>
<Value name="5">
<Value>srcApplication</Value>
</Value>
<Value name="6">
<Value>eventTypeCode</Value>
</Value>
<Value name="7">
<Value>Content</Value>
</Value>
<Value name="8">
<Value>Cause</Value>
</Value>
<Value name="9">
<Value>Issues</Value>
</Value>
</Data>
<DataLocation>^NEHRDemo.Logs.DataExceptio9D3D</DataLocation>
<DefaultData>DataExceptionLogDefaultData</DefaultData>
<IdLocation>^NEHRDemo.Logs.DataExceptio9D3D</IdLocation>
<IndexLocation>^NEHRDemo.Logs.DataExceptio9D3I</IndexLocation>
<StreamLocation>^NEHRDemo.Logs.DataExceptio9D3S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
