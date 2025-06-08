Class NEHRDemo.Messages.AddPatientRequest Extends Ens.Request
{

Property putEvent As NEHRDemo.Entity.PutEvent;

Storage Default
{
<Data name="AddPatientRequestDefaultData">
<Subscript>"AddPatientRequest"</Subscript>
<Value name="1">
<Value>payload</Value>
</Value>
<Value name="2">
<Value>putEvent</Value>
</Value>
</Data>
<DefaultData>AddPatientRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
