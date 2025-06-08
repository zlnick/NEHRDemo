Class NEHRDemo.Entity.MovementType Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property code As %String;

Property codingSchemeName As %String;

Property codingSchemeVersion As %String;

Property textDescription As %String;

Storage Default
{
<Data name="MovementTypeState">
<Value name="1">
<Value>code</Value>
</Value>
<Value name="2">
<Value>codingSchemeName</Value>
</Value>
<Value name="3">
<Value>codingSchemeVersion</Value>
</Value>
<Value name="4">
<Value>textDescription</Value>
</Value>
</Data>
<State>MovementTypeState</State>
<StreamLocation>^NEHRDemo.Entity.MovementTypeS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
