Class NEHRDemo.Validate.ValidateIssue Extends (%Persistent, %XML.Adaptor, %JSON.Adaptor)
{

Property ResourceType As %String;

Property Reason As %String(MAXLEN = 256);

Property Position As %String(MAXLEN = 256);

Relationship Log As NEHRDemo.Logs.DataExceptionLog [ Cardinality = parent, Inverse = Issues ];

Storage Default
{
<Data name="ValidateIssueDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ResourceType</Value>
</Value>
<Value name="3">
<Value>Reason</Value>
</Value>
<Value name="4">
<Value>Position</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Issues")</DataLocation>
<DefaultData>ValidateIssueDefaultData</DefaultData>
<IdLocation>^NEHRDemo.Logs.DataExceptio9D3C("Issues")</IdLocation>
<IndexLocation>^NEHRDemo.Val8AEA.ValidateIssueI</IndexLocation>
<StreamLocation>^NEHRDemo.Val8AEA.ValidateIssueS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
