Class NEHRDemo.BS.EventHandlerBS Extends Ens.BusinessService
{

Method OnProcessInput(pInput As Ens.StreamContainer, Output pOutput As NEHRDemo.Messages.AddPatientResponse) As %Status
{
    Set tSC = $$$OK
    #Dim doc As EnsLib.EDI.XML.Document = ##Class(EnsLib.EDI.XML.Document).ImportFromLibraryStream(pInput.StreamGet(),.tSC)
    s doc.DocType="message:putEvent"
    s doc.DocTypeCategory="message"
    Set tSC = (pInput.StreamGet()).Rewind()
    Set ^Temp = (pInput.StreamGet()).Read()
    Set tSC = ..SendRequestSync("NEHRDemo.Process.VDocHandlingBPL",doc,.resp)
    Set pOutput = ##Class(NEHRDemo.Messages.AddPatientResponse).%New()
    Set pOutput.resultStatus = ##Class(NEHRDemo.Entity.ResultStatus).%New()
    Set pOutput.resultStatus.statusCode = "1111"
    Set pOutput.resultStatus.statusDescription = "xyz"
    Set pOutput.doc = ##Class(%Stream.GlobalCharacter).%New()
    #Dim rtnStream As %Stream.GlobalCharacter = ##Class(%Stream.GlobalCharacter).%New()
    Set tSC =  doc.XMLExportToStream(.rtnStream)
    Set tSC = pOutput.doc.CopyFrom(rtnStream)
    Quit tSC
}

}
