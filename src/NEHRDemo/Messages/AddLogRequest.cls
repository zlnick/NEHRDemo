Class NEHRDemo.Messages.AddLogRequest Extends Ens.Request
{

Property log As NEHRDemo.Logs.DataExceptionLog;

Storage Default
{
<Data name="AddLogRequestDefaultData">
<Subscript>"AddLogRequest"</Subscript>
<Value name="1">
<Value>log</Value>
</Value>
</Data>
<DefaultData>AddLogRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
