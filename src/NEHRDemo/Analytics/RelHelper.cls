Class NEHRDemo.Analytics.RelHelper Extends %RegisteredObject
{

ClassMethod getLogIdByMsgHeaderId(msghId As %String) As %String
{
	Set idStr = ""
	&SQL(Select log.ID into :idStr from NEHRDemo_Logs.DataExceptionLog log,EnsLib_EDI_XML.Document doc, Ens.MessageHeader msgh
			where msgh.MessageBodyId = doc.ID
			and msgh.ID = log.MessageId
			and msgh.ID  = :msghId)
	Quit idStr
}

ClassMethod getIssueIdsByLogId(ID As %String) As %List
{
	set list=""
	set issues=##class(NEHRDemo.Logs.DataExceptionLog).%OpenId(ID,0).Issues
    if (issues.Count()=0) {quit list}
	for i=1:1:issues.Count() {
        set $LI(list,i)=issues.GetAt(i).%Id()
    }
    quit list
}

ClassMethod getAppointmentIdByRef(ref As %String) As %String
{
		Set idStr = ""
		&SQL(select ID into :idStr from GuokaoRaw.Appointment
			where "Key" = :ref)
		Quit idStr
}

ClassMethod getEncounterIdByRef(ref As %String) As %String
{
		Set idStr = ""
		&SQL(select ID into :idStr from GuokaoRaw.Encounter
			where "Key" = :ref)
		Quit idStr
}

ClassMethod getProcIdByEntKey(entKey As %String) As %String
{
		Set idStr = ""
		&SQL(select ID into :idStr from GuokaoRaw."Procedure"
		where EncounterReference = :entKey)
		Quit idStr
}

ClassMethod getPrimDiagCodeByEntKey(entKey As %String) As %String
{
		Set codeStr = ""
		&SQL(select CodeCodingCode into :codeStr from GuokaoRaw."Condition"
		where EncounterReference = :entKey
		and SeverityCodingCode ='Primary')
		Quit codeStr
}

ClassMethod getPrimDiagNameByEntKey(entKey As %String) As %String
{
		Set codeStr = ""
		&SQL(select CodeCodingDisplay into :codeStr from GuokaoRaw."Condition"
		where EncounterReference = :entKey
		and SeverityCodingCode ='Primary')
		Quit codeStr
}

ClassMethod getClaimAmountByEntKey(entKey As %String) As %String
{
		Set codeStr = ""
		&SQL(select TotalValue into :codeStr from GuokaoRaw.Claim
		where ItemEncounterReference = :entKey)
		Quit codeStr
}

ClassMethod getVipAmountByEntKey(entKey As %String) As %String
{
		Set valueStr = ""
		&SQL(select c.TotalValue into :valueStr from GuokaoRaw.Claim c,
				( select e."Key" from GuokaoRaw.Encounter e, GuokaoRaw.Appointment a
			  	  where e.AppointmentReference = a."Key" 
			  	  and a.ServiceTypeCodingCode = 'V'
			      and e."Key" = :entKey ) as x
			 where c.ItemEncounterReference = x."Key"
		     and c.ItemEncounterReference = :entKey
		)
		Quit $CASE(valueStr,"":0,:valueStr)
}

ClassMethod getClaimIdByEntKey(entKey As %String) As %String
{
		Set idStr = ""
		&SQL(select ID into :idStr from GuokaoRaw.Claim
		where ItemEncounterReference = :entKey)
		Quit idStr
}

ClassMethod isDayTimeOp(opCode) As %Boolean
{
	Set idStr = ""
	&SQL(select ID into :idStr from SourceModel_Dict.DaytimeOperation
		where Code = :opCode)
	Quit $CASE(idStr,"":0,:1)
}

ClassMethod isLevel4Op(opCode) As %Boolean
{
	Set idStr = ""
	&SQL(select ID into :idStr from SourceModel_Dict.Level4Procedure
		where Code = :opCode)
	Quit $CASE(idStr,"":0,:1)
}

ClassMethod isMIOp(opCode) As %Boolean
{
	Set idStr = ""
	&SQL(select ID into :idStr from SourceModel_Dict.MinimallyInvasiveSurgery
		where Code = :opCode)
	Quit $CASE(idStr,"":0,:1)
}

ClassMethod getProcStaylength(entKey As %String) As %String
{
	Set st = ""
	Set ed = ""
	&SQL(select e.PeriodStart,e.PeriodEnd into st,ed from GuokaoRaw.Encounter e
		where e."Key"  = :entKey)	
	
	Quit $System.SQL.DATEDIFF("d",$Replace($Replace(st,"T"," "),"Z",""),$Replace($Replace(ed,"T"," "),"Z",""))
}

}
