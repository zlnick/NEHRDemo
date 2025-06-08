Class NEHRDemo.Entity.Patient Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property identification As list Of NEHRDemo.Entity.Identification;

Property name As NEHRDemo.Entity.Name;

Property aliasName As NEHRDemo.Entity.Name;

Property contactDetails As NEHRDemo.Entity.ContactDetails;

Property dateOfBirth As %String;

Property countryOfBirth As %String;

Property gender As %String;

Property emailAddress As %String;

Property nationality As %String;

Property race As %String;

Property residencyStatus As %String;

Property language As %String;

Property maritalStatus As %String;

Property occupation As %String;

Property VIPFlag As %String;

Property VVIPFlag As %String;

Property dateOfDeath As %String;

Property deathIndicator As %String;

Property religion As %String;

Property nextOfKin As list Of NEHRDemo.Entity.NextOfKin;

Storage Default
{
<Data name="PatientState">
<Value name="1">
<Value>identification</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>aliasName</Value>
</Value>
<Value name="4">
<Value>contactDetails</Value>
</Value>
<Value name="5">
<Value>dateOfBirth</Value>
</Value>
<Value name="6">
<Value>countryOfBirth</Value>
</Value>
<Value name="7">
<Value>gender</Value>
</Value>
<Value name="8">
<Value>emailAddress</Value>
</Value>
<Value name="9">
<Value>nationality</Value>
</Value>
<Value name="10">
<Value>race</Value>
</Value>
<Value name="11">
<Value>residencyStatus</Value>
</Value>
<Value name="12">
<Value>language</Value>
</Value>
<Value name="13">
<Value>maritalStatus</Value>
</Value>
<Value name="14">
<Value>occupation</Value>
</Value>
<Value name="15">
<Value>VIPFlag</Value>
</Value>
<Value name="16">
<Value>VVIPFlag</Value>
</Value>
<Value name="17">
<Value>dateOfDeath</Value>
</Value>
<Value name="18">
<Value>deathIndicator</Value>
</Value>
<Value name="19">
<Value>religion</Value>
</Value>
<Value name="20">
<Value>nextOfKin</Value>
</Value>
</Data>
<State>PatientState</State>
<StreamLocation>^NEHRDemo.Entity.PatientS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
