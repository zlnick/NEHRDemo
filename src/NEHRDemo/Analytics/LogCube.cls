/// 
Class NEHRDemo.Analytics.LogCube Extends %DeepSee.CubeDefinition [ DependsOn = NEHRDemo.Logs.DataExceptionLog, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="LogCube" displayName="LogCube" disabled="false" abstract="false" sourceClass="NEHRDemo.Logs.DataExceptionLog" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="Cause" disabled="false" hasAll="false" allCaption="All Cause" allDisplayName="Cause" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Cause" disabled="false" sourceProperty="Cause" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="srcInstitution" disabled="false" hasAll="false" allCaption="All srcInstitution" allDisplayName="srcInstitution" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="srcInstitution" disabled="false" sourceProperty="srcInstitution" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="eventTypeCode" disabled="false" hasAll="false" allCaption="All eventTypeCode" allDisplayName="eventTypeCode" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="eventTypeCode" disabled="false" sourceProperty="eventTypeCode" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="IsValid" disabled="false" hasAll="false" allCaption="All IsValid" allDisplayName="IsValid" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="IsValid" disabled="false" sourceExpression="$CASE(%source.IsValid,0:&quot;Invalid&quot;,1:&quot;Valid&quot;,:&quot;Valid&quot;)" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="srcApplicatiion" disabled="false" hasAll="false" allCaption="All srcApplicatiion" allDisplayName="srcApplicatiion" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="srcApplication" disabled="false" sourceProperty="srcApplication" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
</cube>
}

Parameter DOMAIN;

}
