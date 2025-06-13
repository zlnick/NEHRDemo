/// 
Class NEHRDemo.Analytics.MessageHeaderCube Extends %DeepSee.CubeDefinition [ DependsOn = Ens.MessageHeader, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="MessageHeaderCube" displayName="MessageHeaderCube" disabled="false" abstract="false" sourceClass="Ens.MessageHeader" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="MessageBodyClassName" disabled="false" hasAll="false" allCaption="All MessageBodyClassName" allDisplayName="MessageBodyClassName" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="MessageBodyClassName" disabled="false" sourceProperty="MessageBodyClassName" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="SourceConfigName" disabled="false" hasAll="false" allCaption="All SourceConfigName" allDisplayName="SourceConfigName" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="SourceConfigName" disabled="false" sourceProperty="SourceConfigName" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="EventDimension" disabled="false" hasAll="false" allCaption="All IsValidEvent" allDisplayName="IsValidEvent" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="IsValid" displayName="IsValid" disabled="false" sourceExpression="$CASE(##Class(NEHRDemo.Analytics.RelHelper).getLogIdByMsgHeaderId(%source.%ID),&quot;&quot;:&quot;valid&quot;,:&quot;invalid&quot;)" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="ProcessedTimeDimensions" disabled="false" hasAll="false" allCaption="All TimeProcessed" allDisplayName="TimeProcessed" sourceExpression="$ZDTH(%source.TimeProcessed,3)" type="time" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="Year" disabled="false" hidden="false">
      <level name="Year" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
    </hierarchy>
    <hierarchy name="MonthYear" disabled="false" hidden="false">
      <level name="MonthYear" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
    </hierarchy>
    <hierarchy name="DayMonthYear" disabled="false" hidden="false">
      <level name="DayMonthYear" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="8">
      </level>
    </hierarchy>
  </dimension>
  <relationship name="log_relationship" disabled="false" sourceExpression="##Class(NEHRDemo.Analytics.RelHelper).getLogIdByMsgHeaderId(%source.%ID)" factName="RxLog" relatedCube="LogCube" cardinality="one" factNumber="4">
  </relationship>
</cube>
}

Parameter DOMAIN;

}
