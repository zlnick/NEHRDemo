# 安装流程
注意目前docker容器仅能启动iris，业务功能均需手动配置
1. 建立命名空间Demo，如改为其它名称则需要调整SOAPUI中的http路径
2. 导入/lookupTable下的三个xml
3. 编译/src/NEHRDemo
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
7. Demo4中要求的校验日志在NEHRDemo.Logs.DataExceptionLog中，校验逻辑上均有注释说明校验了什么
8. 生成演示数据：
需要让Production在运行中才能执行，需要遵循顺序：
1). 
//numberofevents为需要生成的事件数量，一次生成1000条耗时约30秒
Do ##Class(NEHRDemo.Utils.DataGenerator).GenAndPush([numberofevents])
2).
//dayCounts为希望让事件分布的天数，例如为20时，程序将修改消息和log的事件，让他们从当前时间的20+随机(10~30)天前开始分布于20天内，且会保留一小部分消息和事件的时间不变
Do ##Class(NEHRDemo.Utils.DataGenerator).UpdateTimeline([dayCounts])
9. 有一个名为EventLog的数据面板，其中包含4个图表，其中:
1). EventValidation Result支持两级下钻(双击)，第一级下钻后演示的内容与InvalidDoc distribution by Institution的切分逻辑是相同的，可以演示说明统一分析模型能够让用户采用不同的纬度、时间范围、显示风格来展现数据时保障数据的一致性。
2). Top 5 issue occurences支持列表（单击数据单元格），可以展示错误详情，字段基本遵循Demo 4的需求，仅缺少sector



