Class NEHRDemo.DocTest Extends %RegisteredObject
{

ClassMethod test() As %Status
{
    Set tSC = $$$OK
    Set str = "<putEvent><controlHeader><srcInstitution>a</srcInstitution><srcApplication>b</srcApplication><msgID>111</msgID><msgSequenceID>1</msgSequenceID><msgDateTime>11111</msgDateTime><msgType>1</msgType></controlHeader><patient><identification><Identification><id>T2396181J</id><MRNNumber>cc49389absdb48567</MRNNumber><type>NRIC</type></Identification><Identification><id>49389743748567</id><MRNNumber>49389743748567</MRNNumber><type>MRN</type></Identification></identification><name><value>San Zhang</value><title>Mr.</title></name><aliasName><value>太乙</value><title>真人</title></aliasName><contactDetails><phone><Phone><type>cellphone</type><countryCode>+86</countryCode><phoneNumber>18568622334</phoneNumber></Phone></phone></contactDetails><dateOfBirth>2001-02-13</dateOfBirth><countryOfBirth>Singapore</countryOfBirth><gender>female</gender><emailAddress>zhangsan@gmail.com</emailAddress><nationality>Singapore</nationality><race>Mongoloid</race><maritalStatus>Widowed</maritalStatus><occupation>?</occupation></patient></putEvent>"
    Set doc = ##Class(EnsLib.EDI.XML.Document).ImportFromString(str)
    w ##Class(NEHRDemo.Utils.VDocUtils).FindByXPath(doc,"/putEvent/patient/identification","Identification[type='NRIC']/id/text()")
}

ClassMethod testDoc() As %Status
{
    Set tSC = $$$OK
    Set str = "<putEvent><controlHeader><srcInstitution>a</srcInstitution><srcApplication>b</srcApplication><msgID>111</msgID><msgSequenceID>1</msgSequenceID><msgDateTime>11111</msgDateTime><msgType>1</msgType></controlHeader><patient><identification><Identification><id>T2396181J</id><MRNNumber>cc49389absdb48567</MRNNumber><type>NRIC</type></Identification><Identification><id>49389743748567</id><MRNNumber>49389743748567</MRNNumber><type>MRN</type></Identification></identification><name><value>San Zhang</value><title>Mr.</title></name><aliasName><value>太乙</value><title>真人</title></aliasName><contactDetails><phone><Phone><type>cellphone</type><countryCode>+86</countryCode><phoneNumber>18568622334</phoneNumber></Phone></phone></contactDetails><dateOfBirth>2001-02-13</dateOfBirth><countryOfBirth>Singapore</countryOfBirth><gender>female</gender><emailAddress>zhangsan@gmail.com</emailAddress><nationality>Singapore</nationality><race>Mongoloid</race><maritalStatus>Widowed</maritalStatus><occupation>?</occupation></patient></putEvent>"
    Set doc = ##Class(EnsLib.EDI.XML.Document).ImportFromString(str)
    Set tmpStream = ##Class(%Stream.GlobalCharacter).%New()
    Set tSC = doc.XMLExportToStream(tmpStream)

    Set nric = ..GetNricIdFromXml(tmpStream)
    w nric
    Quit tSC
}

ClassMethod GetNricIdFromXml(xml As %Stream.GlobalCharacter) As %String
{
    set nricId = ""
    
    // 1. 直接使用XPath解析XML
    set sc = ##class(%XML.XPATH.Document).CreateFromStream(xml, .xpathDoc)
    //.CreateFromString(xml, .xpathDoc)
    if $$$ISERR(sc) quit ""
    
    // 2. XPath表达式：查找type为NRIC的Identification下的id节点
    set sc = xpathDoc.EvaluateExpression("/putEvent/patient/identification","Identification[type='NRIC']/id/text()", .results)
    if $$$ISERR(sc) quit ""
    
    // 3. 提取结果（第一个匹配项）
    if (results.Count() > 0) {
        set nricId = results.GetAt(1).Value
    }
    
    return nricId
}

}
