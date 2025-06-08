Class NEHRDemo.BS.SDA3HandlerBS Extends Ens.BusinessService
{

// This BS only handle one SDA3 data resource, such as a Patient, an Encounter, etc. 

Method OnProcessInput(pInput As Ens.StreamContainer, Output pOutput As NEHRDemo.Messages.NEHREventMessage) As %Status
{
    Set tSC = $$$OK
    Set tSC = ..SendRequestAsync("NEHRDemo.Process.SDA3StreamHandlingBPL",pInput)
    /*Set sda3 = ##Class(HS.SDA3.Container).%New()
    Set tSC = sda3.InitializeXMLParse(.pInput)
    If $$$ISERR(tSC) Quit tSC
    Set pOutput = ##Class(NEHRDemo.Messages.NEHREventMessage).%New()
    while sda3.GetNextSDA(.type, .obj) {
        Set pOutput.sda3Type = type
        #Dim sda3XML As %Stream.GlobalCharacter = ##Class(%Stream.GlobalCharacter).%New()
        Set tSC =  obj.XMLExportToStream(.sda3XML)
        Set pOutput.streamContent = ##Class(%Stream.GlobalCharacter).%New()
        Set tSC = pOutput.streamContent.CopyFrom(sda3XML)
        Quit
    }*/
    /*#Dim patient As HS.SDA3.Patient = pInput.patient
    #Dim patXML As %Stream.GlobalCharacter = ##Class(%Stream.GlobalCharacter).%New()
    Set tSC =  patient.XMLExportToStream(.patXML)
    Set tSC = patXML.Rewind()
    #Dim doc As EnsLib.EDI.XML.Document = ##Class(EnsLib.EDI.XML.Document).%New()
    Set tSC = doc.ImportFromLibraryStream(patXML)
    Set tSC = doc.XMLExportToString(.str)
    Set ^Temp = $CLASSNAME(pInput.patient)
    Set pOutput = ##Class(NEHRDemo.Messages.AddPatientResponse).%New()
    Set pOutput.recodId = "1"
    Set pOutput.succeed = 1
    Set pOutput.streamContent = ##Class(%Stream.GlobalCharacter).%New()
    Set tSC = pOutput.streamContent.CopyFrom(patXML)*/
    Quit tSC
}

}
