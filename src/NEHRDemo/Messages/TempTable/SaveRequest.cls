Class NEHRDemo.Messages.TempTable.SaveRequest Extends Ens.Request
{

Property MessageId As %String;

Property SessionId As %String;

Property doc As EnsLib.EDI.XML.Document;

Storage Default
{
<Data name="SaveRequestDefaultData">
<Subscript>"SaveRequest"</Subscript>
<Value name="1">
<Value>MessageId</Value>
</Value>
<Value name="2">
<Value>SessionId</Value>
</Value>
<Value name="3">
<Value>doc</Value>
</Value>
</Data>
<DefaultData>SaveRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
