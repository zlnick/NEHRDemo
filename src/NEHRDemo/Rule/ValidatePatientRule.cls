/// 
Class NEHRDemo.Rule.ValidatePatientRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="NEHRDemo.Process.VDocHandlingBPL.Context" production="">
<ruleSet name="PatientValidatingRuleSet" effectiveBegin="" effectiveEnd="">
<rule name="NRICChecking" disabled="false">
<when condition="1" comment="">
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
