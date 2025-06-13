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
<property name='ValidateResultLog' type='NEHRDemo.Logs.DataExceptionLog' instantiate='0' />
<property name='Document' type='EnsLib.EDI.XML.Document' instantiate='0' />
<property name='tSC' type='%Status' instantiate='0' />
<property name='srcInstitution' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='250' />
</parameters>
</property>
<property name='srcApplication' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='250' />
</parameters>
</property>
<property name='eventTypeCode' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='250' />
</parameters>
</property>
<property name='msgID' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='128' />
</parameters>
</property>
<property name='SN' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='128' />
</parameters>
</property>
</context>
<sequence xend='200' yend='850' >
<assign name="putRequestToContext" property="context.Document" value="request" action="set" languageOverride="" xpos='200' ypos='250' />
<code name='GetConnectionContext' xpos='200' ypos='350' >
<![CDATA[ Set context.srcInstitution = ##Class(NEHRDemo.Utils.VDocUtils).FindByXPath(request,"/putEvent/controlHeader/srcInstitution","text()")
 Set context.srcApplication = ##Class(NEHRDemo.Utils.VDocUtils).FindByXPath(request,"/putEvent/controlHeader/srcApplication","text()")
 Set context.eventTypeCode = ##Class(NEHRDemo.Utils.VDocUtils).FindByXPath(request,"/putEvent/event/eventType/code","text()")
  Set context.msgID = ##Class(NEHRDemo.Utils.VDocUtils).FindByXPath(request,"/putEvent/controlHeader/msgID","text()")
   Set context.SN = ##Class(NEHRDemo.Utils.VDocUtils).FindByXPath(request,"/putEvent/patient/identification","Identification[type='SN']/id/text()")]]>
</code>
<sequence name='NIDMatch' xpos='200' ypos='450' xend='200' yend='350' >
<call name='MatchNID' target='NEHRDemo.BO.MockMHAOperation' async='0' xpos='200' ypos='250' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='NEHRDemo.Messages.MockMHA.MatchResponse' >
<assign property="context.NIDMatchResult" value="callresponse" action="set" languageOverride="" />
</response>
</call>
</sequence>
<sequence name='DispatchAsNIDMatch' xpos='200' ypos='550' xend='200' yend='800' >
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
<sequence name='DataValidation' xpos='200' ypos='650' xend='200' yend='550' >
<assign name="InitializeLog" property="context.ValidateResultLog" value="##Class(NEHRDemo.Logs.DataExceptionLog).%New()" action="set" languageOverride="" xpos='200' ypos='250' />
<rule name='ValidatePatient' rule='NEHRDemo.Rule.ValidatePatientRule'  ruleContext='context' xpos='200' ypos='350' >
</rule>
<rule name='ValidateEvent' rule='NEHRDemo.Rule.ValidateEventRule'  ruleContext='context' xpos='200' ypos='450' >
</rule>
</sequence>
<sequence name='SaveValidationLogs' xpos='200' ypos='750' xend='200' yend='700' >
<if name='HasValidationIssue' condition='0 &lt; context.ValidateResultLog.Issues.Count()' xpos='200' ypos='250' xend='200' yend='600' >
<true>
<code name='RefreshContentStream' xpos='470' ypos='400' >
<![CDATA[ Set context.tmpStream = ##Class(%Stream.GlobalCharacter).%New()
 Set tSC = request.OutputToLibraryStream(context.tmpStream)]]>
</code>
<call name='SaveInvalidLog' target='NEHRDemo.BO.LoggingOperation' async='1' xpos='470' ypos='500' >
<request type='NEHRDemo.Messages.AddLogRequest' >
<assign property="callrequest.log" value="context.ValidateResultLog" action="set" languageOverride="" />
<assign property="callrequest.log.MessageId" value="..%Process.%PrimaryRequestHeader.%Id()" action="set" languageOverride="" />
<assign property="callrequest.log.SessionId" value="..%Process.%SessionId" action="set" languageOverride="" />
<assign property="callrequest.log.Cause" value="&quot;InvalidData&quot;" action="set" languageOverride="" />
<assign property="callrequest.log.Content" value="context.tmpStream" action="set" languageOverride="" />
<assign property="callrequest.log.srcInstitution" value="context.srcInstitution" action="set" languageOverride="" />
<assign property="callrequest.log.srcApplication" value="context.srcApplication" action="set" languageOverride="" />
<assign property="callrequest.log.eventTypeCode" value="context.eventTypeCode" action="set" languageOverride="" />
<assign property="callrequest.log.msgID" value="context.msgID" action="set" languageOverride="" />
<assign property="callrequest.log.SN" value="context.SN" action="set" languageOverride="" />
<assign property="callrequest.log.IsValid" value="0" action="set" languageOverride="" />
<assign property="callrequest.log.TimeHappened" value="$zdatetime($ztimestamp,3,,3)" action="set" languageOverride="" />
</request>
<response type='NEHRDemo.Messages.AddLogResponse' />
</call>
</true>
<false>
<call name='SaveValidLog' target='NEHRDemo.BO.LoggingOperation' async='1' xpos='200' ypos='400' >
<request type='NEHRDemo.Messages.AddLogRequest' >
<assign property="callrequest.log" value="context.ValidateResultLog" action="set" languageOverride="" />
<assign property="callrequest.log.MessageId" value="..%Process.%PrimaryRequestHeader.%Id()" action="set" languageOverride="" />
<assign property="callrequest.log.SessionId" value="..%Process.%SessionId" action="set" languageOverride="" />
<assign property="callrequest.log.srcInstitution" value="context.srcInstitution" action="set" languageOverride="" />
<assign property="callrequest.log.srcApplication" value="context.srcApplication" action="set" languageOverride="" />
<assign property="callrequest.log.eventTypeCode" value="context.eventTypeCode" action="set" languageOverride="" />
<assign property="callrequest.log.msgID" value="context.msgID" action="set" languageOverride="" />
<assign property="callrequest.log.SN" value="context.SN" action="set" languageOverride="" />
<assign property="callrequest.log.IsValid" value="1" action="set" languageOverride="" />
<assign property="callrequest.log.TimeHappened" value="$zdatetime($ztimestamp,3,,3)" action="set" languageOverride="" />
</request>
<response type='NEHRDemo.Messages.AddLogResponse' />
</call>
</false>
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
