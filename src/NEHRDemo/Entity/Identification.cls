Class NEHRDemo.Entity.Identification Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property id As %String;

Property MRNNumber As %String;

Property type As %String;

Property patientMergeType As %String;

Storage Default
{
<Data name="IdentificationState">
<Value name="1">
<Value>id</Value>
</Value>
<Value name="2">
<Value>MRNNumber</Value>
</Value>
<Value name="3">
<Value>type</Value>
</Value>
<Value name="4">
<Value>patientMergeType</Value>
</Value>
</Data>
<State>IdentificationState</State>
<StreamLocation>^NEHRDemo.EnCBB3.IdentificationS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
