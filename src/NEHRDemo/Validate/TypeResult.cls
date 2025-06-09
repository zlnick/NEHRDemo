Class NEHRDemo.Validate.TypeResult Extends (%Persistent, %XML.Adaptor)
{

Property ResourceType As %String;

Property Issues As list Of NEHRDemo.Validate.ValidateIssue;

Storage Default
{
<Data name="TypeResultDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ResourceType</Value>
</Value>
<Value name="3">
<Value>Issues</Value>
</Value>
</Data>
<DataLocation>^NEHRDemo.Validate.TypeResultD</DataLocation>
<DefaultData>TypeResultDefaultData</DefaultData>
<IdLocation>^NEHRDemo.Validate.TypeResultD</IdLocation>
<IndexLocation>^NEHRDemo.Validate.TypeResultI</IndexLocation>
<StreamLocation>^NEHRDemo.Validate.TypeResultS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
