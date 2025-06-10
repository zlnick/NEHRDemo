Class NEHRDemo.Validate.ValidateIssue Extends (%Persistent, %XML.Adaptor, %JSON.Adaptor)
{

Property ResourceType As %String;

Property Reason As %String(MAXLEN = 256);

Property Position As %String(MAXLEN = 256);

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
<DataLocation>^NEHRDemo.Val8AEA.ValidateIssueD</DataLocation>
<DefaultData>ValidateIssueDefaultData</DefaultData>
<IdLocation>^NEHRDemo.Val8AEA.ValidateIssueD</IdLocation>
<IndexLocation>^NEHRDemo.Val8AEA.ValidateIssueI</IndexLocation>
<StreamLocation>^NEHRDemo.Val8AEA.ValidateIssueS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
