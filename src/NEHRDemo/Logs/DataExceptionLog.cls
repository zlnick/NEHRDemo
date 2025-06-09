Class NEHRDemo.Logs.DataExceptionLog Extends (%Persistent, %XML.Adaptor)
{

Property MessageId As %String;

Property SessionId As %String;

Property Content As %Stream.GlobalCharacter;

Property Cause As %String;

Property Details As NEHRDemo.Validate.ValidateResult;

Storage Default
{
<Data name="DataExceptionLogDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>MessageId</Value>
</Value>
<Value name="3">
<Value>SessionId</Value>
</Value>
<Value name="4">
<Value>Content</Value>
</Value>
<Value name="5">
<Value>Cause</Value>
</Value>
<Value name="6">
<Value>Details</Value>
</Value>
</Data>
<DataLocation>^NEHRDemo.Logs.DataExceptio9D3D</DataLocation>
<DefaultData>DataExceptionLogDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^NEHRDemo.Logs.DataExceptio9D3D</IdLocation>
<IndexLocation>^NEHRDemo.Logs.DataExceptio9D3I</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Cause">
<AverageFieldSize>13</AverageFieldSize>
<OutlierSelectivity>.999999:"NIDMismatch"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Content">
<OutlierSelectivity>.999999:$lb("1","%Stream.GlobalCharacter","^NEHRDemo.Logs.DataExceptio9D3S")</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Details">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="MessageId">
<AverageFieldSize>5</AverageFieldSize>
<OutlierSelectivity>.999999:208</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="SessionId">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:208</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^NEHRDemo.Logs.DataExceptio9D3S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
