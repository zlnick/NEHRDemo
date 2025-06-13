Class NEHRDemo.DocTest Extends %RegisteredObject
{

ClassMethod test() As %Status
{
    Set tSC = $$$OK
    Set str = "<putEvent><controlHeader><srcInstitution>a</srcInstitution><srcApplication>b</srcApplication><msgID>111</msgID><msgSequenceID>1</msgSequenceID><msgDateTime>11111</msgDateTime><msgType>1</msgType></controlHeader><patient><identification><Identification><id>T2396181J</id><MRNNumber>cc49389absdb48567</MRNNumber><type>NRIC</type></Identification><Identification><id>49389743748567</id><MRNNumber>49389743748567</MRNNumber><type>MRN</type></Identification></identification><name><value>San Zhang</value><title>Mr.</title></name><aliasName><value>太乙</value><title>真人</title></aliasName><contactDetails><phone><Phone><type>cellphone</type><countryCode>+86</countryCode><phoneNumber>18568622334</phoneNumber></Phone></phone></contactDetails><dateOfBirth>2001-02-13</dateOfBirth><countryOfBirth>Singapore</countryOfBirth><gender>female</gender><emailAddress>zhangsan@gmail.com</emailAddress><nationality>Singapore</nationality><race>Mongoloid</race><maritalStatus>Widowed</maritalStatus><occupation>?</occupation></patient></putEvent>"
    Set doc = ##Class(EnsLib.EDI.XML.Document).ImportFromString(str)
    w ##Class(NEHRDemo.Utils.VDocUtils).FindByXPath(doc,"/putEvent/controlHeader/srcInstitution","text()")
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

ClassMethod TestAddingIssue() As %Status
{
    #Dim log As NEHRDemo.Logs.DataExceptionLog = ##Class(NEHRDemo.Logs.DataExceptionLog).%New()
    Set tSC = ##Class(NEHRDemo.Utils.VDocUtils).AppendValidateIssue(.log,"Patient","a","1")
    Set tSC = ##Class(NEHRDemo.Utils.VDocUtils).AppendValidateIssue(.log,"Patient","b","2")
    Set tSC = ##Class(NEHRDemo.Utils.VDocUtils).AppendValidateIssue(.log,"Encounter","c","3")
    Set tSC = ##Class(NEHRDemo.Utils.VDocUtils).AppendValidateIssue(.log,"Diagnosis","d","4")
    zw log
    Quit tSC
}

ClassMethod TestBI() As %Status
{
    Set tSC = $$$OK
    Set parent1 = ##Class(Test.Parent).%New()
    Set parent1.name = "p1"
    Set chlid1 = ##Class(Test.Child).%New()
    Set chlid1.childName = "c1"
    Set chlid2 = ##Class(Test.Child).%New()
    Set chlid2.childName = "c2"
    Set tSC = parent1.childrens.Insert(chlid1)
    Set tSC = parent1.childrens.Insert(chlid2)
    Set tSC = parent1.%Save()
    Set tSC = $$$OK
    Set parent2 = ##Class(Test.Parent).%New()
    Set parent2.name = "p2"
    Set chlid3 = ##Class(Test.Child).%New()
    Set chlid3.childName = "c3"
    Set chlid4 = ##Class(Test.Child).%New()
    Set chlid4.childName = "c4"
    Set chlid5 = ##Class(Test.Child).%New()
    Set chlid5.childName = "c5"
    Set tSC = parent2.childrens.Insert(chlid3)
    Set tSC = parent2.childrens.Insert(chlid4)
    Set tSC = parent2.childrens.Insert(chlid5)
    Set tSC = parent2.%Save()
    Quit tSC
}

}
