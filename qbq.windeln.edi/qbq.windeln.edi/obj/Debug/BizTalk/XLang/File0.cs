
#pragma warning disable 162

namespace qbq.windeln.edi
{

    [Microsoft.XLANGs.BaseTypes.PortTypeOperationAttribute(
        "Receive",
        new System.Type[]{
            typeof(qbq.windeln.edi.__messagetype_qbq_windeln_edi_NAVconnect_Fulfillment)
        },
        new string[]{
        }
    )]
    [Microsoft.XLANGs.BaseTypes.PortTypeAttribute(Microsoft.XLANGs.BaseTypes.EXLangSAccess.eInternal, "")]
    [System.SerializableAttribute]
    sealed internal class NAVOrderRPT : Microsoft.BizTalk.XLANGs.BTXEngine.BTXPortBase
    {
        public NAVOrderRPT(int portInfo, Microsoft.XLANGs.Core.IServiceProxy s)
            : base(portInfo, s)
        { }
        public NAVOrderRPT(NAVOrderRPT p)
            : base(p)
        { }

        public override Microsoft.XLANGs.Core.PortBase Clone()
        {
            NAVOrderRPT p = new NAVOrderRPT(this);
            return p;
        }

        public static readonly Microsoft.XLANGs.BaseTypes.EXLangSAccess __access = Microsoft.XLANGs.BaseTypes.EXLangSAccess.eInternal;
        #region port reflection support
        static public Microsoft.XLANGs.Core.OperationInfo Receive = new Microsoft.XLANGs.Core.OperationInfo
        (
            "Receive",
            System.Web.Services.Description.OperationFlow.OneWay,
            typeof(NAVOrderRPT),
            typeof(__messagetype_qbq_windeln_edi_NAVconnect_Fulfillment),
            null,
            new System.Type[]{},
            new string[]{}
        );
        static public System.Collections.Hashtable OperationsInformation
        {
            get
            {
                System.Collections.Hashtable h = new System.Collections.Hashtable();
                h[ "Receive" ] = Receive;
                return h;
            }
        }
        #endregion // port reflection support
    }

    [Microsoft.XLANGs.BaseTypes.PortTypeOperationAttribute(
        "Send",
        new System.Type[]{
            typeof(qbq.windeln.edi.__messagetype_qbq_windeln_edi_EFACT_D96A_ORDERS)
        },
        new string[]{
        }
    )]
    [Microsoft.XLANGs.BaseTypes.PortTypeAttribute(Microsoft.XLANGs.BaseTypes.EXLangSAccess.eInternal, "")]
    [System.SerializableAttribute]
    sealed internal class EDIOrderSPT : Microsoft.BizTalk.XLANGs.BTXEngine.BTXPortBase
    {
        public EDIOrderSPT(int portInfo, Microsoft.XLANGs.Core.IServiceProxy s)
            : base(portInfo, s)
        { }
        public EDIOrderSPT(EDIOrderSPT p)
            : base(p)
        { }

        public override Microsoft.XLANGs.Core.PortBase Clone()
        {
            EDIOrderSPT p = new EDIOrderSPT(this);
            return p;
        }

        public static readonly Microsoft.XLANGs.BaseTypes.EXLangSAccess __access = Microsoft.XLANGs.BaseTypes.EXLangSAccess.eInternal;
        #region port reflection support
        static public Microsoft.XLANGs.Core.OperationInfo Send = new Microsoft.XLANGs.Core.OperationInfo
        (
            "Send",
            System.Web.Services.Description.OperationFlow.OneWay,
            typeof(EDIOrderSPT),
            typeof(__messagetype_qbq_windeln_edi_EFACT_D96A_ORDERS),
            null,
            new System.Type[]{},
            new string[]{}
        );
        static public System.Collections.Hashtable OperationsInformation
        {
            get
            {
                System.Collections.Hashtable h = new System.Collections.Hashtable();
                h[ "Send" ] = Send;
                return h;
            }
        }
        #endregion // port reflection support
    }
    //#line 172 "C:\Users\jfuchs\Documents\Visual Studio 2012\Projects\qbq.windeln.edi\qbq.windeln.edi\ProcessNAVOrder.odx"
    [Microsoft.XLANGs.BaseTypes.StaticSubscriptionAttribute(
        0, "NAVOrderRP", "Receive", -1, -1, true
    )]
    [Microsoft.XLANGs.BaseTypes.ServicePortsAttribute(
        new Microsoft.XLANGs.BaseTypes.EXLangSParameter[] {
            Microsoft.XLANGs.BaseTypes.EXLangSParameter.ePort|Microsoft.XLANGs.BaseTypes.EXLangSParameter.eImplements,
            Microsoft.XLANGs.BaseTypes.EXLangSParameter.ePort|Microsoft.XLANGs.BaseTypes.EXLangSParameter.eUses
        },
        new System.Type[] {
            typeof(qbq.windeln.edi.NAVOrderRPT),
            typeof(qbq.windeln.edi.EDIOrderSPT)
        },
        new System.String[] {
            "NAVOrderRP",
            "EDIOrderSP"
        },
        new System.Type[] {
            null,
            null
        }
    )]
    [Microsoft.XLANGs.BaseTypes.ServiceCallTreeAttribute(
        new System.Type[] {
        },
        new System.Type[] {
        },
        new System.Type[] {
        }
    )]
    [Microsoft.XLANGs.BaseTypes.ServiceAttribute(
        Microsoft.XLANGs.BaseTypes.EXLangSAccess.eInternal,
        Microsoft.XLANGs.BaseTypes.EXLangSServiceInfo.eNone
    )]
    [System.SerializableAttribute]
    [Microsoft.XLANGs.BaseTypes.BPELExportableAttribute(false)]
    sealed internal class ProcessNAVOrder : Microsoft.BizTalk.XLANGs.BTXEngine.BTXService
    {
        public static readonly Microsoft.XLANGs.BaseTypes.EXLangSAccess __access = Microsoft.XLANGs.BaseTypes.EXLangSAccess.eInternal;
        public static readonly bool __execable = false;
        [Microsoft.XLANGs.BaseTypes.CallCompensationAttribute(
            Microsoft.XLANGs.BaseTypes.EXLangSCallCompensationInfo.eNone,
            new System.String[] {
            },
            new System.String[] {
            }
        )]
        public static void __bodyProxy()
        {
        }
        private static System.Guid _serviceId = Microsoft.XLANGs.Core.HashHelper.HashServiceType(typeof(ProcessNAVOrder));
        private static volatile System.Guid[] _activationSubIds;

