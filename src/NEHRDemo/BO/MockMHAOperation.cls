Class NEHRDemo.BO.MockMHAOperation Extends Ens.BusinessOperation
{

Method Match(pRequest As EnsLib.EDI.XML.Document, Output pResponse As NEHRDemo.Messages.MockMHA.MatchResponse) As %Status
{
  Set tSC = $$$OK
  Set pResponse = ##Class(NEHRDemo.Messages.MockMHA.MatchResponse).%New()
    Set branch = $R(3)
    Set branch = 1
    //NoNID
    if (0 = branch) {
        Set pResponse.MatchResult = "NoNID"
        Return tSC
    }
    //Match
    if (1= branch) {
        Set pResponse.MatchResult = "Match"
        Set pResponse.NID = ##Class(%Library.PopulateUtils).SSN()
        Return tSC
    }
    //Mismatch
    if (2 = branch) {
        Set pResponse.MatchResult = "Mismatch"
        Set pResponse.NID = ##Class(%Library.PopulateUtils).SSN()
        Return tSC
    }
    Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="EnsLib.EDI.XML.Document">
    <Method>Match</Method>
  </MapItem>
</MapItems>
}

}
