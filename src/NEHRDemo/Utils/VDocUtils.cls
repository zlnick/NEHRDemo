Class NEHRDemo.Utils.VDocUtils Extends Ens.Rule.FunctionSet
{

ClassMethod GetDocValueAt(doc As EnsLib.EDI.XML.Document, pPropertyPath As %String = "") As %String
{
    Quit doc.GetValueAt(pPropertyPath)
}

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

}