        private static new object _lockIdentity = new object();

        public static System.Guid UUID { get { return _serviceId; } }
        public override System.Guid ServiceId { get { return UUID; } }

        protected override System.Guid[] ActivationSubGuids
        {
            get { return _activationSubIds; }
            set { _activationSubIds = value; }
        }

        protected override object StaleStateLock
        {
            get { return _lockIdentity; }
        }

        protected override bool HasActivation { get { return true; } }

        internal bool IsExeced = false;

        static ProcessNAVOrder()
        {
            Microsoft.BizTalk.XLANGs.BTXEngine.BTXService.CacheStaticState( _serviceId );
        }

        private void ConstructorHelper()
        {
            _segments = new Microsoft.XLANGs.Core.Segment[] {
                new Microsoft.XLANGs.Core.Segment( new Microsoft.XLANGs.Core.Segment.SegmentCode(this.segment0), 0, 0, 0),
                new Microsoft.XLANGs.Core.Segment( new Microsoft.XLANGs.Core.Segment.SegmentCode(this.segment1), 1, 1, 1)
            };

            _Locks = 0;
            _rootContext = new __ProcessNAVOrder_root_0(this);
            _stateMgrs = new Microsoft.XLANGs.Core.IStateManager[2];
            _stateMgrs[0] = _rootContext;
            FinalConstruct();
        }

        public ProcessNAVOrder(System.Guid instanceId, Microsoft.BizTalk.XLANGs.BTXEngine.BTXSession session, Microsoft.BizTalk.XLANGs.BTXEngine.BTXEvents tracker)
            : base(instanceId, session, "ProcessNAVOrder", tracker)
        {
            ConstructorHelper();
        }

        public ProcessNAVOrder(int callIndex, System.Guid instanceId, Microsoft.BizTalk.XLANGs.BTXEngine.BTXService parent)
            : base(callIndex, instanceId, parent, "ProcessNAVOrder")
        {
            ConstructorHelper();
        }

        private const string _symInfo = @"
<XsymFile>
<ProcessFlow xmlns:om='http://schemas.microsoft.com/BizTalk/2003/DesignerData'>      <shapeType>RootShape</shapeType>      <ShapeID>c0cb6af3-2297-4051-9478-480e2ba3ee3c</ShapeID>      
<children>                          
<ShapeInfo>      <shapeType>ReceiveShape</shapeType>      <ShapeID>c2f8375c-a2c4-41b0-a728-e787d3f6778d</ShapeID>      <ParentLink>ServiceBody_Statement</ParentLink>                <shapeText>Rcv NAVOrder</shapeText>                  
<children>                </children>
  </ShapeInfo>
                            
<ShapeInfo>      <shapeType>ConstructShape</shapeType>      <ShapeID>16195bc5-c2a6-46c2-8217-af8374cbf499</ShapeID>      <ParentLink>ServiceBody_Statement</ParentLink>                <shapeText>Cs EDIOrder</shapeText>                  
<children>                          
<ShapeInfo>      <shapeType>TransformShape</shapeType>      <ShapeID>67bb2a11-6567-4020-8b9d-470d58536ae6</ShapeID>      <ParentLink>ComplexStatement_Statement</ParentLink>                <shapeText>NAVPurchaseOrder_To_EDIOrdersD96A</shapeText>                  
<children>                          
<ShapeInfo>      <shapeType>MessagePartRefShape</shapeType>      <ShapeID>2def9adf-93b1-40a4-a48a-3482f907138d</ShapeID>      <ParentLink>Transform_InputMessagePartRef</ParentLink>                <shapeText>MessagePartReference_1</shapeText>                  
<children>                </children>
  </ShapeInfo>
                            
<ShapeInfo>      <shapeType>MessagePartRefShape</shapeType>      <ShapeID>4866762c-2ebe-4cd1-9084-0a12ef359692</ShapeID>      <ParentLink>Transform_OutputMessagePartRef</ParentLink>                <shapeText>MessagePartReference_2</shapeText>                  
<children>                </children>
  </ShapeInfo>
                  </children>
  </ShapeInfo>
                            
<ShapeInfo>      <shapeType>MessageRefShape</shapeType>      <ShapeID>c0593c56-0e8e-41e0-9dce-f3505a632504</ShapeID>      <ParentLink>Construct_MessageRef</ParentLink>                  
<children>                </children>
  </ShapeInfo>
                  </children>
  </ShapeInfo>
                            
<ShapeInfo>      <shapeType>SendShape</shapeType>      <ShapeID>59e8abaa-1a2c-4049-8be0-57ceda4ca066</ShapeID>      <ParentLink>ServiceBody_Statement</ParentLink>                <shapeText>Snd EDIOrder</shapeText>                  
<children>                </children>
  </ShapeInfo>
                  </children>
  </ProcessFlow><Metadata>

<TrkMetadata>
<ActionName>'ProcessNAVOrder'</ActionName><IsAtomic>0</IsAtomic><Line>172</Line><Position>14</Position><ShapeID>'e211a116-cb8b-44e7-a052-0de295aa0001'</ShapeID>
</TrkMetadata>

<TrkMetadata>
<Line>183</Line><Position>22</Position><ShapeID>'c2f8375c-a2c4-41b0-a728-e787d3f6778d'</ShapeID>
<Messages>
	<MsgInfo><name>NAVOrder</name><part>part</part><schema>qbq.windeln.edi.NAVconnect_Fulfillment</schema><direction>Out</direction></MsgInfo>
</Messages>
</TrkMetadata>

<TrkMetadata>
<Line>185</Line><Position>13</Position><ShapeID>'16195bc5-c2a6-46c2-8217-af8374cbf499'</ShapeID>
<Messages>
	<MsgInfo><name>EDIOrder</name><part>part</part><schema>qbq.windeln.edi.EFACT_D96A_ORDERS</schema><direction>Out</direction></MsgInfo>
	<MsgInfo><name>NAVOrder</name><part>part</part><schema>qbq.windeln.edi.NAVconnect_Fulfillment</schema><direction>In</direction></MsgInfo>
</Messages>
</TrkMetadata>

<TrkMetadata>
<Line>191</Line><Position>13</Position><ShapeID>'59e8abaa-1a2c-4049-8be0-57ceda4ca066'</ShapeID>
<Messages>
	<MsgInfo><name>EDIOrder</name><part>part</part><schema>qbq.windeln.edi.EFACT_D96A_ORDERS</schema><direction>Out</direction></MsgInfo>
</Messages>
</TrkMetadata>
</Metadata>
</XsymFile>";

