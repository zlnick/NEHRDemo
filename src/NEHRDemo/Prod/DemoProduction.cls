Class NEHRDemo.Prod.DemoProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="NEHRDemo.Prod.DemoProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="NEHRDemo.Process.VDocHandlingBPL" Category="" ClassName="NEHRDemo.Process.VDocHandlingBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="NEHRDemo.BS.EventHandlerBS" Category="" ClassName="NEHRDemo.BS.EventHandlerBS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="NEHRDemo.BO.MockMHAOperation" Category="" ClassName="NEHRDemo.BO.MockMHAOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MockUCR" Category="" ClassName="EnsLib.EDI.XML.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/usr/irissys/mgr/vDocRepo/UCR/</Setting>
  </Item>
  <Item Name="NEHRDemo.BO.SaveToTempTableOperation" Category="" ClassName="NEHRDemo.BO.SaveToTempTableOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="NEHRDemo.BO.LoggingOperation" Category="" ClassName="NEHRDemo.BO.LoggingOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="NotifySource" Category="" ClassName="EnsLib.EDI.XML.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/usr/irissys/mgr/vDocRepo/Source/</Setting>
  </Item>
</Production>
}

}
