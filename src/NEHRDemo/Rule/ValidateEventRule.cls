/// 
Class NEHRDemo.Rule.ValidateEventRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="NEHRDemo.Process.VDocHandlingBPL.Context" production="">
<variable name=""></variable>
<ruleSet name="EventValidatingRuleSet" effectiveBegin="" effectiveEnd="">
<rule name="recordIdentifier existence checkcing" disabled="false">
<when condition="&quot;&quot;=FindByXPath(Document,&quot;/putEvent/event/recordIdentifier&quot;,&quot;text()&quot;)" comment="">
<comment text="recordIdentifier is mandatory"></comment>
<assign property="tSC" value="AppendValidateIssue(ValidateResultLog,&quot;Event&quot;,&quot;recordIdentifier is mandatory&quot;,&quot;/putEvent/event/recordIdentifier/text()&quot;)"></assign>
</when>
</rule>
<rule name="start and end date checking" disabled="false">
<when condition="(&quot;&quot;=FindByXPath(Document,&quot;/putEvent/event/eventStartDate&quot;,&quot;text()&quot;))||(&quot;&quot;=FindByXPath(Document,&quot;/putEvent/event/eventEndDate&quot;,&quot;text()&quot;))" comment="">
<comment text="There should be start and end date in Event."></comment>
<assign property="tSC" value="AppendValidateIssue(ValidateResultLog,&quot;Event&quot;,&quot;eventStartDate or eventEndDate missing in event&quot;,&quot;/putEvent/event/eventStartDate/text() or /putEvent/event/eventEndDate/text()&quot;)"></assign>
</when>
<otherwise>
<rule name="Date format checking, should be ODBC format" disabled="false">
<when condition="(!RegexMatch(FindByXPath(Document,&quot;/putEvent/event/eventStartDate&quot;,&quot;text()&quot;),&quot;\d{4}-\d{2}-\d{2}&quot;))||(!RegexMatch(FindByXPath(Document,&quot;/putEvent/event/eventEndDate&quot;,&quot;text()&quot;),&quot;\d{4}-\d{2}-\d{2}&quot;))" comment="">
<comment text="Invalid Date format, should be YYYY-MM-DD"></comment>
<assign property="tSC" value="AppendValidateIssue(ValidateResultLog,&quot;Event&quot;,&quot;eventStartDate or eventEndDate is not of YYYY-MM-DD ODBC data format&quot;,&quot;/putEvent/event/eventStartDate/text() or /putEvent/event/eventEndDate/text() &quot;)"></assign>
</when>
<otherwise>
<rule name="eventDate logic checking " disabled="false">
<when condition="!DateLaterThan(FindByXPath(Document,&quot;/putEvent/event/eventEndDate&quot;,&quot;text()&quot;),FindByXPath(Document,&quot;/putEvent/event/eventStartDate&quot;,&quot;text()&quot;))" comment="">
<comment text="eventEndDate shoud be later than eventStartDate."></comment>
<assign property="tSC" value="AppendValidateIssue(ValidateResultLog,&quot;Event&quot;,&quot;eventEndDate shoud be later than eventStartDate&quot;,&quot;/putEvent/event/eventStartDate/text() and /putEvent/event/eventEndDate/text() &quot;)"></assign>
</when>
</rule>
</otherwise>
</rule>
</otherwise>
</rule>
<rule name="eventType coded concept checking" disabled="false">
<when condition="Lookup(&quot;eventType&quot;,FindByXPath(Document,&quot;/putEvent/event/eventType/code&quot;,&quot;text()&quot;),,)=&quot;&quot;" comment="">
<comment text="eventType shoud be one of the valid codes from lookuptable eventType"></comment>
<assign property="tSC" value="AppendValidateIssue(ValidateResultLog,&quot;Event&quot;,&quot;Invalid eventType&quot;,&quot;/putEvent/event/eventType/code/text()&quot;)"></assign>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
