Class NEHRDemo.Entity.DischargeInformation Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property dischargedToOrg As NEHRDemo.Entity.DischargedToOrg;

Property dischargeOutcome As %String;

Property dischargeDisposition As NEHRDemo.Entity.DischargeDisposition;

Storage Default
{
<Data name="DischargeInformationState">
<Value name="1">
<Value>dischargedToOrg</Value>
</Value>
<Value name="2">
<Value>dischargeOutcome</Value>
</Value>
<Value name="3">
<Value>dischargeDisposition</Value>
</Value>
</Data>
<State>DischargeInformationState</State>
<StreamLocation>^NEHRDemo.ECBB3.DischargeIn2E2AS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
