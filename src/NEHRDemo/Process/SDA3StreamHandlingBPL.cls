/// 
Class NEHRDemo.Process.SDA3StreamHandlingBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.StreamContainer' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='resourceType' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='instance' type='HS.SDA3.SuperClass' instantiate='0' />
<property name='IsValid' type='%Boolean' instantiate='0' />
<property name='validatingResult' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='patient' type='HS.SDA3.Patient' instantiate='0' />
</context>
<sequence xend='200' yend='1000' >
<code name='GetSDA3Instance' xpos='200' ypos='250' >
<![CDATA[ Set sda3 = ##Class(HS.SDA3.Container).%New()
 Do sda3.InitializeXMLParse(request.StreamGet())
 while sda3.GetNextSDA(.type, .obj) {
   Set context.resourceType = type
   Set context.instance = obj
   Quit
 }]]>
</code>
<switch name='ValiadateAsType' xpos='200' ypos='350' xend='200' yend='700' >
<case condition='"Patient" = context.resourceType' >
<assign name="Set patient as instance" property="context.patient" value="context.instance" action="set" languageOverride="" xpos='488' ypos='400' />
<trace value='context.resourceType' xpos='335' ypos='500' />
<rule name='ValidatePatient' rule='NEHRDemo.Rule.PatientValidatingRule'  resultLocation='context.IsValid' reasonLocation='context.validatingResult' ruleContext='context' xpos='335' ypos='600' >
</rule>
</case>
<default name='default' />
</switch>
<empty name='ValidateSDA3' xpos='200' ypos='800' />
<empty name='Dispatch2UCR' xpos='200' ypos='900' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
