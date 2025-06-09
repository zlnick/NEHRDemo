Class NEHRDemo.SOAP.NEHR.SOAPServices Extends %SOAP.WebService
{

/// Name of the WebService.
Parameter SERVICENAME = "SOAPServices";

/// TODO: change this to actual SOAP namespace.
/// SOAP Namespace for the WebService
Parameter NAMESPACE = "https://tempuri.org";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

// Not used!!!

// I only use it as an SOAPUI util to manipulate SOAP parameters 

Method AddPatientService(payload As NEHRDemo.Messages.AddPatientRequest) As NEHRDemo.Messages.AddPatientResponse [ WebMethod ]
{
    Set resp = ##Class(NEHRDemo.Messages.AddPatientResponse).%New()
    Set resp.controlHeader = payload.putEvent.controlHeader
    Set resp.resultStatus = ##Class(NEHRDemo.Entity.ResultStatus).%New()
    Set resp.resultStatus.statusCode = "111"
    Set resp.resultStatus.statusDescription = "OK"
    Quit resp
}

Method HandleEvent(payload As %Stream.GlobalCharacter) As NEHRDemo.Messages.AddPatientResponse [ WebMethod ]
{
    #Dim service As Ens.BusinessService
    #Dim strContainer As Ens.StreamContainer = ##Class(Ens.StreamContainer).%New()
    Set tSC = strContainer.StreamSet(payload)
    Set tSC = ##Class(Ens.Director).CreateBusinessService("NEHRDemo.BS.EventHandlerBS",.service)
    Set tSC = service.OnProcessInput(strContainer,.resp)
    Quit resp
}

}
