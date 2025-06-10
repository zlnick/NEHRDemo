Class NEHRDemo.Utils.VDocUtils Extends Ens.Rule.FunctionSet
{

ClassMethod GetDocValueAt(doc As EnsLib.EDI.XML.Document, pPropertyPath As %String = "") As %String
{
    Quit doc.GetValueAt(pPropertyPath)
}

// Find an element value from vDoc with xPAth context_"/"_expression"

ClassMethod FindByXPath(doc As EnsLib.EDI.XML.Document, context As %String, expression As %String) As %String
{
    Set rtn = ""
    Set docStream = ##Class(%Stream.GlobalCharacter).%New()
    Set tSC = doc.XMLExportToStream(.docStream)
    set tSC = ##class(%XML.XPATH.Document).CreateFromStream(docStream, .xpathDoc)
    set tSC = xpathDoc.EvaluateExpression(context, expression, .results)
    if (results.Count() > 0) {
        set rtn = results.GetAt(1).Value
    }
    Quit rtn
}

// Insert an issue in the validation log

ClassMethod AppendValidateIssue(ByRef log As NEHRDemo.Logs.DataExceptionLog, resourceType As %String, reason As %String, position As %String) As %Status
{
    #Dim issue As NEHRDemo.Validate.ValidateIssue = ##Class(NEHRDemo.Validate.ValidateIssue).%New()
    Set ^Temp("Doc") = log
    Set issue.ResourceType = resourceType
    Set issue.Reason = reason
    Set issue.Position = position
    Set tSC = log.Issues.Insert(issue)
    Quit tSC
}

// Compare whether endDate is later than startDate

ClassMethod DateLaterThan(endDate As %String, startDate As %String) As %Boolean
{
    Quit ($zdth(endDate,9)>$zdth(startDate,9))
}

}
