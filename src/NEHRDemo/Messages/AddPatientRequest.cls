Class NEHRDemo.Messages.AddPatientRequest Extends Ens.Request
{

Property patient As HS.SDA3.Patient;

Storage Default
{
<Data name="AddPatientRequestDefaultData">
<Subscript>"AddPatientRequest"</Subscript>
<Value name="1">
<Value>patient</Value>
</Value>
</Data>
<DefaultData>AddPatientRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
