Class NEHRDemo.BO.LoggingOperation Extends Ens.BusinessOperation
{

Method Log(pRequest As NEHRDemo.Messages.AddLogRequest, Output pResponse As NEHRDemo.Messages.AddLogResponse) As %Status
{
    Set tSC = $$$OK
    Set tSC = pRequest.log.%Save()
    Set pResponse = ##Class(NEHRDemo.Messages.AddLogResponse).%New()
    Set pResponse.logId = pRequest.log.%Id()
    Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="NEHRDemo.Messages.AddLogRequest">
    <Method>Log</Method>
  </MapItem>
</MapItems>
}

}
