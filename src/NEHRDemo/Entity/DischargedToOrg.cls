Class NEHRDemo.Entity.DischargedToOrg Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property code As %String;

Property codingSchemeName As %String;

Property codingSchemeVersion As %String;

Property textDescription As %String;

Storage Default
{
<Data name="DischargedToOrgState">
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
<State>DischargedToOrgState</State>
<StreamLocation>^NEHRDemo.ECBB3.DischargedT3CEBS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
