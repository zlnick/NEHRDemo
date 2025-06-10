# 安装流程
注意目前docker容器仅能启动iris，业务功能均需手动配置
1. 建立命名空间Demo，如改为其它名称则需要调整SOAPUI中的http路径
2. 导入/lookupTable下的三个xml
3. 编制/src/NEHRDemo
4. 在Demo中打开production NEHRDemo.Prod.DemoProduction，设置MockUCR与NotifySource的保存路径和字符集（utf-8）
5. 建立一个Web application，/NEHR/Services，启用分析和入站Web服务，取消防止登录 CSRF 攻击，允许的身份验证方法设置为未验证，ApplicationRoles设置为%All
6. 在IRIS命名行下切换到命名空间Demo，运行:
set ^SYS("Security","CSP","AllowClass","/NEHR/Services/","%SOAP.WebServiceInfo")=1
set ^SYS("Security","CSP","AllowClass","/NEHR/Services/","%SOAP.WebServiceInvoke")=1

# 使用
1. 通过SOAPUI加载项目文件/SOAPUIproj/NEHRDemo.xml即可访问服务，wsdl地址为：http://localhost:52880/NEHR/Services/NEHRDemo.SOAP.NEHR.SOAPServices.cls?wsdl，其中localhost:52880可换为实际的IRIS服务器地址与端口
2. Simple.xml与test.xml均为样例报文，可参考使用
3. SOAP服务HandleEvent为主入口，报文应放在payload元素下，要注意应以<![CDATA[]]>包裹
4. Production中的MockUCR与NotifySource为模拟系统，分别模拟对接的UCR接口与原系统接收通知的接口，现在仅仅是将报文保存下来，为实现任何其它业务逻辑。
5. NEHRDemo.Process.VDocHandlingBPL为主要流程，已经实现了匹配NID和校验报文的逻辑
6. Demo3中要求的临时表为NEHRDemo.TempTables.NoNIDRecords
7. Demo4中要求的校验日志在NEHRDemo.Logs.DataExceptionLog中，校验逻辑上均有注释说明校验了什么，包括：


