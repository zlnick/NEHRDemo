/// 
Class NEHRDemo.Rule.ValidatePatientRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="NEHRDemo.Process.VDocHandlingBPL.Context" production="">
<variable name=""></variable>
<ruleSet name="PatientValidatingRuleSet" effectiveBegin="" effectiveEnd="">
<rule name="NRICChecking" disabled="false">
<when condition="&quot;&quot;=FindByXPath(Document,&quot;/putEvent/patient/identification&quot;,&quot;Identification[type=&apos;NRIC&apos;]/id/text()&quot;)" comment="">
<comment text="&quot;Whether NRIC is empty or NULL.&quot;"></comment>
<assign property="tSC" value="AppendValidateIssue(ValidateResultLog,&quot;Patient&quot;,&quot;NRIC Not found&quot;,&quot;/putEvent/patient/identification/Identification[type=&apos;NRIC&apos;]/id/text()&quot;)"></assign>
</when>
<otherwise>
<comment text="&quot;NRIC Not Null. Perform format validation.&quot;"></comment>
<rule name="NRICFormatChecking" disabled="false">
<when condition="!REGEXMATCH(FindByXPath(Document,&quot;/putEvent/patient/identification&quot;,&quot;Identification[type=&apos;NRIC&apos;]/id/text()&quot;),&quot;T\d{7}J&quot;)" comment="">
<comment text="Input NRIC does not match the pattern &quot;T\d{7}J&quot;"></comment>
<assign property="tSC" value="AppendValidateIssue(ValidateResultLog,&quot;Patient&quot;,&quot;NRIC does not match the pattern T\d{7}J&quot;,&quot;/putEvent/patient/identification/Identification[type=&apos;NRIC&apos;]/id/text()&quot;)"></assign>
</when>
</rule>
</otherwise>
</rule>
<rule name="Birthday format Checking" disabled="false">
<when condition="&quot;&quot;!=FindByXPath(Document,&quot;/putEvent/patient/dateOfBirth&quot;,&quot;text()&quot;)" comment="">
<rule name="dateOfBirth format should be YYYY-MM-DD" disabled="false">
<when condition="!RegexMatch(FindByXPath(Document,&quot;/putEvent/patient/dateOfBirth&quot;,&quot;text()&quot;),&quot;\d{4}-\d{2}-\d{2}&quot;)" comment="">
<assign property="tSC" value="AppendValidateIssue(ValidateResultLog,&quot;Patient&quot;,&quot;dateOfBirth should be of format YYYY-MM-DD&quot;,&quot;/putEvent/patient/dateOfBirth/text()&quot;)"></assign>
</when>
</rule>
</when>
</rule>
<rule name="maritalStatus checking against coded concept" disabled="false">
<when condition="Lookup(&quot;maritalStatus&quot;,FindByXPath(Document,&quot;/putEvent/patient/maritalStatus&quot;,&quot;text()&quot;),,)=&quot;&quot;" comment="">
<comment text="maritalStatus shoud be one of the valid codes from lookuptable maritalStatus"></comment>
<assign property="tSC" value="AppendValidateIssue(ValidateResultLog,&quot;Patient&quot;,&quot;Invalid maritalStatus&quot;,&quot;/putEvent/patient/maritalStatus/text()&quot;)"></assign>
</when>
</rule>
<rule name="gender checking against coded concept" disabled="false">
<when condition="Lookup(&quot;gender&quot;,FindByXPath(Document,&quot;/putEvent/patient/gender&quot;,&quot;text()&quot;),,)=&quot;&quot;" comment="">
<comment text="gender shoud be one of the valid codes from lookuptable gender"></comment>
<assign property="tSC" value="AppendValidateIssue(ValidateResultLog,&quot;Patient&quot;,&quot;Invalid gender&quot;,&quot;/putEvent/patient/gender/text()&quot;)"></assign>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
