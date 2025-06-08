Class NEHRDemo.Entity.Address Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property type As %String;

Property streetLine1 As %String;

Property streetLine2 As %String;

Property streetLine3 As %String;

Property streetLine4 As %String;

Property city As %String;

Property country As %String;

Property postalCode As %String;

Storage Default
{
<Data name="AddressState">
<Value name="1">
<Value>type</Value>
</Value>
<Value name="2">
<Value>streetLine1</Value>
</Value>
<Value name="3">
<Value>streetLine2</Value>
</Value>
<Value name="4">
<Value>streetLine3</Value>
</Value>
<Value name="5">
<Value>streetLine4</Value>
</Value>
<Value name="6">
<Value>city</Value>
</Value>
<Value name="7">
<Value>country</Value>
</Value>
<Value name="8">
<Value>postalCode</Value>
</Value>
</Data>
<State>AddressState</State>
<StreamLocation>^NEHRDemo.Entity.AddressS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
