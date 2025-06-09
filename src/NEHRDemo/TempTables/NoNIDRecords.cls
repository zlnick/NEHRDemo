Class NEHRDemo.TempTables.NoNIDRecords Extends (%Persistent, %XML.Adaptor)
{

Property MessageId As %String;

Property SessionId As %String;

Property content As %Stream.GlobalCharacter;

Storage Default
{
<Data name="NoNIDRecordsDefaultData">
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
<Value>content</Value>
</Value>
</Data>
<DataLocation>^NEHRDemo.TempCFAF.NoNIDRecordsD</DataLocation>
<DefaultData>NoNIDRecordsDefaultData</DefaultData>
<ExtentSize>2</ExtentSize>
<IdLocation>^NEHRDemo.TempCFAF.NoNIDRecordsD</IdLocation>
<IndexLocation>^NEHRDemo.TempCFAF.NoNIDRecordsI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="MessageId">
<AverageFieldSize>5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="SessionId">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="content">
<Selectivity>50.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^NEHRDemo.TempCFAF.NoNIDRecordsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
