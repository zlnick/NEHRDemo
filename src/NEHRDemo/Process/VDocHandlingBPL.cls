/// 
Class NEHRDemo.Process.VDocHandlingBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.EDI.XML.Document' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='NIDMatchResult' type='NEHRDemo.Messages.MockMHA.MatchResponse' instantiate='0' />
<property name='UCRResponse' type='EnsLib.EDI.XML.Document' instantiate='0' />
<property name='SaveToTempTableResponse' type='NEHRDemo.Messages.TempTable.SaveResponse' instantiate='0' />
<property name='tmpStream' type='%Stream.GlobalCharacter' instantiate='0' />
<property name='ValidateResult' type='NEHRDemo.Validate.ValidateResult' instantiate='1' />
<property name='Document' type='EnsLib.EDI.XML.Document' instantiate='0' />
</context>
<sequence xend='200' yend='650' >
<assign name="putRequestToContext" property="context.Document" value="request" action="set" languageOverride="" xpos='200' ypos='250' />
<sequence name='NIDMatch' xpos='200' ypos='350' xend='200' yend='350' >
<call name='MatchNID' target='NEHRDemo.BO.MockMHAOperation' async='0' xpos='200' ypos='250' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='NEHRDemo.Messages.MockMHA.MatchResponse' >
<assign property="context.NIDMatchResult" value="callresponse" action="set" languageOverride="" />
</response>
</call>
</sequence>
<sequence name='DispatchAsNIDMatch' xpos='200' ypos='450' xend='200' yend='800' >
<switch name='DispatchAsNIDMatchResult' xpos='200' ypos='250' xend='200' yend='700' >
<case condition='"Match" = context.NIDMatchResult.MatchResult' name='Match' >
<call name='SendToUCR' target='MockUCR' async='1' xpos='335' ypos='400' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="context.UCRResponse" value="callresponse" action="set" languageOverride="" />
</response>
</call>
</case>
<case condition='"NoNID" = context.NIDMatchResult.MatchResult' name='NoNID' >
<call name='SaveToTempTable' target='NEHRDemo.BO.SaveToTempTableOperation' async='1' xpos='605' ypos='400' >
<request type='NEHRDemo.Messages.TempTable.SaveRequest' >
<assign property="callrequest.SessionId" value="..%Process.%SessionId" action="set" languageOverride="" />
<assign property="callrequest.MessageId" value="..%Process.%PrimaryRequestHeader.%Id()" action="set" languageOverride="" />
<assign property="callrequest.doc" value="request" action="set" languageOverride="" />
</request>
<response type='NEHRDemo.Messages.TempTable.SaveResponse' >
<assign property="context.SaveToTempTableResponse" value="callresponse" action="set" languageOverride="" />
</response>
</call>
</case>
<case condition='"Mismatch" = context.NIDMatchResult.MatchResult' name='Mismatch' >
<call name='NotifySourceMismatch' target='NotifySource' async='1' xpos='875' ypos='400' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='EnsLib.EDI.XML.Document' />
</call>
<code name='MakeLogContentStream' xpos='875' ypos='500' >
<![CDATA[ Set context.tmpStream = ##Class(%Stream.GlobalCharacter).%New()
 Set tSC = request.OutputToLibraryStream(context.tmpStream)]]>
</code>
<call name='SaveMismatchLog' target='NEHRDemo.BO.LoggingOperation' async='1' xpos='875' ypos='600' >
<request type='NEHRDemo.Messages.AddLogRequest' >
<assign property="callrequest.log.SessionId" value="..%Process.%SessionId" action="set" languageOverride="" />
<assign property="callrequest.log.MessageId" value="..%Process.%PrimaryRequestHeader.%Id()" action="set" languageOverride="" />
<assign property="callrequest.log.Content" value="context.tmpStream" action="set" languageOverride="" />
<assign property="callrequest.log.Cause" value="&quot;NIDMismatch&quot;" action="set" languageOverride="" />
</request>
<response type='NEHRDemo.Messages.AddLogResponse' />
</call>
</case>
<default name='default' />
</switch>
</sequence>
<sequence name='DataValidation' xpos='200' ypos='550' xend='200' yend='700' >
<if name='ContainsPatient' condition='"" &apos;= request.GetSubDocumentAt("/putEvent/patient")' xpos='200' ypos='250' xend='200' yend='600' >
<true>
<rule name='ValidatePatient' rule='NEHRDemo.Rule.PatientValidatingRule'  ruleContext='context' xpos='335' ypos='400' >
</rule>
<trace value='111' xpos='335' ypos='500' />
</true>
</if>
</sequence>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
