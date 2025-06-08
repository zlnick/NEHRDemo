Class NEHRDemo.Messages.MockMHA.MatchResponse Extends (Ens.Response, %XML.Adaptor)
{

Property MatchResult As %String;

Property NID As %String;

Storage Default
{
<Data name="MatchResponseDefaultData">
<Subscript>"MatchResponse"</Subscript>
<Value name="1">
<Value>MatchResult</Value>
</Value>
<Value name="2">
<Value>NID</Value>
</Value>
</Data>
<DefaultData>MatchResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
