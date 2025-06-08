Class NEHRDemo.BO.SaveToTempTableOperation Extends Ens.BusinessOperation
{

Method SaveToTempTable(pRequest As NEHRDemo.Messages.TempTable.SaveRequest, Output pResponse As NEHRDemo.Messages.TempTable.SaveResponse) As %Status
{
    Set tSC = $$$OK
    #Dim record As NEHRDemo.TempTables.NoNIDRecords = ##Class(NEHRDemo.TempTables.NoNIDRecords).%New()
    Set record.MessageId = pRequest.MessageId
    Set record.SessionId = pRequest.SessionId
    Set record.content = ##Class(%Stream.GlobalCharacter).%New()
    Set tSC = pRequest.doc.OutputToLibraryStream(record.content)
    Set tSC = record.%Save()
    Set pResponse = ##Class(NEHRDemo.Messages.TempTable.SaveResponse).%New()
    Set pResponse.RecordId = record.%Id()
    Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="NEHRDemo.Messages.TempTable.SaveRequest">
    <Method>SaveToTempTable</Method>
  </MapItem>
</MapItems>
}

}
