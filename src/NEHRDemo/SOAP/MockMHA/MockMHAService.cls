Class NEHRDemo.SOAP.MockMHA.MockMHAService Extends %SOAP.WebService
{

/// Name of the WebService.
Parameter SERVICENAME = "SOAPServices";

/// TODO: change this to actual SOAP namespace.
/// SOAP Namespace for the WebService
Parameter NAMESPACE = "https://mha.org";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

Method MatchPatientService(req As NEHRDemo.SOAP.MockMHA.SOAPMessages.MatchRequest) As NEHRDemo.SOAP.MockMHA.SOAPMessages.MatchResponse [ WebMethod ]
{
    Set resp = ##Class(NEHRDemo.SOAP.MockMHA.SOAPMessages.MatchResponse).%New()
    Set branch = $R(3)
    //NoNID
    if (0 = branch) {
        Set resp.MatchResult = "NoNID"
        Return resp
    }
    //Match
    if (1= branch) {
        Set resp.MatchResult = "Match"
        Set resp.NID = ##Class(%Library.PopulateUtils).SSN()
        Return resp
    }
    //Mismatch
    if (2 = branch) {
        Set resp.MatchResult = "Mismatch"
        Set resp.NID = ##Class(%Library.PopulateUtils).SSN()
        Return resp
    }
    Quit resp
}

}
