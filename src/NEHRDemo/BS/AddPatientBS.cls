Class NEHRDemo.BS.AddPatientBS Extends Ens.BusinessService
{

Method OnProcessInput(pInput As NEHRDemo.Messages.AddPatientRequest, Output pOutput As NEHRDemo.Messages.AddPatientResponse) As %Status
{
    #Dim patient As HS.SDA3.Patient = pInput.patient
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
    Set tSC = pOutput.streamContent.CopyFrom(patXML)
    Quit tSC
}

}
