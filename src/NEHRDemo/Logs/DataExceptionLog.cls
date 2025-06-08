Class NEHRDemo.Logs.DataExceptionLog Extends (%Persistent, %XML.Adaptor)
{

Property MessageId As %String;

Property SessionId As %String;

Property Content As %Stream.GlobalCharacter;

Property Cause As %String;

Property Details As NEHRDemo.Validate.ValidateResult;

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
<Value>Content</Value>
</Value>
<Value name="5">
<Value>Cause</Value>
</Value>
<Value name="6">
<Value>Details</Value>
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
