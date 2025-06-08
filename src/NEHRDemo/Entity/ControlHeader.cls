Class NEHRDemo.Entity.ControlHeader Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property srcInstitution As %String;

Property srcApplication As %String;

Property msgID As %String;

Property msgSequenceID As %Integer;

Property msgDateTime As %String;

Property msgType As %String;

Storage Default
{
<Data name="ControlHeaderState">
<Value name="1">
<Value>srcInstitution</Value>
</Value>
<Value name="2">
<Value>srcApplication</Value>
</Value>
<Value name="3">
<Value>msgID</Value>
</Value>
<Value name="4">
<Value>msgSequenceID</Value>
</Value>
<Value name="5">
<Value>msgDateTime</Value>
</Value>
<Value name="6">
<Value>msgType</Value>
</Value>
</Data>
<State>ControlHeaderState</State>
<StreamLocation>^NEHRDemo.Entity.ControlHeaderS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
