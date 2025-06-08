Class NEHRDemo.Entity.ResultStatus Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property statusCode As %String;

Property statusDescription As %String;

Storage Default
{
<Data name="ResultStatusState">
<Value name="1">
<Value>statusCode</Value>
</Value>
<Value name="2">
<Value>statusDescription</Value>
</Value>
</Data>
<State>ResultStatusState</State>
<StreamLocation>^NEHRDemo.Entity.ResultStatusS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
