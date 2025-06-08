Class NEHRDemo.Entity.PutEvent Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property controlHeader As NEHRDemo.Entity.ControlHeader;

Property patient As NEHRDemo.Entity.Patient;

Property event As NEHRDemo.Entity.Event;

Storage Default
{
<Data name="PutEventState">
<Value name="1">
<Value>controlHeader</Value>
</Value>
<Value name="2">
<Value>patient</Value>
</Value>
<Value name="3">
<Value>event</Value>
</Value>
</Data>
<State>PutEventState</State>
<StreamLocation>^NEHRDemo.Entity.PutEventS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
