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
<IdLocation>^NEHRDemo.TempCFAF.NoNIDRecordsD</IdLocation>
<IndexLocation>^NEHRDemo.TempCFAF.NoNIDRecordsI</IndexLocation>
<StreamLocation>^NEHRDemo.TempCFAF.NoNIDRecordsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