        public override string odXml { get { return _symODXML; } }

        private const string _symODXML = @"
<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<om:MetaModel MajorVersion='1' MinorVersion='3' Core='2b131234-7959-458d-834f-2dc0769ce683' ScheduleModel='66366196-361d-448d-976f-cab5e87496d2' xmlns:om='http://schemas.microsoft.com/BizTalk/2003/DesignerData'>
    <om:Element Type='Module' OID='c04269a7-59e1-46f6-9a45-6d7ac0bad19a' LowerBound='1.1' HigherBound='42.1'>
        <om:Property Name='ReportToAnalyst' Value='True' />
        <om:Property Name='Name' Value='qbq.windeln.edi' />
        <om:Property Name='Signal' Value='False' />
        <om:Element Type='PortType' OID='65fff124-055e-4fb0-b87e-0e66cef88deb' ParentLink='Module_PortType' LowerBound='4.1' HigherBound='11.1'>
            <om:Property Name='Synchronous' Value='False' />
            <om:Property Name='TypeModifier' Value='Internal' />
            <om:Property Name='ReportToAnalyst' Value='True' />
            <om:Property Name='Name' Value='NAVOrderRPT' />
            <om:Property Name='Signal' Value='False' />
            <om:Element Type='OperationDeclaration' OID='917be23c-017a-4378-bd8f-02749774e176' ParentLink='PortType_OperationDeclaration' LowerBound='6.1' HigherBound='10.1'>
                <om:Property Name='OperationType' Value='OneWay' />
                <om:Property Name='ReportToAnalyst' Value='True' />
                <om:Property Name='Name' Value='Receive' />
                <om:Property Name='Signal' Value='True' />
                <om:Element Type='MessageRef' OID='00382f23-b06d-4cc0-acc1-f90b7c3835ef' ParentLink='OperationDeclaration_RequestMessageRef' LowerBound='8.13' HigherBound='8.35'>
                    <om:Property Name='Ref' Value='qbq.windeln.edi.NAVconnect_Fulfillment' />
                    <om:Property Name='ReportToAnalyst' Value='True' />
                    <om:Property Name='Name' Value='Request' />
                    <om:Property Name='Signal' Value='False' />
                </om:Element>
            </om:Element>
        </om:Element>
        <om:Element Type='PortType' OID='d60cd846-ad02-42c0-83a7-486c8c74330c' ParentLink='Module_PortType' LowerBound='11.1' HigherBound='18.1'>
            <om:Property Name='Synchronous' Value='False' />
            <om:Property Name='TypeModifier' Value='Internal' />
            <om:Property Name='ReportToAnalyst' Value='True' />
            <om:Property Name='Name' Value='EDIOrderSPT' />
            <om:Property Name='Signal' Value='False' />
            <om:Element Type='OperationDeclaration' OID='0512cd19-f29d-4e83-bb64-e3c51f42cc77' ParentLink='PortType_OperationDeclaration' LowerBound='13.1' HigherBound='17.1'>
                <om:Property Name='OperationType' Value='OneWay' />
                <om:Property Name='ReportToAnalyst' Value='True' />
                <om:Property Name='Name' Value='Send' />
                <om:Property Name='Signal' Value='True' />
                <om:Element Type='MessageRef' OID='a7b93753-6f67-4d5e-9f12-bfcb7831356c' ParentLink='OperationDeclaration_RequestMessageRef' LowerBound='15.13' HigherBound='15.30'>
                    <om:Property Name='Ref' Value='qbq.windeln.edi.EFACT_D96A_ORDERS' />
                    <om:Property Name='ReportToAnalyst' Value='True' />
                    <om:Property Name='Name' Value='Request' />
                    <om:Property Name='Signal' Value='False' />
                </om:Element>
            </om:Element>
        </om:Element>
        <om:Element Type='ServiceDeclaration' OID='b5baa6a9-c36a-4448-8224-900a27c36f36' ParentLink='Module_ServiceDeclaration' LowerBound='18.1' HigherBound='41.1'>
            <om:Property Name='InitializedTransactionType' Value='False' />
            <om:Property Name='IsInvokable' Value='False' />
            <om:Property Name='TypeModifier' Value='Internal' />
            <om:Property Name='ReportToAnalyst' Value='True' />
            <om:Property Name='Name' Value='ProcessNAVOrder' />
            <om:Property Name='Signal' Value='True' />
            <om:Element Type='ServiceBody' OID='c0cb6af3-2297-4051-9478-480e2ba3ee3c' ParentLink='ServiceDeclaration_ServiceBody'>
                <om:Property Name='Signal' Value='False' />
                <om:Element Type='Receive' OID='c2f8375c-a2c4-41b0-a728-e787d3f6778d' ParentLink='ServiceBody_Statement' LowerBound='29.1' HigherBound='31.1'>
                    <om:Property Name='Activate' Value='True' />
                    <om:Property Name='PortName' Value='NAVOrderRP' />
                    <om:Property Name='MessageName' Value='NAVOrder' />
                    <om:Property Name='OperationName' Value='Receive' />
                    <om:Property Name='OperationMessageName' Value='Request' />
                    <om:Property Name='ReportToAnalyst' Value='True' />
                    <om:Property Name='Name' Value='Rcv NAVOrder' />
                    <om:Property Name='Signal' Value='True' />
                </om:Element>
                <om:Element Type='Construct' OID='16195bc5-c2a6-46c2-8217-af8374cbf499' ParentLink='ServiceBody_Statement' LowerBound='31.1' HigherBound='37.1'>
                    <om:Property Name='ReportToAnalyst' Value='True' />
                    <om:Property Name='Name' Value='Cs EDIOrder' />
                    <om:Property Name='Signal' Value='True' />
                    <om:Element Type='Transform' OID='67bb2a11-6567-4020-8b9d-470d58536ae6' ParentLink='ComplexStatement_Statement' LowerBound='34.1' HigherBound='36.1'>
                        <om:Property Name='ClassName' Value='qbq.windeln.edi.NAVPurchaseOrder_To_EDIOrdersD96A' />
                        <om:Property Name='ReportToAnalyst' Value='True' />
                        <om:Property Name='Name' Value='NAVPurchaseOrder_To_EDIOrdersD96A' />
                        <om:Property Name='Signal' Value='True' />
                        <om:Element Type='MessagePartRef' OID='2def9adf-93b1-40a4-a48a-3482f907138d' ParentLink='Transform_InputMessagePartRef' LowerBound='35.91' HigherBound='35.99'>
                            <om:Property Name='MessageRef' Value='NAVOrder' />
                            <om:Property Name='ReportToAnalyst' Value='True' />
                            <om:Property Name='Name' Value='MessagePartReference_1' />
                            <om:Property Name='Signal' Value='False' />
                        </om:Element>
                        <om:Element Type='MessagePartRef' OID='4866762c-2ebe-4cd1-9084-0a12ef359692' ParentLink='Transform_OutputMessagePartRef' LowerBound='35.28' HigherBound='35.36'>
                            <om:Property Name='MessageRef' Value='EDIOrder' />
                            <om:Property Name='ReportToAnalyst' Value='True' />
                            <om:Property Name='Name' Value='MessagePartReference_2' />
                            <om:Property Name='Signal' Value='False' />
                        </om:Element>
                    </om:Element>
                    <om:Element Type='MessageRef' OID='c0593c56-0e8e-41e0-9dce-f3505a632504' ParentLink='Construct_MessageRef' LowerBound='32.23' HigherBound='32.31'>
                        <om:Property Name='Ref' Value='EDIOrder' />
                        <om:Property Name='ReportToAnalyst' Value='True' />
                        <om:Property Name='Signal' Value='False' />
                    </om:Element>
                </om:Element>
                <om:Element Type='Send' OID='59e8abaa-1a2c-4049-8be0-57ceda4ca066' ParentLink='ServiceBody_Statement' LowerBound='37.1' HigherBound='39.1'>
                    <om:Property Name='PortName' Value='EDIOrderSP' />
                    <om:Property Name='MessageName' Value='EDIOrder' />
                    <om:Property Name='OperationName' Value='Send' />
                    <om:Property Name='OperationMessageName' Value='Request' />
                    <om:Property Name='ReportToAnalyst' Value='True' />
                    <om:Property Name='Name' Value='Snd EDIOrder' />
                    <om:Property Name='Signal' Value='True' />
                </om:Element>
            </om:Element>
            <om:Element Type='PortDeclaration' OID='a522235d-0361-4d09-93ca-d28c60707c6f' ParentLink='ServiceDeclaration_PortDeclaration' LowerBound='21.1' HigherBound='23.1'>
                <om:Property Name='PortModifier' Value='Implements' />
                <om:Property Name='Orientation' Value='Left' />
                <om:Property Name='PortIndex' Value='6' />
                <om:Property Name='IsWebPort' Value='False' />
                <om:Property Name='OrderedDelivery' Value='False' />
                <om:Property Name='DeliveryNotification' Value='None' />
                <om:Property Name='Type' Value='qbq.windeln.edi.NAVOrderRPT' />
                <om:Property Name='ParamDirection' Value='In' />
                <om:Property Name='ReportToAnalyst' Value='True' />
                <om:Property Name='Name' Value='NAVOrderRP' />
                <om:Property Name='Signal' Value='False' />
                <om:Element Type='LogicalBindingAttribute' OID='45c76a3d-bf85-43ee-8534-0bf45b3c2c21' ParentLink='PortDeclaration_CLRAttribute' LowerBound='21.1' HigherBound='22.1'>
                    <om:Property Name='Signal' Value='False' />
                </om:Element>
            </om:Element>
            <om:Element Type='PortDeclaration' OID='4d03d166-a14d-4a1e-a303-97e8783809b5' ParentLink='ServiceDeclaration_PortDeclaration' LowerBound='23.1' HigherBound='25.1'>
                <om:Property Name='PortModifier' Value='Uses' />
                <om:Property Name='Orientation' Value='Right' />
                <om:Property Name='PortIndex' Value='15' />
                <om:Property Name='IsWebPort' Value='False' />
                <om:Property Name='OrderedDelivery' Value='False' />
                <om:Property Name='DeliveryNotification' Value='None' />
                <om:Property Name='Type' Value='qbq.windeln.edi.EDIOrderSPT' />
                <om:Property Name='ParamDirection' Value='In' />
                <om:Property Name='ReportToAnalyst' Value='True' />
                <om:Property Name='Name' Value='EDIOrderSP' />
                <om:Property Name='Signal' Value='False' />
                <om:Element Type='LogicalBindingAttribute' OID='30b85cbd-c23c-46e7-8f08-60523b7502c0' ParentLink='PortDeclaration_CLRAttribute' LowerBound='23.1' HigherBound='24.1'>
                    <om:Property Name='Signal' Value='False' />
                </om:Element>
            </om:Element>
            <om:Element Type='MessageDeclaration' OID='a0768471-3f18-443b-b0d0-8e64f5b2fa02' ParentLink='ServiceDeclaration_MessageDeclaration' LowerBound='25.1' HigherBound='26.1'>
                <om:Property Name='Type' Value='qbq.windeln.edi.NAVconnect_Fulfillment' />
                <om:Property Name='ParamDirection' Value='In' />
                <om:Property Name='ReportToAnalyst' Value='True' />
                <om:Property Name='Name' Value='NAVOrder' />
                <om:Property Name='Signal' Value='True' />
            </om:Element>
            <om:Element Type='MessageDeclaration' OID='b4b2e6a9-68dc-4219-9e59-cfc3e1d41f65' ParentLink='ServiceDeclaration_MessageDeclaration' LowerBound='26.1' HigherBound='27.1'>
                <om:Property Name='Type' Value='qbq.windeln.edi.EFACT_D96A_ORDERS' />
                <om:Property Name='ParamDirection' Value='In' />
                <om:Property Name='ReportToAnalyst' Value='True' />
                <om:Property Name='Name' Value='EDIOrder' />
                <om:Property Name='Signal' Value='True' />
            </om:Element>
        </om:Element>
    </om:Element>
</om:MetaModel>
";

