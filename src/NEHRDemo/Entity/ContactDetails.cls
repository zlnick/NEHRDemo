Class NEHRDemo.Entity.ContactDetails Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property address As list Of NEHRDemo.Entity.Address;

Property phone As list Of NEHRDemo.Entity.Phone;

Storage Default
{
<Data name="ContactDetailsState">
<Value name="1">
<Value>address</Value>
</Value>
<Value name="2">
<Value>phone</Value>
</Value>
</Data>
<State>ContactDetailsState</State>
<StreamLocation>^NEHRDemo.EnCBB3.ContactDetailsS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
