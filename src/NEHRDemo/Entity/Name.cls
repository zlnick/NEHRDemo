Class NEHRDemo.Entity.Name Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property value As %String;

Property title As %String;

Storage Default
{
<Data name="NameState">
<Value name="1">
<Value>value</Value>
</Value>
<Value name="2">
<Value>title</Value>
</Value>
</Data>
<State>NameState</State>
<StreamLocation>^NEHRDemo.Entity.NameS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