        [System.SerializableAttribute]
        public class __ProcessNAVOrder_root_0 : Microsoft.XLANGs.Core.ServiceContext
        {
            public __ProcessNAVOrder_root_0(Microsoft.XLANGs.Core.Service svc)
                : base(svc, "ProcessNAVOrder")
            {
            }

            public override int Index { get { return 0; } }

            public override Microsoft.XLANGs.Core.Segment InitialSegment
            {
                get { return _service._segments[0]; }
            }
            public override Microsoft.XLANGs.Core.Segment FinalSegment
            {
                get { return _service._segments[0]; }
            }

            public override int CompensationSegment { get { return -1; } }
            public override bool OnError()
            {
                Finally();
                return false;
            }

            public override void Finally()
            {
                ProcessNAVOrder __svc__ = (ProcessNAVOrder)_service;
                __ProcessNAVOrder_root_0 __ctx0__ = (__ProcessNAVOrder_root_0)(__svc__._stateMgrs[0]);

                if (__svc__.EDIOrderSP != null)
                {
                    __svc__.EDIOrderSP.Close(this, null);
                    __svc__.EDIOrderSP = null;
                }
                if (__svc__.NAVOrderRP != null)
                {
                    __svc__.NAVOrderRP.Close(this, null);
                    __svc__.NAVOrderRP = null;
                }
                base.Finally();
            }

