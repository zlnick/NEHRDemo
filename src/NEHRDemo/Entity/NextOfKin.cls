Class NEHRDemo.Entity.NextOfKin Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property name As %String;

Property phone As %String;

Property relationship As %String;

Property email As %String;

Storage Default
{
<Data name="NextOfKinState">
<Value name="1">
<Value>name</Value>
</Value>
<Value name="2">
<Value>phone</Value>
</Value>
<Value name="3">
<Value>relationship</Value>
</Value>
<Value name="4">
<Value>email</Value>
</Value>
</Data>
<State>NextOfKinState</State>
<StreamLocation>^NEHRDemo.Entity.NextOfKinS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
