Class NEHRDemo.Utils.DataGenerator Extends %RegisteredObject
{

ClassMethod GenValidEvent() As NEHRDemo.Entity.PutEvent
{
    #Dim putEvent As NEHRDemo.Entity.PutEvent = ##Class(NEHRDemo.Entity.PutEvent).%New()
    //Header
    #Dim header As NEHRDemo.Entity.ControlHeader = ##Class(NEHRDemo.Entity.ControlHeader).%New()
    Set header.srcInstitution = $CASE($R(5),1:"CenterHospital",2:"MIH",3:"SEO",4:"Myor's Clinic",:"New Oriental")
    Set header.srcApplication = $CASE($R(5),1:"EMR",2:"HIS",3:"LIS",4:"PACS",:"CRM")
    Set header.msgID = ""_##Class(%PopulateUtils).Integer(100000000,999999999)
    Set putEvent.controlHeader = header
    //Patient
    #Dim patient As NEHRDemo.Entity.Patient = ##Class(NEHRDemo.Entity.Patient).%New()
    #Dim nric As NEHRDemo.Entity.Identification = ##Class(NEHRDemo.Entity.Identification).%New()
    Set nric.type = "NRIC"
    Set nric.MRNNumber = ##Class(%PopulateUtils).SSN()
    Set nric.id = "T"_##Class(%PopulateUtils).Integer(1000000,9999999)_"J"
    Set tSC = patient.identification.Insert(nric)
    //Add SN
    #Dim sn As NEHRDemo.Entity.Identification = ##Class(NEHRDemo.Entity.Identification).%New()
    Set sn.type = "SN"
    Set sn.id =  ##Class(%PopulateUtils).SSN()
    Set tSC = patient.identification.Insert(sn)
    //And another random type of identification
    #Dim identity As NEHRDemo.Entity.Identification = ##Class(NEHRDemo.Entity.Identification).%New()
    Set identity.type = $CASE($R(5),1:"MRN",2:"MedicalNumber",3:"Diver License",4:"Passport Number",:"")
    Set identity.id =  ##Class(%PopulateUtils).SSN()
    Set tSC = patient.identification.Insert(identity)
    //Name
    #Dim name As NEHRDemo.Entity.Name = ##Class(NEHRDemo.Entity.Name).%New()
    Set name.value = ##Class(%PopulateUtils).Name()
    Set patient.name = name
    //DOB,25% change of invalid
    Set patient.dateOfBirth = $ZD(##Class(%PopulateUtils).Date(),3)
    //Gender
    Set patient.gender = $CASE($R(4),1:"male",2:"female",3:"other",:"unknown")
    //maritalStatus, 25% change of invalid
    Set patient.maritalStatus = $CASE($R(4),1:"Married",2:"Unmarried",3:"Widowed",:"Unknown")
    Set putEvent.patient = patient
    Set putEvent.patient = patient
    //Event
    #Dim event As NEHRDemo.Entity.Event = ##Class(NEHRDemo.Entity.Event).%New()
    Set event.recordIdentifier = ##Class(%PopulateUtils).SSN()
    Set startDate = ##Class(%PopulateUtils).Date()
    Set endDate = startDate+1
    Set event.eventStartDate = $ZD(startDate,3)
    Set event.eventEndDate = $ZD(endDate,3)
    //eventType, 25% change of invalid
    #Dim eventType As NEHRDemo.Entity.EventType = ##Class(NEHRDemo.Entity.EventType).%New()
    Set eventType.code = $CASE($R(4),1:"AddDiagnosis",2:"AddEncounter",3:"AddPatient",:"Billing")
    Set event.eventType = eventType
    Set putEvent.event = event
    //d putEvent.XMLExport()
    Quit putEvent
}

ClassMethod GenInvalidEvent() As NEHRDemo.Entity.PutEvent
{
    #Dim putEvent As NEHRDemo.Entity.PutEvent = ##Class(NEHRDemo.Entity.PutEvent).%New()
    //Header
    #Dim header As NEHRDemo.Entity.ControlHeader = ##Class(NEHRDemo.Entity.ControlHeader).%New()
    Set header.srcInstitution = $CASE($R(5),1:"CenterHospital",2:"MIH",3:"SEO",4:"Myor's Clinic",:"New Oriental")
    Set header.srcApplication = $CASE($R(5),1:"EMR",2:"HIS",3:"LIS",4:"PACS",:"CRM")
    Set header.msgID = ""_##Class(%PopulateUtils).Integer(100000000,999999999)
    Set putEvent.controlHeader = header
    //Patient
    #Dim patient As NEHRDemo.Entity.Patient = ##Class(NEHRDemo.Entity.Patient).%New()
    //25% chance missing NRIC
    if ($R(100) > 25){
        #Dim nric As NEHRDemo.Entity.Identification = ##Class(NEHRDemo.Entity.Identification).%New()
        Set nric.type = "NRIC"
        Set nric.MRNNumber = ##Class(%PopulateUtils).SSN()
        //25% change havig invalid NRIC
        if ($R(100) < 26){
            Set nric.id = ""_##Class(%PopulateUtils).Integer(100000000,999999999)
        }else{
            Set nric.id = "T"_##Class(%PopulateUtils).Integer(1000000,9999999)_"J"
        }
        Set tSC = patient.identification.Insert(nric)
    }
    //Add SN
    #Dim sn As NEHRDemo.Entity.Identification = ##Class(NEHRDemo.Entity.Identification).%New()
    Set sn.type = "SN"
    Set sn.id =  ##Class(%PopulateUtils).SSN()
    Set tSC = patient.identification.Insert(sn)
    //And another random type of identification
    #Dim identity As NEHRDemo.Entity.Identification = ##Class(NEHRDemo.Entity.Identification).%New()
    Set identity.type = $CASE($R(5),1:"MRN",2:"MedicalNumber",3:"Diver License",4:"Passport Number",:"")
    Set identity.id =  ##Class(%PopulateUtils).SSN()
    Set tSC = patient.identification.Insert(identity)
    //Name
    #Dim name As NEHRDemo.Entity.Name = ##Class(NEHRDemo.Entity.Name).%New()
    Set name.value = ##Class(%PopulateUtils).Name()
    Set patient.name = name
    //DOB,25% change of invalid
    if ($R(100) > 25){
       Set patient.dateOfBirth = $ZD(##Class(%PopulateUtils).Date(),3)
    }else{
       Set patient.dateOfBirth = ##Class(%PopulateUtils).String(10)
    }
    //Gender, 25% change of invalid
    if ($R(100) > 25){
       Set patient.gender = $CASE($R(4),1:"male",2:"female",3:"other",:"unknown")
    }else{
       Set patient.gender = ##Class(%PopulateUtils).String(10)
    }
    //maritalStatus, 25% change of invalid
    if ($R(100) > 25){
       Set patient.maritalStatus = $CASE($R(4),1:"Married",2:"Unmarried",3:"Widowed",:"Unknown")
    }else{
       Set patient.maritalStatus = ##Class(%PopulateUtils).String(10)
    }
    Set putEvent.patient = patient
    //Event
    #Dim event As NEHRDemo.Entity.Event = ##Class(NEHRDemo.Entity.Event).%New()
    //recordIdentifier 25% change of missing
    if ($R(100) > 25){
       Set event.recordIdentifier = ##Class(%PopulateUtils).SSN()
    }
    //start and end date invalid
    if ($R(100) > 25){
       Set startDate = ##Class(%PopulateUtils).Date()
       //end date 25% chance before startDate
       if ($R(100) > 25){
        Set endDate = startDate
       }else{
        Set endDate = startDate - 2
       }
       Set event.eventStartDate = $ZD(startDate,3)
       Set event.eventEndDate = $ZD(endDate,3)
    }else{
        //50% invalid date because of wrong format
        if ($R(10) > 5){
            Set event.eventStartDate = ##Class(%PopulateUtils).String()
            Set event.eventEndDate = ##Class(%PopulateUtils).String()
        }
    }
    //eventType, 25% change of invalid
    #Dim eventType As NEHRDemo.Entity.EventType = ##Class(NEHRDemo.Entity.EventType).%New()
    if ($R(100) > 25){
       Set eventType.code = $CASE($R(4),1:"AddDiagnosis",2:"AddEncounter",3:"AddPatient",:"Billing")
    }else{
       Set eventType.code = ##Class(%PopulateUtils).String(5)
    }
    Set event.eventType = eventType
    Set putEvent.event = event
    //d putEvent.XMLExport()
    Quit putEvent
}

// 30% records will be invalid

ClassMethod GenAndPush(count As %Integer = 1) As %Status
{
    #Dim service As Ens.BusinessService
    for i=1:1:count{
        Set tSC = ##Class(Ens.Director).CreateBusinessService("NEHRDemo.BS.EventHandlerBS",.service)
        //%30 invalid events
        #Dim putEvent As NEHRDemo.Entity.PutEvent
        if ($R(100) > 29){
            Set putEvent = ..GenValidEvent()
        }else{
            Set putEvent = ..GenInvalidEvent()
        }
        #Dim stream As %Stream.GlobalCharacter = ##Class(%Stream.GlobalCharacter).%New()
        Set tSC = putEvent.XMLExportToStream(.stream,"putEvent")
        #Dim req As Ens.StreamContainer = ##Class(Ens.StreamContainer).%New()
        Set tSC = req.StreamSet(stream)
        Set tSC = service.OnProcessInput(req,.resp)
    }
    Quit tSC
}

// dayCounts: the maximum days do you want the messages spread accross

// at least 5 days

ClassMethod UpdateTimeline(dayCounts As %Integer) As %Status
{
    Set tSC = $$$OK
    Kill ^msgids
    Set msgid = ""
    Set msgIDList=##class(%ListOfDataTypes).%New()
    &sql(DECLARE C1 CURSOR FOR
        SELECT ID into :msgid from Ens.MessageHeader where SourceConfigName='NEHRDemo.BS.EventHandlerBS'
    )
    &sql(OPEN C1)
        QUIT:(SQLCODE'=0)
    &sql(FETCH C1)
         While (SQLCODE = 0) {
            Do msgIDList.Insert(msgid)  
        &sql(FETCH C1)
    } 
    &sql(CLOSE C1)
    Set groupCount = $R(dayCounts) + 5
    Set countBase  = msgIDList.Count()\groupCount\1
    W msgIDList.Count(),!
    w groupCount,!
    w countBase,!
    Set StartDateH = $h-groupCount-($R(30)+10)
    w $ZD(StartDateH,3),!
    Set idx = 1
    for i=1:1:groupCount{
        Set groupSize = countBase - $R(countBase\3\1)+1
        for j=1:1:groupSize{
            Set msgId = msgIDList.GetAt(idx)
            Set msgh = ##Class(Ens.MessageHeader).%OpenId(msgId)
            Set msgh.TimeCreated = ..DateReplace(msgh.TimeCreated,$ZD(StartDateH,3))  
            Set msgh.TimeProcessed = ..DateReplace(msgh.TimeProcessed,$ZD(StartDateH,3)) 
            Set tmpId = ""
            &sql(select ID into :tmpId from NEHRDemo_Logs.DataExceptionLog where MessageId = :msgId)
            Set logObj = ##Class(NEHRDemo.Logs.DataExceptionLog).%OpenId(tmpId)
            Set logObj.TimeHappened = msgh.TimeCreated
            Set tSC = logObj.%Save()
            Set idx = idx+1
            Set tSC = msgh.%Save()
        }
        Set StartDateH = StartDateH + 1
    }
    w "idx:"_idx,!
    Quit tSC
}

ClassMethod DateReplace(time As %String, replaceToDate As %String) As %String
{
    Set timePart = $Piece(time," ",2)
    Quit replaceToDate_" "_timePart
}

}