            internal Microsoft.XLANGs.Core.SubscriptionWrapper __subWrapper0;
        }


        [System.SerializableAttribute]
        public class __ProcessNAVOrder_1 : Microsoft.XLANGs.Core.ExceptionHandlingContext
        {
            public __ProcessNAVOrder_1(Microsoft.XLANGs.Core.Service svc)
                : base(svc, "ProcessNAVOrder")
            {
            }

            public override int Index { get { return 1; } }

            public override bool CombineParentCommit { get { return true; } }

            public override Microsoft.XLANGs.Core.Segment InitialSegment
            {
                get { return _service._segments[1]; }
            }
            public override Microsoft.XLANGs.Core.Segment FinalSegment
            {
                get { return _service._segments[1]; }
            }

            public override int CompensationSegment { get { return -1; } }
            public override bool OnError()
            {
                Finally();
                return false;
            }

            public override void Finally()
            {
                ProcessNAVOrder __svc__ = (ProcessNAVOrder)_service;
                __ProcessNAVOrder_1 __ctx1__ = (__ProcessNAVOrder_1)(__svc__._stateMgrs[1]);

                if (__ctx1__ != null && __ctx1__.__NAVOrder != null)
                {
                    __ctx1__.UnrefMessage(__ctx1__.__NAVOrder);
                    __ctx1__.__NAVOrder = null;
                }
                if (__ctx1__ != null && __ctx1__.__EDIOrder != null)
                {
                    __ctx1__.UnrefMessage(__ctx1__.__EDIOrder);
                    __ctx1__.__EDIOrder = null;
                }
                base.Finally();
            }

            [Microsoft.XLANGs.Core.UserVariableAttribute("NAVOrder")]
            public __messagetype_qbq_windeln_edi_NAVconnect_Fulfillment __NAVOrder;
            [Microsoft.XLANGs.Core.UserVariableAttribute("EDIOrder")]
            public __messagetype_qbq_windeln_edi_EFACT_D96A_ORDERS __EDIOrder;
        }

        private static Microsoft.XLANGs.Core.CorrelationType[] _correlationTypes = null;
        public override Microsoft.XLANGs.Core.CorrelationType[] CorrelationTypes { get { return _correlationTypes; } }

        private static System.Guid[] _convoySetIds;

        public override System.Guid[] ConvoySetGuids
        {
            get { return _convoySetIds; }
            set { _convoySetIds = value; }
        }

        public static object[] StaticConvoySetInformation
        {
            get {
                return null;
            }
        }

        [Microsoft.XLANGs.BaseTypes.LogicalBindingAttribute()]
        [Microsoft.XLANGs.BaseTypes.PortAttribute(
            Microsoft.XLANGs.BaseTypes.EXLangSParameter.eImplements
        )]
        [Microsoft.XLANGs.Core.UserVariableAttribute("NAVOrderRP")]
        internal NAVOrderRPT NAVOrderRP;
        [Microsoft.XLANGs.BaseTypes.LogicalBindingAttribute()]
        [Microsoft.XLANGs.BaseTypes.PortAttribute(
            Microsoft.XLANGs.BaseTypes.EXLangSParameter.eUses
        )]
        [Microsoft.XLANGs.Core.UserVariableAttribute("EDIOrderSP")]
        internal EDIOrderSPT EDIOrderSP;

        public static Microsoft.XLANGs.Core.PortInfo[] _portInfo = new Microsoft.XLANGs.Core.PortInfo[] {
            new Microsoft.XLANGs.Core.PortInfo(new Microsoft.XLANGs.Core.OperationInfo[] {NAVOrderRPT.Receive},
                                               typeof(ProcessNAVOrder).GetField("NAVOrderRP", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance),
                                               Microsoft.XLANGs.BaseTypes.Polarity.implements,
                                               false,
                                               Microsoft.XLANGs.Core.HashHelper.HashPort(typeof(ProcessNAVOrder), "NAVOrderRP"),
                                               null),
            new Microsoft.XLANGs.Core.PortInfo(new Microsoft.XLANGs.Core.OperationInfo[] {EDIOrderSPT.Send},
                                               typeof(ProcessNAVOrder).GetField("EDIOrderSP", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance),
                                               Microsoft.XLANGs.BaseTypes.Polarity.uses,
                                               false,
                                               Microsoft.XLANGs.Core.HashHelper.HashPort(typeof(ProcessNAVOrder), "EDIOrderSP"),
                                               null)
        };

        public override Microsoft.XLANGs.Core.PortInfo[] PortInformation
        {
            get { return _portInfo; }
        }

        static public System.Collections.Hashtable PortsInformation
        {
            get
            {
                System.Collections.Hashtable h = new System.Collections.Hashtable();
                h[_portInfo[0].Name] = _portInfo[0];
                h[_portInfo[1].Name] = _portInfo[1];
                return h;
            }
        }

        public static System.Type[] InvokedServicesTypes
        {
            get
            {
                return new System.Type[] {
                    // type of each service invoked by this service
                };
            }
        }

        public static System.Type[] CalledServicesTypes
        {
            get
            {
                return new System.Type[] {
                };
            }
        }

