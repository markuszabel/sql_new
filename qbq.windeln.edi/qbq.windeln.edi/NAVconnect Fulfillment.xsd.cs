namespace qbq.windeln.edi {
    using Microsoft.XLANGs.BaseTypes;
    
    
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.BizTalk.Schema.Compiler", "3.0.1.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [SchemaType(SchemaTypeEnum.Document)]
    [Schema(@"http://schema.mp-gruppe.de/NAVconnect/Fulfillment",@"Transfer")]
    [System.SerializableAttribute()]
    [SchemaRoots(new string[] {@"Transfer"})]
    public sealed class NAVconnect_Fulfillment : Microsoft.XLANGs.BaseTypes.SchemaBase {
        
        [System.NonSerializedAttribute()]
        private static object _rawSchema;
        
        [System.NonSerializedAttribute()]
        private const string _strSchema = @"<?xml version=""1.0"" encoding=""utf-16""?>
<xsd:schema xmlns=""http://schema.mp-gruppe.de/NAVconnect/Fulfillment"" xmlns:b=""http://schemas.microsoft.com/BizTalk/2003"" elementFormDefault=""qualified"" targetNamespace=""http://schema.mp-gruppe.de/NAVconnect/Fulfillment"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"">
  <xsd:simpleType name=""String2"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""2"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""String4"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""4"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""String8"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""8"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""String9"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""9"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""String10"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""10"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""String15"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""15"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""String20"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""20"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""String25"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""25"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""String30"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""30"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""String40"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""40"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""String50"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""50"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""String80"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""80"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""OrderNoType"">
    <xsd:restriction base=""String20"" />
  </xsd:simpleType>
  <xsd:simpleType name=""CustomerNoType"">
    <xsd:restriction base=""String9"" />
  </xsd:simpleType>
  <xsd:simpleType name=""ShippingNoType"">
    <xsd:restriction base=""String20"" />
  </xsd:simpleType>
  <xsd:simpleType name=""CurrencyCodeType"">
    <xsd:restriction base=""xsd:normalizedString"">
      <xsd:maxLength value=""3"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""LanguageCodeType"">
    <xsd:restriction base=""xsd:normalizedString"">
      <xsd:maxLength value=""3"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""CountryCodeType"">
    <xsd:restriction base=""xsd:normalizedString"">
      <xsd:maxLength value=""4"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""PercentageType"">
    <xsd:restriction base=""xsd:float"">
      <xsd:minInclusive value=""0"" />
      <xsd:maxInclusive value=""100"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:complexType name=""AmountType"">
    <xsd:simpleContent>
      <xsd:extension base=""xsd:float"">
        <xsd:attribute name=""currency"" type=""CurrencyCodeType"" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name=""SalesAmountType"">
    <xsd:simpleContent>
      <xsd:extension base=""xsd:float"">
        <xsd:attribute name=""currency"" type=""CurrencyCodeType"" />
        <xsd:attribute name=""VATAmount"" type=""xsd:float"" />
        <xsd:attribute name=""VATPercent"" type=""PercentageType"" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:simpleType name=""EmailType"">
    <xsd:restriction base=""xsd:string"">
      <xsd:maxLength value=""50"" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name=""UnitOfMeasureType"">
    <xsd:restriction base=""String10"" />
  </xsd:simpleType>
  <xsd:simpleType name=""ItemNoType"">
    <xsd:restriction base=""String20"" />
  </xsd:simpleType>
  <xsd:simpleType name=""ItemVariantCodeType"">
    <xsd:restriction base=""String8"" />
  </xsd:simpleType>
  <xsd:simpleType name=""ItemConditionType"">
    <xsd:restriction base=""String10"" />
  </xsd:simpleType>
  <xsd:complexType name=""QuantityType"">
    <xsd:simpleContent>
      <xsd:extension base=""xsd:float"">
        <xsd:attribute name=""unit"" type=""UnitOfMeasureType"" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name=""AddressType"">
    <xsd:sequence>
      <xsd:element name=""Name1"" type=""String40"" />
      <xsd:element name=""Name2"" type=""String40"" />
      <xsd:element name=""Street"" type=""String40"" />
      <xsd:element name=""Address2"" type=""String40"" />
      <xsd:element name=""PostCode"" type=""String15"" />
      <xsd:element name=""City"" type=""String40"" />
      <xsd:element name=""CountryCode"" type=""CountryCodeType"" />
      <xsd:element minOccurs=""0"" name=""LanguageCode"" type=""LanguageCodeType"" />
      <xsd:element name=""Email"" type=""EmailType"" />
      <xsd:element minOccurs=""0"" name=""Phone"" type=""String20"" />
      <xsd:element minOccurs=""0"" name=""Fax"" type=""String20"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""CommentType"">
    <xsd:sequence>
      <xsd:element name=""Text"" type=""String80"" />
    </xsd:sequence>
    <xsd:attribute name=""no"" type=""xsd:int"" />
  </xsd:complexType>
  <xsd:complexType name=""ColliType"">
    <xsd:sequence>
      <xsd:element name=""OrderNumber"" type=""OrderNoType"" />
      <xsd:element minOccurs=""0"" name=""ShippingNo"" type=""ShippingNoType"" />
      <xsd:element name=""ShippmentNo"" type=""xsd:int"" />
      <xsd:element name=""PacketNo"" type=""xsd:int"" />
      <xsd:element name=""PacketWeight"" type=""AmountType"" />
      <xsd:element name=""PacketID"" type=""String25"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""BackLogLineType"">
    <xsd:sequence>
      <xsd:element name=""ItemNo"" type=""ItemNoType"" />
      <xsd:element name=""ItemVariantCode"" type=""ItemVariantCodeType"" />
      <xsd:element name=""Quantity"" type=""QuantityType"" />
    </xsd:sequence>
    <xsd:attribute name=""no"" type=""xsd:int"" />
  </xsd:complexType>
  <xsd:complexType name=""SalesOrderLineType"">
    <xsd:sequence>
      <xsd:element minOccurs=""0"" name=""ShippingNo"" type=""ShippingNoType"" />
      <xsd:element name=""ItemNo"" type=""ItemNoType"" />
      <xsd:element name=""ItemVariantCode"" type=""ItemVariantCodeType"" />
      <xsd:element name=""ItemCondition"" type=""ItemConditionType"" />
      <xsd:element name=""InventoryEffective"" type=""xsd:boolean"" />
      <xsd:element name=""QuantityOrdered"" type=""QuantityType"" />
      <xsd:element name=""QuantityShipped"" type=""QuantityType"" />
      <xsd:element name=""SalesPrice"" type=""SalesAmountType"" />
      <xsd:element name=""DiscountPercent"" type=""PercentageType"" />
      <xsd:element name=""DiscountAmount"" type=""AmountType"" />
      <xsd:element name=""LineAmount"" type=""AmountType"" />
      <xsd:element minOccurs=""0"" name=""Comments"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element minOccurs=""0"" maxOccurs=""unbounded"" name=""Comment"" type=""CommentType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name=""no"" type=""xsd:int"" />
  </xsd:complexType>
  <xsd:complexType name=""SalesOrderLineType2"">
    <xsd:sequence>
      <xsd:element name=""LineDeliveryNote"" type=""xsd:int"" />
      <xsd:element name=""LineOrderNumber"" type=""OrderNoType"" />
      <xsd:element name=""LineNo"" type=""xsd:int"" />
      <xsd:element name=""ItemNo"" type=""ItemNoType"" />
      <xsd:element name=""InventoryEffective"" type=""xsd:boolean"" />
      <xsd:element name=""QuantityOrdered"" type=""QuantityType"" />
      <xsd:element name=""QuantityShipped"" type=""QuantityType"" />
      <xsd:element name=""unit"" type=""UnitOfMeasureType"" />
      <xsd:element minOccurs=""0"" name=""MHD"" type=""xsd:boolean"" />
      <xsd:element minOccurs=""0"" name=""BIN"" type=""String30"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""VATType"">
    <xsd:sequence>
      <xsd:element name=""VATPercent"" type=""PercentageType"" />
      <xsd:element name=""VATAmount"" type=""AmountType"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""FulfillSalesOrderRequestType"">
    <xsd:sequence>
      <xsd:element name=""OrderDate"" nillable=""true"" type=""xsd:date"" />
      <xsd:element name=""CurrencyCode"" type=""CurrencyCodeType"" />
      <xsd:element name=""Reference"" type=""String20"" />
      <xsd:element name=""ExternalDocNo"" type=""String20"" />
      <xsd:element name=""PaymentMethod"" type=""String10"" />
      <xsd:element name=""OrderType"" type=""String2"" />
      <xsd:element name=""PrintInvoice"" type=""xsd:boolean"" />
      <xsd:element name=""PricesIncludingVAT"" type=""xsd:boolean"" />
      <xsd:element minOccurs=""0"" name=""AmountIncludingVAT"" type=""AmountType"" />
      <xsd:element minOccurs=""0"" name=""AmountWithoutVAT"" type=""AmountType"" />
      <xsd:element name=""VAT"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element minOccurs=""0"" maxOccurs=""unbounded"" name=""VATType"" type=""VATType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
      <xsd:element name=""Shipping"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element name=""ShippingNo"" type=""ShippingNoType"" />
            <xsd:element name=""CustomerNo"" type=""CustomerNoType"" />
            <xsd:element name=""Method"" type=""String4"" />
            <xsd:element name=""Condition"" type=""String40"" />
            <xsd:element name=""Instruction"" type=""String2"" />
            <xsd:element name=""ShippingDate"" nillable=""true"" type=""xsd:date"" />
            <xsd:element name=""Address"" type=""AddressType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
      <xsd:element name=""Invoicing"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element name=""CustomerNo"" type=""CustomerNoType"" />
            <xsd:element name=""Condition"" type=""String50"" />
            <xsd:element name=""Address"" type=""AddressType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
      <xsd:element minOccurs=""0"" name=""Comments"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element minOccurs=""0"" maxOccurs=""unbounded"" name=""Comment"" type=""CommentType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
      <xsd:element name=""Lines"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element maxOccurs=""unbounded"" name=""Line"" type=""SalesOrderLineType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
      <xsd:element name=""BackLogLines"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element maxOccurs=""unbounded"" name=""Line"" type=""BackLogLineType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name=""no"" type=""OrderNoType"" />
  </xsd:complexType>
  <xsd:complexType name=""FulfillOrderRequestType"">
    <xsd:sequence>
      <xsd:element minOccurs=""1"" maxOccurs=""unbounded"" name=""SalesOrder"" type=""FulfillSalesOrderRequestType"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""FulfillSalesOrderResponseType"">
    <xsd:sequence>
      <xsd:element name=""Head"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element name=""HeadOrderNumber"" type=""OrderNoType"" />
            <xsd:element name=""CustomerNoInvoice"" type=""CustomerNoType"" />
            <xsd:element name=""Group7Reference"" type=""String9"" />
            <xsd:element name=""Method"" type=""String4"" />
            <xsd:element name=""CurrencyCode"" type=""CurrencyCodeType"" />
            <xsd:element name=""ShippingDate"" nillable=""true"" type=""xsd:date"" />
            <xsd:element name=""DeliveryDate"" nillable=""true"" type=""xsd:date"" />
            <xsd:element name=""TotalItems"" type=""xsd:int"" />
            <xsd:element name=""TotalColli"" type=""xsd:int"" />
            <xsd:element name=""TotalWeight"" type=""xsd:float"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
      <xsd:element name=""Lines"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element maxOccurs=""unbounded"" name=""Line"" type=""SalesOrderLineType2"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
      <xsd:element minOccurs=""0"" name=""Collis"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element minOccurs=""0"" maxOccurs=""unbounded"" name=""Colli"" type=""ColliType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""FulfillOrderResponseType"">
    <xsd:sequence>
      <xsd:element minOccurs=""1"" maxOccurs=""unbounded"" name=""SalesOrder"" type=""FulfillSalesOrderResponseType"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""PurchaseOrderLineType"">
    <xsd:sequence>
      <xsd:element name=""ItemNo"" type=""ItemNoType"" />
      <xsd:element name=""ItemVariantCode"" type=""ItemVariantCodeType"" />
      <xsd:element name=""VendorItemNo"" type=""xsd:string"" />
      <xsd:element name=""ItemCategory"" type=""ItemConditionType"" />
      <xsd:element name=""ItemDescription"" type=""String50"" />
      <xsd:element name=""ItemCondition"" type=""ItemConditionType"" />
      <xsd:element minOccurs=""0"" name=""VatPercent"" type=""PercentageType"" />
      <xsd:element name=""QuantityOrdered"" type=""QuantityType"" />
      <xsd:element name=""QuantityShipped"" type=""QuantityType"" />
      <xsd:element name=""QuantityPerUnit"" type=""QuantityType"" />
      <xsd:element minOccurs=""0"" name=""Comments"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element minOccurs=""0"" maxOccurs=""unbounded"" name=""Comment"" type=""CommentType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name=""no"" type=""xsd:int"" />
  </xsd:complexType>
  <xsd:complexType name=""PurchaseOrderLineType2"">
    <xsd:sequence>
      <xsd:element name=""LineNo"" type=""xsd:int"" />
      <xsd:element name=""ItemNo"" type=""ItemNoType"" />
      <xsd:element name=""Unit"" type=""UnitOfMeasureType"" />
      <xsd:element name=""QuantityOrdered"" type=""QuantityType"" />
      <xsd:element name=""QuantityShipped"" type=""QuantityType"" />
      <xsd:element name=""OpenQuantity"" type=""QuantityType"" />
      <xsd:element minOccurs=""0"" name=""MHD"" type=""xsd:boolean"" />
      <xsd:element minOccurs=""0"" name=""BIN"" type=""String30"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""FulfillPurchaseOrderRequestType"">
    <xsd:sequence>
      <xsd:element name=""OrderDate"" nillable=""true"" type=""xsd:date"" />
      <xsd:element name=""Shipping"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element name=""VendorNo"" type=""String15"" />
            <xsd:element name=""ShippingDate"" nillable=""true"" type=""xsd:date"" />
            <xsd:element name=""Address"" type=""AddressType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
      <xsd:element minOccurs=""0"" name=""Comments"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element minOccurs=""0"" maxOccurs=""unbounded"" name=""Comment"" type=""CommentType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
      <xsd:element name=""Lines"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element maxOccurs=""unbounded"" name=""Line"" type=""PurchaseOrderLineType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name=""no"" type=""OrderNoType"" />
  </xsd:complexType>
  <xsd:complexType name=""FulfillAvisRequestType"">
    <xsd:sequence>
      <xsd:element minOccurs=""1"" maxOccurs=""unbounded"" name=""PurchaseOrder"" type=""FulfillPurchaseOrderRequestType"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""FulfillPurchaseOrderResponseType"">
    <xsd:sequence>
      <xsd:element name=""Head"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element name=""no_attr"" type=""OrderNoType"" />
            <xsd:element name=""OrderNo2"" type=""OrderNoType"" />
            <xsd:element name=""Group7Reference"" type=""String9"" />
            <xsd:element name=""OrderDate"" nillable=""true"" type=""xsd:date"" />
            <xsd:element name=""ArrivalDate"" nillable=""true"" type=""xsd:date"" />
            <xsd:element name=""Shipping"">
              <xsd:complexType>
                <xsd:sequence>
                  <xsd:element name=""VendorNo"" type=""String15"" />
                </xsd:sequence>
              </xsd:complexType>
            </xsd:element>
            <xsd:element minOccurs=""0"" name=""Comments"">
              <xsd:complexType>
                <xsd:sequence>
                  <xsd:element minOccurs=""0"" maxOccurs=""unbounded"" name=""Comment"" type=""CommentType"" />
                </xsd:sequence>
              </xsd:complexType>
            </xsd:element>
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
      <xsd:element name=""Lines"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element maxOccurs=""unbounded"" name=""Line"" type=""PurchaseOrderLineType2"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""FulfillAvisResponseType"">
    <xsd:sequence>
      <xsd:element minOccurs=""1"" maxOccurs=""unbounded"" name=""PurchaseOrder"" type=""FulfillPurchaseOrderResponseType"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""ItemType"">
    <xsd:sequence>
      <xsd:element name=""ItemCategory"" type=""ItemConditionType"" />
      <xsd:element name=""ItemDescription"" type=""String50"" />
      <xsd:element name=""ItemDescription2"" type=""String50"" />
      <xsd:element name=""ItemCondition"" type=""ItemConditionType"" />
      <xsd:element name=""BaseUnit"" type=""UnitOfMeasureType"" />
      <xsd:element name=""QuantityPerUnit"" type=""QuantityType"" />
      <xsd:element name=""Blocked"" type=""xsd:boolean"" />
      <xsd:element name=""VatCode"" type=""String10"" />
      <xsd:element name=""MHD"" type=""xsd:boolean"" />
      <xsd:element name=""VendorUnit"" type=""UnitOfMeasureType"" />
      <xsd:element name=""VendorItemNo"" type=""String20"" />
      <xsd:element name=""VendorNo"" type=""String15"" />
      <xsd:element name=""Brand"" type=""String30"" />
      <xsd:element name=""LocationArea"" type=""String10"" />
      <xsd:element name=""ReplenishmentLimit"" type=""xsd:float"" />
      <xsd:element name=""UnitPrice"" type=""UnitPriceType"" />
      <xsd:element name=""Variant"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element minOccurs=""0"" maxOccurs=""unbounded"" name=""ItemVariantCode"" type=""ItemVariantCodeType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name=""no"" type=""ItemNoType"" />
  </xsd:complexType>
  <xsd:complexType name=""UnitPriceType"">
    <xsd:simpleContent>
      <xsd:extension base=""xsd:float"">
        <xsd:attribute name=""IncludedVAT"" type=""xsd:boolean"" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name=""ItemListType"">
    <xsd:sequence>
      <xsd:element minOccurs=""1"" maxOccurs=""unbounded"" name=""Item"" type=""ItemType"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""ReturnOrderLineType"">
    <xsd:sequence>
      <xsd:element name=""LineNo"" type=""xsd:int"" />
      <xsd:element name=""ItemNo"" type=""ItemNoType"" />
      <xsd:element name=""ReturnReason"" type=""String10"" />
      <xsd:element name=""QuantityOrdered"" type=""QuantityType"" />
      <xsd:element name=""QuantityShipped"" type=""QuantityType"" />
      <xsd:element name=""QuantityReturned"" type=""QuantityType"" />
      <xsd:element name=""LockLocation"" type=""xsd:boolean"" />
      <xsd:element minOccurs=""0"" name=""MHD"" type=""xsd:boolean"" />
      <xsd:element minOccurs=""0"" name=""BIN"" type=""String30"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""ReturnOrderType"">
    <xsd:sequence>
      <xsd:element name=""Head"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element name=""ReturnOrderNo"" type=""OrderNoType"" />
            <xsd:element name=""OrderNo"" type=""OrderNoType"" />
            <xsd:element name=""Group7Reference"" type=""String9"" />
            <xsd:element name=""CustomerNo"" type=""CustomerNoType"" />
            <xsd:element name=""CustomerNoInvoicing"" type=""CustomerNoType"" />
            <xsd:element name=""ShippingDate"" nillable=""true"" type=""xsd:date"" />
            <xsd:element name=""ReturnDate"" nillable=""true"" type=""xsd:date"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
      <xsd:element name=""Lines"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element maxOccurs=""unbounded"" name=""Line"" type=""ReturnOrderLineType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""SalesOrderReturnType"">
    <xsd:sequence>
      <xsd:element minOccurs=""1"" maxOccurs=""unbounded"" name=""ReturnOrder"" type=""ReturnOrderType"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""FulfillAvisCancellationType"">
    <xsd:sequence>
      <xsd:element minOccurs=""1"" maxOccurs=""unbounded"" name=""PurchaseOrder"" type=""PurchaseOrderCancellationType"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""PurchaseOrderCancellationType"">
    <xsd:sequence>
      <xsd:element name=""OrderDate"" nillable=""true"" type=""xsd:date"" />
    </xsd:sequence>
    <xsd:attribute name=""no"" type=""OrderNoType"" />
  </xsd:complexType>
  <xsd:complexType name=""FulfillOrderCancellationType"">
    <xsd:sequence>
      <xsd:element minOccurs=""1"" maxOccurs=""unbounded"" name=""SalesOrder"" type=""SalesOrderCancellationType"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""SalesOrderCancellationType"">
    <xsd:sequence>
      <xsd:element name=""OrderNo"" type=""OrderNoType"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""InventoryCheckType"">
    <xsd:sequence>
      <xsd:element name=""Lines"">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element maxOccurs=""unbounded"" name=""Line"" type=""InventoryCheckLineType"" />
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
    </xsd:sequence>
  </xsd:complexType>
  <xsd:complexType name=""InventoryCheckLineType"">
    <xsd:sequence>
      <xsd:element name=""ItemNo"" type=""ItemNoType"" />
      <xsd:element name=""Quantity"" type=""QuantityType"" />
    </xsd:sequence>
  </xsd:complexType>
  <xsd:element name=""Transfer"">
    <xsd:complexType>
      <xsd:choice>
        <xsd:element name=""FulfillOrderRequest"" type=""FulfillOrderRequestType"" />
        <xsd:element name=""FulfillOrderResponse"" type=""FulfillOrderResponseType"" />
        <xsd:element name=""FulfillAvisRequest"" type=""FulfillAvisRequestType"" />
        <xsd:element name=""FulfillAvisResponse"" type=""FulfillAvisResponseType"" />
        <xsd:element name=""ItemList"" type=""ItemListType"" />
        <xsd:element name=""SalesOrderReturn"" type=""SalesOrderReturnType"" />
        <xsd:element name=""FulfillAvisCancellation"" type=""FulfillAvisCancellationType"" />
        <xsd:element name=""FulfillOrderCancellation"" type=""FulfillOrderCancellationType"" />
        <xsd:element name=""InventoryCheck"" type=""InventoryCheckType"" />
      </xsd:choice>
    </xsd:complexType>
  </xsd:element>
</xsd:schema>";
        
        public NAVconnect_Fulfillment() {
        }
        
        public override string XmlContent {
            get {
                return _strSchema;
            }
        }
        
        public override string[] RootNodes {
            get {
                string[] _RootElements = new string [1];
                _RootElements[0] = "Transfer";
                return _RootElements;
            }
        }
        
        protected override object RawSchema {
            get {
                return _rawSchema;
            }
            set {
                _rawSchema = value;
            }
        }
    }
}
