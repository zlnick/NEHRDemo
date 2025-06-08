Class NEHRDemo.Messages.AddPatientResponse Extends Ens.Response
{

Property controlHeader As NEHRDemo.Entity.ControlHeader;

Property resultStatus As NEHRDemo.Entity.ResultStatus;

Property doc As %Stream.GlobalCharacter;

Storage Default
{
<Data name="AddPatientResponseDefaultData">
<Subscript>"AddPatientResponse"</Subscript>
<Value name="1">
<Value>controlHeader</Value>
</Value>
<Value name="2">
<Value>resultStatus</Value>
</Value>
<Value name="3">
<Value>doc</Value>
</Value>
</Data>
<DefaultData>AddPatientResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