        public static System.Type[] ExecedServicesTypes
        {
            get
            {
                return new System.Type[] {
                };
            }
        }

        public static object[] StaticSubscriptionsInformation {
            get {
                return new object[1]{
                     new object[5] { _portInfo[0], 0, null , -1, true }
                };
            }
        }

        public static Microsoft.XLANGs.RuntimeTypes.Location[] __eventLocations = new Microsoft.XLANGs.RuntimeTypes.Location[] {
            new Microsoft.XLANGs.RuntimeTypes.Location(0, "00000000-0000-0000-0000-000000000000", 1, true),
            new Microsoft.XLANGs.RuntimeTypes.Location(1, "c2f8375c-a2c4-41b0-a728-e787d3f6778d", 1, true),
            new Microsoft.XLANGs.RuntimeTypes.Location(2, "c2f8375c-a2c4-41b0-a728-e787d3f6778d", 1, false),
            new Microsoft.XLANGs.RuntimeTypes.Location(3, "16195bc5-c2a6-46c2-8217-af8374cbf499", 1, true),
            new Microsoft.XLANGs.RuntimeTypes.Location(4, "16195bc5-c2a6-46c2-8217-af8374cbf499", 1, false),
            new Microsoft.XLANGs.RuntimeTypes.Location(5, "59e8abaa-1a2c-4049-8be0-57ceda4ca066", 1, true),
            new Microsoft.XLANGs.RuntimeTypes.Location(6, "59e8abaa-1a2c-4049-8be0-57ceda4ca066", 1, false),
            new Microsoft.XLANGs.RuntimeTypes.Location(7, "00000000-0000-0000-0000-000000000000", 1, false)
        };

        public override Microsoft.XLANGs.RuntimeTypes.Location[] EventLocations
        {
            get { return __eventLocations; }
        }

        public static Microsoft.XLANGs.RuntimeTypes.EventData[] __eventData = new Microsoft.XLANGs.RuntimeTypes.EventData[] {
            new Microsoft.XLANGs.RuntimeTypes.EventData( Microsoft.XLANGs.RuntimeTypes.Operation.Start | Microsoft.XLANGs.RuntimeTypes.Operation.Body),
            new Microsoft.XLANGs.RuntimeTypes.EventData( Microsoft.XLANGs.RuntimeTypes.Operation.Start | Microsoft.XLANGs.RuntimeTypes.Operation.Receive),
            new Microsoft.XLANGs.RuntimeTypes.EventData( Microsoft.XLANGs.RuntimeTypes.Operation.Start | Microsoft.XLANGs.RuntimeTypes.Operation.Construct),
            new Microsoft.XLANGs.RuntimeTypes.EventData( Microsoft.XLANGs.RuntimeTypes.Operation.Start | Microsoft.XLANGs.RuntimeTypes.Operation.Send),
            new Microsoft.XLANGs.RuntimeTypes.EventData( Microsoft.XLANGs.RuntimeTypes.Operation.End | Microsoft.XLANGs.RuntimeTypes.Operation.Body)
        };

        public static int[] __progressLocation0 = new int[] { 0,0,0,7,7,};
        public static int[] __progressLocation1 = new int[] { 0,0,1,1,2,3,3,4,5,5,5,6,7,7,7,7,};

        public static int[][] __progressLocations = new int[2] [] {__progressLocation0,__progressLocation1};
        public override int[][] ProgressLocations {get {return __progressLocations;} }

