Class NEHRDemo.Logs.DataExceptionLog Extends (%Persistent, %XML.Adaptor)
{

Property MessageId As %String;

Property SessionId As %String;

Property srcInstitution As %String;

Property srcApplication As %String;

Property msgID As %String;

Property SN As %String;

Property eventTypeCode As %String;

Property Content As %Stream.GlobalCharacter;

Property Cause As %String;

Property IsValid As %Boolean;

Property TimeHappened As Ens.DataType.UTC;

Relationship Issues As NEHRDemo.Validate.ValidateIssue [ Cardinality = children, Inverse = Log ];

Index MessageId On MessageId;

Index SessionId On SessionId;

Index srcInstitution On srcInstitution [ Type = bitmap ];

Index srcApplication On srcApplication [ Type = bitmap ];

Index SN On SN;

Index eventTypeCode On eventTypeCode [ Type = bitmap ];

Index Cause On Cause [ Type = bitmap ];

Index IsValid On IsValid [ Type = bitmap ];

Index TimeHappened On TimeHappened;

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
<Value>msgID</Value>
</Value>
<Value name="7">
<Value>SN</Value>
</Value>
<Value name="8">
<Value>eventTypeCode</Value>
</Value>
<Value name="9">
<Value>Content</Value>
</Value>
<Value name="10">
<Value>Cause</Value>
</Value>
<Value name="11">
<Value>IsValid</Value>
</Value>
<Value name="12">
<Value>TimeHappened</Value>
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
