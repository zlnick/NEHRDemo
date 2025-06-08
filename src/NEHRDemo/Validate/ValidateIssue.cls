Class NEHRDemo.Validate.ValidateIssue Extends (%Persistent, %XML.Adaptor)
{

Property Reason As %String;

Property Position As %String;

Storage Default
{
<Data name="ValidateIssueDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Reason</Value>
</Value>
<Value name="3">
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
