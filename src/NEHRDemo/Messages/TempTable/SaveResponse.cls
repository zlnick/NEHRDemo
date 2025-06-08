Class NEHRDemo.Messages.TempTable.SaveResponse Extends Ens.Response
{

Property RecordId As %String;

Storage Default
{
<Data name="SaveResponseDefaultData">
<Subscript>"SaveResponse"</Subscript>
<Value name="1">
<Value>RecordId</Value>
</Value>
</Data>
<DefaultData>SaveResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
