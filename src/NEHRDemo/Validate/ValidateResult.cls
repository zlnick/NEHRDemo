Class NEHRDemo.Validate.ValidateResult Extends (%Persistent, %XML.Adaptor)
{

Property MessageId As %String;

Property SessionId As %String;

Property ResourceType As %String;

Property Issues As list Of NEHRDemo.Validate.ValidateIssue;

Storage Default
{
<Data name="ValidateResultDefaultData">
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
<Value>ResourceType</Value>
</Value>
<Value name="5">
<Value>Issues</Value>
</Value>
</Data>
<DataLocation>^NEHRDemo.Va8AEA.ValidateResultD</DataLocation>
<DefaultData>ValidateResultDefaultData</DefaultData>
<IdLocation>^NEHRDemo.Va8AEA.ValidateResultD</IdLocation>
<IndexLocation>^NEHRDemo.Va8AEA.ValidateResultI</IndexLocation>
<StreamLocation>^NEHRDemo.Va8AEA.ValidateResultS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