        public Microsoft.XLANGs.Core.StopConditions segment0(Microsoft.XLANGs.Core.StopConditions stopOn)
        {
            Microsoft.XLANGs.Core.Segment __seg__ = _segments[0];
            Microsoft.XLANGs.Core.Context __ctx__ = (Microsoft.XLANGs.Core.Context)_stateMgrs[0];
            __ProcessNAVOrder_root_0 __ctx0__ = (__ProcessNAVOrder_root_0)_stateMgrs[0];
            __ProcessNAVOrder_1 __ctx1__ = (__ProcessNAVOrder_1)_stateMgrs[1];

            switch (__seg__.Progress)
            {
            case 0:
                NAVOrderRP = new NAVOrderRPT(0, this);
                EDIOrderSP = new EDIOrderSPT(1, this);
                __ctx__.PrologueCompleted = true;
                __ctx0__.__subWrapper0 = new Microsoft.XLANGs.Core.SubscriptionWrapper(ActivationSubGuids[0], NAVOrderRP, this);
                if ( !PostProgressInc( __seg__, __ctx__, 1 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                if ((stopOn & Microsoft.XLANGs.Core.StopConditions.Initialized) != 0)
                    return Microsoft.XLANGs.Core.StopConditions.Initialized;
                goto case 1;
            case 1:
                __ctx1__ = new __ProcessNAVOrder_1(this);
                _stateMgrs[1] = __ctx1__;
                if ( !PostProgressInc( __seg__, __ctx__, 2 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                goto case 2;
            case 2:
                __ctx0__.StartContext(__seg__, __ctx1__);
                if ( !PostProgressInc( __seg__, __ctx__, 3 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                return Microsoft.XLANGs.Core.StopConditions.Blocked;
            case 3:
                if (!__ctx0__.CleanupAndPrepareToCommit(__seg__))
                    return Microsoft.XLANGs.Core.StopConditions.Blocked;
                if ( !PostProgressInc( __seg__, __ctx__, 4 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                goto case 4;
            case 4:
                __ctx1__.Finally();
                ServiceDone(__seg__, (Microsoft.XLANGs.Core.Context)_stateMgrs[0]);
                __ctx0__.OnCommit();
                break;
            }
            return Microsoft.XLANGs.Core.StopConditions.Completed;
        }

        public Microsoft.XLANGs.Core.StopConditions segment1(Microsoft.XLANGs.Core.StopConditions stopOn)
        {
            Microsoft.XLANGs.Core.Envelope __msgEnv__ = null;
            Microsoft.XLANGs.Core.Segment __seg__ = _segments[1];
            Microsoft.XLANGs.Core.Context __ctx__ = (Microsoft.XLANGs.Core.Context)_stateMgrs[1];
            __ProcessNAVOrder_root_0 __ctx0__ = (__ProcessNAVOrder_root_0)_stateMgrs[0];
            __ProcessNAVOrder_1 __ctx1__ = (__ProcessNAVOrder_1)_stateMgrs[1];

            switch (__seg__.Progress)
            {
            case 0:
                __ctx__.PrologueCompleted = true;
                if ( !PostProgressInc( __seg__, __ctx__, 1 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                goto case 1;
            case 1:
                if ( !PreProgressInc( __seg__, __ctx__, 2 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                Tracker.FireEvent(__eventLocations[0],__eventData[0],_stateMgrs[1].TrackDataStream );
                if (IsDebugged)
                    return Microsoft.XLANGs.Core.StopConditions.InBreakpoint;
                goto case 2;
            case 2:
                if ( !PreProgressInc( __seg__, __ctx__, 3 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                Tracker.FireEvent(__eventLocations[1],__eventData[1],_stateMgrs[1].TrackDataStream );
                if (IsDebugged)
                    return Microsoft.XLANGs.Core.StopConditions.InBreakpoint;
                goto case 3;
            case 3:
                if (!NAVOrderRP.GetMessageId(__ctx0__.__subWrapper0.getSubscription(this), __seg__, __ctx1__, out __msgEnv__))
                    return Microsoft.XLANGs.Core.StopConditions.Blocked;
                if (__ctx1__.__NAVOrder != null)
                    __ctx1__.UnrefMessage(__ctx1__.__NAVOrder);
                __ctx1__.__NAVOrder = new __messagetype_qbq_windeln_edi_NAVconnect_Fulfillment("NAVOrder", __ctx1__);
                __ctx1__.RefMessage(__ctx1__.__NAVOrder);
                NAVOrderRP.ReceiveMessage(0, __msgEnv__, __ctx1__.__NAVOrder, null, (Microsoft.XLANGs.Core.Context)_stateMgrs[1], __seg__);
                if (NAVOrderRP != null)
                {
                    NAVOrderRP.Close(__ctx1__, __seg__);
                    NAVOrderRP = null;
                }
                if ( !PostProgressInc( __seg__, __ctx__, 4 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                goto case 4;
            case 4:
                if ( !PreProgressInc( __seg__, __ctx__, 5 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                {
                    Microsoft.XLANGs.RuntimeTypes.EventData __edata = new Microsoft.XLANGs.RuntimeTypes.EventData(Microsoft.XLANGs.RuntimeTypes.Operation.End | Microsoft.XLANGs.RuntimeTypes.Operation.Receive);
                    __edata.Messages.Add(__ctx1__.__NAVOrder);
                    __edata.PortName = @"NAVOrderRP";
                    Tracker.FireEvent(__eventLocations[2],__edata,_stateMgrs[1].TrackDataStream );
                }
                if (IsDebugged)
                    return Microsoft.XLANGs.Core.StopConditions.InBreakpoint;
                goto case 5;
            case 5:
                if ( !PreProgressInc( __seg__, __ctx__, 6 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                Tracker.FireEvent(__eventLocations[3],__eventData[2],_stateMgrs[1].TrackDataStream );
                if (IsDebugged)
                    return Microsoft.XLANGs.Core.StopConditions.InBreakpoint;
                goto case 6;
            case 6:
                {
                    __messagetype_qbq_windeln_edi_EFACT_D96A_ORDERS __EDIOrder = new __messagetype_qbq_windeln_edi_EFACT_D96A_ORDERS("EDIOrder", __ctx1__);

                    ApplyTransform(typeof(qbq.windeln.edi.NAVPurchaseOrder_To_EDIOrdersD96A), new object[] {__EDIOrder.part}, new object[] {__ctx1__.__NAVOrder.part});

                    if (__ctx1__.__EDIOrder != null)
                        __ctx1__.UnrefMessage(__ctx1__.__EDIOrder);
                    __ctx1__.__EDIOrder = __EDIOrder;
                    __ctx1__.RefMessage(__ctx1__.__EDIOrder);
                }
                __ctx1__.__EDIOrder.ConstructionCompleteEvent(true);
                if ( !PostProgressInc( __seg__, __ctx__, 7 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                goto case 7;
            case 7:
                if ( !PreProgressInc( __seg__, __ctx__, 8 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                {
                    Microsoft.XLANGs.RuntimeTypes.EventData __edata = new Microsoft.XLANGs.RuntimeTypes.EventData(Microsoft.XLANGs.RuntimeTypes.Operation.End | Microsoft.XLANGs.RuntimeTypes.Operation.Construct);
                    __edata.Messages.Add(__ctx1__.__EDIOrder);
                    __edata.Messages.Add(__ctx1__.__NAVOrder);
                    Tracker.FireEvent(__eventLocations[4],__edata,_stateMgrs[1].TrackDataStream );
                }
                if (__ctx1__ != null && __ctx1__.__NAVOrder != null)
                {
                    __ctx1__.UnrefMessage(__ctx1__.__NAVOrder);
                    __ctx1__.__NAVOrder = null;
                }
                if (IsDebugged)
                    return Microsoft.XLANGs.Core.StopConditions.InBreakpoint;
                goto case 8;
            case 8:
                if ( !PreProgressInc( __seg__, __ctx__, 9 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                Tracker.FireEvent(__eventLocations[5],__eventData[3],_stateMgrs[1].TrackDataStream );
                if (IsDebugged)
                    return Microsoft.XLANGs.Core.StopConditions.InBreakpoint;
                goto case 9;
            case 9:
                if (!__ctx1__.PrepareToPendingCommit(__seg__))
                    return Microsoft.XLANGs.Core.StopConditions.Blocked;
                if ( !PostProgressInc( __seg__, __ctx__, 10 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                goto case 10;
            case 10:
                if ( !PreProgressInc( __seg__, __ctx__, 11 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                EDIOrderSP.SendMessage(0, __ctx1__.__EDIOrder, null, null, __ctx1__, __seg__ , Microsoft.XLANGs.Core.ActivityFlags.NextActivityPersists );
                if (EDIOrderSP != null)
                {
                    EDIOrderSP.Close(__ctx1__, __seg__);
                    EDIOrderSP = null;
                }
                if ((stopOn & Microsoft.XLANGs.Core.StopConditions.OutgoingRqst) != 0)
                    return Microsoft.XLANGs.Core.StopConditions.OutgoingRqst;
                goto case 11;
            case 11:
                if ( !PreProgressInc( __seg__, __ctx__, 12 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                {
                    Microsoft.XLANGs.RuntimeTypes.EventData __edata = new Microsoft.XLANGs.RuntimeTypes.EventData(Microsoft.XLANGs.RuntimeTypes.Operation.End | Microsoft.XLANGs.RuntimeTypes.Operation.Send);
                    __edata.Messages.Add(__ctx1__.__EDIOrder);
                    __edata.PortName = @"EDIOrderSP";
                    Tracker.FireEvent(__eventLocations[6],__edata,_stateMgrs[1].TrackDataStream );
                }
                if (__ctx1__ != null && __ctx1__.__EDIOrder != null)
                {
                    __ctx1__.UnrefMessage(__ctx1__.__EDIOrder);
                    __ctx1__.__EDIOrder = null;
                }
                if (IsDebugged)
                    return Microsoft.XLANGs.Core.StopConditions.InBreakpoint;
                goto case 12;
            case 12:
                if ( !PreProgressInc( __seg__, __ctx__, 13 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                Tracker.FireEvent(__eventLocations[7],__eventData[4],_stateMgrs[1].TrackDataStream );
                if (IsDebugged)
                    return Microsoft.XLANGs.Core.StopConditions.InBreakpoint;
                goto case 13;
            case 13:
                if (!__ctx1__.CleanupAndPrepareToCommit(__seg__))
                    return Microsoft.XLANGs.Core.StopConditions.Blocked;
                if ( !PostProgressInc( __seg__, __ctx__, 14 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                goto case 14;
            case 14:
                if ( !PreProgressInc( __seg__, __ctx__, 15 ) )
                    return Microsoft.XLANGs.Core.StopConditions.Paused;
                __ctx1__.OnCommit();
                goto case 15;
            case 15:
                __seg__.SegmentDone();
                _segments[0].PredecessorDone(this);
                break;
            }
            return Microsoft.XLANGs.Core.StopConditions.Completed;
        }
    }

    [System.SerializableAttribute]
    sealed public class __qbq_windeln_edi_NAVconnect_Fulfillment__ : Microsoft.XLANGs.Core.XSDPart
    {
        private static qbq.windeln.edi.NAVconnect_Fulfillment _schema = new qbq.windeln.edi.NAVconnect_Fulfillment();

        public __qbq_windeln_edi_NAVconnect_Fulfillment__(Microsoft.XLANGs.Core.XMessage msg, string name, int index) : base(msg, name, index) { }

        
        #region part reflection support
        public static Microsoft.XLANGs.BaseTypes.SchemaBase PartSchema { get { return (Microsoft.XLANGs.BaseTypes.SchemaBase)_schema; } }
        #endregion // part reflection support
    }

    [Microsoft.XLANGs.BaseTypes.MessageTypeAttribute(
        Microsoft.XLANGs.BaseTypes.EXLangSAccess.ePublic,
        Microsoft.XLANGs.BaseTypes.EXLangSMessageInfo.eThirdKind,
        "qbq.windeln.edi.NAVconnect_Fulfillment",
        new System.Type[]{
            typeof(qbq.windeln.edi.NAVconnect_Fulfillment)
        },
        new string[]{
            "part"
        },
        new System.Type[]{
            typeof(__qbq_windeln_edi_NAVconnect_Fulfillment__)
        },
        0,
        @"http://schema.mp-gruppe.de/NAVconnect/Fulfillment#Transfer"
    )]
    [System.SerializableAttribute]
    sealed public class __messagetype_qbq_windeln_edi_NAVconnect_Fulfillment : Microsoft.BizTalk.XLANGs.BTXEngine.BTXMessage
    {
        public __qbq_windeln_edi_NAVconnect_Fulfillment__ part;

        private void __CreatePartWrappers()
        {
            part = new __qbq_windeln_edi_NAVconnect_Fulfillment__(this, "part", 0);
            this.AddPart("part", 0, part);
        }

        public __messagetype_qbq_windeln_edi_NAVconnect_Fulfillment(string msgName, Microsoft.XLANGs.Core.Context ctx) : base(msgName, ctx)
        {
            __CreatePartWrappers();
        }
    }

    [System.SerializableAttribute]
    sealed public class __qbq_windeln_edi_EFACT_D96A_ORDERS__ : Microsoft.XLANGs.Core.XSDPart
    {
        private static qbq.windeln.edi.EFACT_D96A_ORDERS _schema = new qbq.windeln.edi.EFACT_D96A_ORDERS();

        public __qbq_windeln_edi_EFACT_D96A_ORDERS__(Microsoft.XLANGs.Core.XMessage msg, string name, int index) : base(msg, name, index) { }

        
        #region part reflection support
        public static Microsoft.XLANGs.BaseTypes.SchemaBase PartSchema { get { return (Microsoft.XLANGs.BaseTypes.SchemaBase)_schema; } }
        #endregion // part reflection support
    }

    [Microsoft.XLANGs.BaseTypes.MessageTypeAttribute(
        Microsoft.XLANGs.BaseTypes.EXLangSAccess.ePublic,
        Microsoft.XLANGs.BaseTypes.EXLangSMessageInfo.eThirdKind,
        "qbq.windeln.edi.EFACT_D96A_ORDERS",
        new System.Type[]{
            typeof(qbq.windeln.edi.EFACT_D96A_ORDERS)
        },
        new string[]{
            "part"
        },
        new System.Type[]{
            typeof(__qbq_windeln_edi_EFACT_D96A_ORDERS__)
        },
        0,
        @"http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006#EFACT_D96A_ORDERS"
    )]
    [System.SerializableAttribute]
    sealed public class __messagetype_qbq_windeln_edi_EFACT_D96A_ORDERS : Microsoft.BizTalk.XLANGs.BTXEngine.BTXMessage
    {
        public __qbq_windeln_edi_EFACT_D96A_ORDERS__ part;

        private void __CreatePartWrappers()
        {
            part = new __qbq_windeln_edi_EFACT_D96A_ORDERS__(this, "part", 0);
            this.AddPart("part", 0, part);
        }

        public __messagetype_qbq_windeln_edi_EFACT_D96A_ORDERS(string msgName, Microsoft.XLANGs.Core.Context ctx) : base(msgName, ctx)
        {
            __CreatePartWrappers();
        }
    }

    [Microsoft.XLANGs.BaseTypes.BPELExportableAttribute(false)]
    sealed public class _MODULE_PROXY_ { }
}
