Class NEHRDemo.Entity.Clinician Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property id As %String;

Property name As %String;

Storage Default
{
<Data name="ClinicianState">
<Value name="1">
<Value>id</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<State>ClinicianState</State>
<StreamLocation>^NEHRDemo.Entity.ClinicianS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
