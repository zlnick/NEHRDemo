Class NEHRDemo.Messages.MockMHA.MatchRequest Extends (Ens.Request, %XML.Adaptor)
{

Property PatientInfo As NEHRDemo.Entity.Patient;

Storage Default
{
<Data name="MatchRequestDefaultData">
<Subscript>"MatchRequest"</Subscript>
<Value name="1">
<Value>PatientInfo</Value>
</Value>
</Data>
<DefaultData>MatchRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
