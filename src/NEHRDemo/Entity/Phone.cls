Class NEHRDemo.Entity.Phone Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property type As %String;

Property countryCode As %String;

Property areaCode As %String;

Property phoneNumber As %String;

Property extensionNumber As %String;

Storage Default
{
<Data name="PhoneState">
<Value name="1">
<Value>type</Value>
</Value>
<Value name="2">
<Value>countryCode</Value>
</Value>
<Value name="3">
<Value>areaCode</Value>
</Value>
<Value name="4">
<Value>phoneNumber</Value>
</Value>
<Value name="5">
<Value>extensionNumber</Value>
</Value>
</Data>
<State>PhoneState</State>
<StreamLocation>^NEHRDemo.Entity.PhoneS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
