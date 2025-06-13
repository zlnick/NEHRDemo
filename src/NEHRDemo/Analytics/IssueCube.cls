/// 
Class NEHRDemo.Analytics.IssueCube Extends %DeepSee.CubeDefinition [ DependsOn = NEHRDemo.Validate.ValidateIssue, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="IssueCube" displayName="IssueCube" disabled="false" abstract="false" sourceClass="NEHRDemo.Validate.ValidateIssue" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="Reason" disabled="false" hasAll="false" allCaption="All Reason" allDisplayName="Reason" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Reason" disabled="false" sourceProperty="Reason" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="ResourceType" disabled="false" hasAll="false" allCaption="All ResourceType" allDisplayName="ResourceType" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="ResourceType" disabled="false" sourceProperty="ResourceType" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="srcInstitution" disabled="false" hasAll="false" allCaption="All srcInstitution" allDisplayName="srcInstitution" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="srcInstitution" disabled="false" sourceProperty="Log.srcInstitution" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="srcApplication" disabled="false" hasAll="false" allCaption="All srcApplication" allDisplayName="srcApplication" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="srcApplication" disabled="false" sourceProperty="Log.srcApplication" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="eventTypeCode" disabled="false" hasAll="false" allCaption="All eventTypeCode" allDisplayName="eventTypeCode" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="eventTypeCode" disabled="false" sourceProperty="Log.eventTypeCode" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="SN" disabled="false" hasAll="false" allCaption="All SN" allDisplayName="SN" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="SN" disabled="false" sourceProperty="Log.SN" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="TimeHappened" disabled="false" hasAll="false" allCaption="All TimeHappened" allDisplayName="TimeHappened" sourceExpression="$ZDTH(%source.Log.TimeHappened,3)" type="time" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Year" displayName="Year" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="8">
      </level>
    </hierarchy>
    <hierarchy name="H2" disabled="false" hidden="false">
      <level name="MonthYear" displayName="Month" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="9">
      </level>
    </hierarchy>
    <hierarchy name="H3" disabled="false" hidden="false">
      <level name="DayMonthYear" displayName="Day" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="10">
      </level>
    </hierarchy>
  </dimension>
  <listing name="Detailed_listing" displayName="Detailed_listing" disabled="false" listingType="table" fieldList="Log-&gt;srcInstitution,Log-&gt;srcApplication,Log-&gt;SN,Log-&gt;TimeHappened,Reason,Position,ResourceType,Log-&gt;msgID,Log-&gt;eventTypeCode" selectMode="0">
  </listing>
</cube>
}

Parameter DOMAIN;

}
