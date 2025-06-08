Class NEHRDemo.Messages.AddLogResponse Extends Ens.Response
{

Property logId As %String;

Storage Default
{
<Data name="AddLogResponseDefaultData">
<Subscript>"AddLogResponse"</Subscript>
<Value name="1">
<Value>logId</Value>
</Value>
</Data>
<DefaultData>AddLogResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
