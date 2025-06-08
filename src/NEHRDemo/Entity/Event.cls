Class NEHRDemo.Entity.Event Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property recordIdentifier As %String;

Property id As %String;

Property movementSequenceNo As %String;

Property eventStartDate As %String;

Property eventEndDate As %String;

Property cancellationNotice As %String;

Property institution As %String;

Property serviceSpecialty As NEHRDemo.Entity.ServiceSpecialty;

Property patientType As NEHRDemo.Entity.PatientType;

Property eventType As NEHRDemo.Entity.EventType;

Property attendingClinician As NEHRDemo.Entity.Clinician;

Property admittingClinician As NEHRDemo.Entity.Clinician;

Property dischargingClinician As NEHRDemo.Entity.Clinician;

Property referringClinician As NEHRDemo.Entity.Clinician;

Property dischargeInformation As NEHRDemo.Entity.DischargeInformation;

Property movementType As NEHRDemo.Entity.MovementType;

Storage Default
{
<Data name="EventState">
<Value name="1">
<Value>recordIdentifier</Value>
</Value>
<Value name="2">
<Value>id</Value>
</Value>
<Value name="3">
<Value>movementSequenceNo</Value>
</Value>
<Value name="4">
<Value>eventStartDate</Value>
</Value>
<Value name="5">
<Value>eventEndDate</Value>
</Value>
<Value name="6">
<Value>cancellationNotice</Value>
</Value>
<Value name="7">
<Value>institution</Value>
</Value>
<Value name="8">
<Value>serviceSpecialty</Value>
</Value>
<Value name="9">
<Value>patientType</Value>
</Value>
<Value name="10">
<Value>eventType</Value>
</Value>
<Value name="11">
<Value>attendingClinician</Value>
</Value>
<Value name="12">
<Value>admittingClinician</Value>
</Value>
<Value name="13">
<Value>dischargingClinician</Value>
</Value>
<Value name="14">
<Value>referringClinician</Value>
</Value>
<Value name="15">
<Value>dischargeInformation</Value>
</Value>
<Value name="16">
<Value>movementType</Value>
</Value>
</Data>
<State>EventState</State>
<StreamLocation>^NEHRDemo.Entity.EventS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
