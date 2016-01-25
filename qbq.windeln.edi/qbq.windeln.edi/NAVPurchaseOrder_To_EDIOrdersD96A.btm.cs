namespace qbq.windeln.edi {
    
    
    [Microsoft.XLANGs.BaseTypes.SchemaReference(@"qbq.windeln.edi.NAVconnect_Fulfillment", typeof(global::qbq.windeln.edi.NAVconnect_Fulfillment))]
    [Microsoft.XLANGs.BaseTypes.SchemaReference(@"qbq.windeln.edi.EFACT_D96A_ORDERS", typeof(global::qbq.windeln.edi.EFACT_D96A_ORDERS))]
    public sealed class NAVPurchaseOrder_To_EDIOrdersD96A : global::Microsoft.XLANGs.BaseTypes.TransformBase {
        
        private const string _strMap = @"<?xml version=""1.0"" encoding=""UTF-16""?>
<xsl:stylesheet xmlns:xsl=""http://www.w3.org/1999/XSL/Transform"" xmlns:msxsl=""urn:schemas-microsoft-com:xslt"" xmlns:var=""http://schemas.microsoft.com/BizTalk/2003/var"" exclude-result-prefixes=""msxsl var s0 userCSharp"" version=""1.0"" xmlns:s0=""http://schema.mp-gruppe.de/NAVconnect/Fulfillment"" xmlns:ns0=""http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006"" xmlns:userCSharp=""http://schemas.microsoft.com/BizTalk/2003/userCSharp"">
  <xsl:output omit-xml-declaration=""yes"" method=""xml"" version=""1.0"" />
  <xsl:template match=""/"">
    <xsl:apply-templates select=""/s0:Transfer"" />
  </xsl:template>
  <xsl:template match=""/s0:Transfer"">
    <xsl:variable name=""var:v1"" select=""userCSharp:StringConcat(&quot;1&quot;)"" />
    <xsl:variable name=""var:v2"" select=""userCSharp:StringConcat(&quot;ORDERS&quot;)"" />
    <xsl:variable name=""var:v3"" select=""userCSharp:StringConcat(&quot;D&quot;)"" />
    <xsl:variable name=""var:v4"" select=""userCSharp:StringConcat(&quot;96A&quot;)"" />
    <xsl:variable name=""var:v5"" select=""userCSharp:StringConcat(&quot;UN&quot;)"" />
    <xsl:variable name=""var:v6"" select=""userCSharp:StringConcat(&quot;EAN008&quot;)"" />
    <xsl:variable name=""var:v52"" select=""userCSharp:StringConcat(&quot;S&quot;)"" />
    <xsl:variable name=""var:v53"" select=""userCSharp:StringConcat(&quot;2&quot;)"" />
    <xsl:variable name=""var:v54"" select=""count(/s0:Transfer/s0:FulfillAvisRequest/s0:PurchaseOrder/s0:Lines/s0:Line)"" />
    <ns0:EFACT_D96A_ORDERS>
      <UNH>
        <UNH1>
          <xsl:value-of select=""$var:v1"" />
        </UNH1>
        <UNH2>
          <UNH2.1>
            <xsl:value-of select=""$var:v2"" />
          </UNH2.1>
          <UNH2.2>
            <xsl:value-of select=""$var:v3"" />
          </UNH2.2>
          <UNH2.3>
            <xsl:value-of select=""$var:v4"" />
          </UNH2.3>
          <UNH2.4>
            <xsl:value-of select=""$var:v5"" />
          </UNH2.4>
          <UNH2.5>
            <xsl:value-of select=""$var:v6"" />
          </UNH2.5>
        </UNH2>
      </UNH>
      <xsl:for-each select=""s0:FulfillAvisRequest/s0:PurchaseOrder"">
        <xsl:variable name=""var:v7"" select=""userCSharp:LogicalIsString(string(@no))"" />
        <xsl:variable name=""var:v9"" select=""string(@no)"" />
        <xsl:variable name=""var:v10"" select=""userCSharp:LogicalIsString($var:v9)"" />
        <ns0:BGM>
          <ns0:C002>
            <xsl:if test=""string($var:v7)='true'"">
              <xsl:variable name=""var:v8"" select=""&quot;220&quot;"" />
              <C00201>
                <xsl:value-of select=""$var:v8"" />
              </C00201>
            </xsl:if>
          </ns0:C002>
          <xsl:if test=""string($var:v10)='true'"">
            <xsl:variable name=""var:v11"" select=""@no"" />
            <BGM02>
              <xsl:value-of select=""$var:v11"" />
            </BGM02>
          </xsl:if>
          <xsl:if test=""string($var:v10)='true'"">
            <xsl:variable name=""var:v12"" select=""&quot;9&quot;"" />
            <BGM03>
              <xsl:value-of select=""$var:v12"" />
            </BGM03>
          </xsl:if>
        </ns0:BGM>
      </xsl:for-each>
      <xsl:for-each select=""s0:FulfillAvisRequest/s0:PurchaseOrder"">
        <xsl:variable name=""var:v13"" select=""userCSharp:LogicalIsString(string(s0:OrderDate/text()))"" />
        <xsl:variable name=""var:v15"" select=""string(s0:OrderDate/text())"" />
        <xsl:variable name=""var:v16"" select=""userCSharp:LogicalIsString($var:v15)"" />
        <ns0:DTM>
          <ns0:C507>
            <xsl:if test=""string($var:v13)='true'"">
              <xsl:variable name=""var:v14"" select=""&quot;137&quot;"" />
              <C50701>
                <xsl:value-of select=""$var:v14"" />
              </C50701>
            </xsl:if>
            <xsl:if test=""string($var:v16)='true'"">
              <xsl:variable name=""var:v17"" select=""userCSharp:DateTimeConvert($var:v15 , &quot;yyyyMMdd&quot; , &quot;yyyy-MM-dd&quot;)"" />
              <C50702>
                <xsl:value-of select=""$var:v17"" />
              </C50702>
            </xsl:if>
            <xsl:if test=""string($var:v16)='true'"">
              <xsl:variable name=""var:v18"" select=""&quot;102&quot;"" />
              <C50703>
                <xsl:value-of select=""$var:v18"" />
              </C50703>
            </xsl:if>
          </ns0:C507>
        </ns0:DTM>
      </xsl:for-each>
      <xsl:for-each select=""s0:FulfillAvisRequest/s0:PurchaseOrder"">
        <xsl:variable name=""var:v19"" select=""userCSharp:LogicalIsString(string(s0:Shipping/s0:ShippingDate/text()))"" />
        <xsl:variable name=""var:v21"" select=""string(s0:Shipping/s0:ShippingDate/text())"" />
        <xsl:variable name=""var:v22"" select=""userCSharp:LogicalIsString($var:v21)"" />
        <ns0:DTM>
          <ns0:C507>
            <xsl:if test=""string($var:v19)='true'"">
              <xsl:variable name=""var:v20"" select=""&quot;2&quot;"" />
              <C50701>
                <xsl:value-of select=""$var:v20"" />
              </C50701>
            </xsl:if>
            <xsl:if test=""string($var:v22)='true'"">
              <xsl:variable name=""var:v23"" select=""userCSharp:DateTimeConvert($var:v21 , &quot;yyyyMMdd&quot; , &quot;yyyy-MM-dd&quot;)"" />
              <C50702>
                <xsl:value-of select=""$var:v23"" />
              </C50702>
            </xsl:if>
            <xsl:if test=""string($var:v22)='true'"">
              <xsl:variable name=""var:v24"" select=""&quot;102&quot;"" />
              <C50703>
                <xsl:value-of select=""$var:v24"" />
              </C50703>
            </xsl:if>
          </ns0:C507>
        </ns0:DTM>
      </xsl:for-each>
      <xsl:for-each select=""s0:FulfillAvisRequest/s0:PurchaseOrder"">
        <xsl:for-each select=""s0:Lines/s0:Line"">
          <xsl:variable name=""var:v25"" select=""userCSharp:LogicalIsString(string(s0:ItemNo/text()))"" />
          <xsl:variable name=""var:v26"" select=""string(s0:ItemNo/text())"" />
          <xsl:variable name=""var:v27"" select=""userCSharp:StringSize($var:v26)"" />
          <xsl:variable name=""var:v28"" select=""userCSharp:LogicalEq(string($var:v27) , &quot;13&quot;)"" />
          <xsl:variable name=""var:v29"" select=""userCSharp:LogicalEq(string($var:v27) , &quot;12&quot;)"" />
          <xsl:variable name=""var:v30"" select=""userCSharp:LogicalOr(string($var:v28) , string($var:v29))"" />
          <xsl:variable name=""var:v31"" select=""userCSharp:LogicalAnd(string($var:v25) , string($var:v30))"" />
          <xsl:variable name=""var:v36"" select=""userCSharp:LogicalIsString(string(s0:VendorItemNo/text()))"" />
          <xsl:variable name=""var:v38"" select=""string(s0:VendorItemNo/text())"" />
          <xsl:variable name=""var:v39"" select=""userCSharp:LogicalIsString($var:v38)"" />
          <xsl:variable name=""var:v42"" select=""userCSharp:LogicalIsString(string(s0:QuantityOrdered/text()))"" />
          <xsl:variable name=""var:v44"" select=""string(s0:QuantityOrdered/text())"" />
          <xsl:variable name=""var:v45"" select=""userCSharp:LogicalIsString($var:v44)"" />
          <xsl:variable name=""var:v47"" select=""userCSharp:StringConcat(&quot;364&quot;)"" />
          <xsl:variable name=""var:v48"" select=""userCSharp:DateCurrentDate()"" />
          <xsl:variable name=""var:v49"" select=""userCSharp:DateAddDays(string($var:v48) , &quot;190&quot;)"" />
          <xsl:variable name=""var:v51"" select=""userCSharp:StringConcat(&quot;102&quot;)"" />
          <ns0:LINLoop1>
            <ns0:LIN>
              <xsl:if test=""@no"">
                <LIN01>
                  <xsl:value-of select=""@no"" />
                </LIN01>
              </xsl:if>
              <xsl:if test=""$var:v31"">
                <xsl:variable name=""var:v32"" select=""userCSharp:LogicalIsString($var:v26)"" />
                <ns0:C212>
                  <xsl:if test=""string($var:v32)='true'"">
                    <xsl:variable name=""var:v33"" select=""s0:ItemNo/text()"" />
                    <C21201>
                      <xsl:value-of select=""$var:v33"" />
                    </C21201>
                  </xsl:if>
                  <xsl:if test=""string($var:v28)='true'"">
                    <xsl:variable name=""var:v34"" select=""&quot;EN&quot;"" />
                    <C21202>
                      <xsl:value-of select=""$var:v34"" />
                    </C21202>
                  </xsl:if>
                  <xsl:if test=""string($var:v29)='true'"">
                    <xsl:variable name=""var:v35"" select=""&quot;UP&quot;"" />
                    <C21202>
                      <xsl:value-of select=""$var:v35"" />
                    </C21202>
                  </xsl:if>
                </ns0:C212>
              </xsl:if>
            </ns0:LIN>
            <ns0:PIA>
              <xsl:if test=""string($var:v36)='true'"">
                <xsl:variable name=""var:v37"" select=""&quot;1&quot;"" />
                <PIA01>
                  <xsl:value-of select=""$var:v37"" />
                </PIA01>
              </xsl:if>
              <ns0:C212_2>
                <xsl:if test=""string($var:v39)='true'"">
                  <xsl:variable name=""var:v40"" select=""s0:VendorItemNo/text()"" />
                  <C21201>
                    <xsl:value-of select=""$var:v40"" />
                  </C21201>
                </xsl:if>
                <xsl:if test=""string($var:v39)='true'"">
                  <xsl:variable name=""var:v41"" select=""&quot;SA&quot;"" />
                  <C21202>
                    <xsl:value-of select=""$var:v41"" />
                  </C21202>
                </xsl:if>
              </ns0:C212_2>
            </ns0:PIA>
            <ns0:QTY_3>
              <ns0:C186_3>
                <xsl:if test=""string($var:v42)='true'"">
                  <xsl:variable name=""var:v43"" select=""&quot;21&quot;"" />
                  <C18601>
                    <xsl:value-of select=""$var:v43"" />
                  </C18601>
                </xsl:if>
                <xsl:if test=""string($var:v45)='true'"">
                  <xsl:variable name=""var:v46"" select=""userCSharp:MathInt($var:v44)"" />
                  <C18602>
                    <xsl:value-of select=""$var:v46"" />
                  </C18602>
                </xsl:if>
              </ns0:C186_3>
            </ns0:QTY_3>
            <ns0:DTM_13>
              <ns0:C507_13>
                <C50701>
                  <xsl:value-of select=""$var:v47"" />
                </C50701>
                <xsl:variable name=""var:v50"" select=""userCSharp:DateTimeConvert(string($var:v49) , &quot;yyyyMMdd&quot; , &quot;yyyy-MM-dd&quot;)"" />
                <C50702>
                  <xsl:value-of select=""$var:v50"" />
                </C50702>
                <C50703>
                  <xsl:value-of select=""$var:v51"" />
                </C50703>
              </ns0:C507_13>
            </ns0:DTM_13>
          </ns0:LINLoop1>
        </xsl:for-each>
      </xsl:for-each>
      <ns0:UNS>
        <UNS01>
          <xsl:value-of select=""$var:v52"" />
        </UNS01>
      </ns0:UNS>
      <ns0:CNT>
        <ns0:C270>
          <C27001>
            <xsl:value-of select=""$var:v53"" />
          </C27001>
          <C27002>
            <xsl:value-of select=""$var:v54"" />
          </C27002>
        </ns0:C270>
      </ns0:CNT>
    </ns0:EFACT_D96A_ORDERS>
  </xsl:template>
  <msxsl:script language=""C#"" implements-prefix=""userCSharp""><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public bool LogicalIsString(string val)
{
	return (val != null && val !="""");
}


public string DateTimeConvert(string param1, string param2, string param3)
{
    if (param1 == null)
        return null;
    try {
    System.DateTime dt = System.DateTime.ParseExact(param1, new System.String[] { param3 }, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.AllowWhiteSpaces | System.Globalization.DateTimeStyles.AssumeLocal);
    return dt.ToString(param2, System.Globalization.CultureInfo.InvariantCulture);
    } catch {
        return System.String.Empty;
    }
}

public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
}


public bool LogicalEq(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 == d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) == 0;
	}
	return ret;
}


public bool LogicalAnd(string param0, string param1)
{
	return ValToBool(param0) && ValToBool(param1);
	return false;
}


public bool LogicalOr(string param0, string param1)
{
	return ValToBool(param0) || ValToBool(param1);
	return false;
}


public string MathInt(string val)
{
	string retval = """";
	double d = 0;
	if (IsNumeric(val, ref d))
	{
		try
		{
			int i = Convert.ToInt32(d, System.Globalization.CultureInfo.InvariantCulture);
			if (i > d)
			{
				i = i-1;
			}
			retval = i.ToString(System.Globalization.CultureInfo.InvariantCulture);
		}
		catch (Exception)
		{
		}
	}
	return retval;
}


public string DateCurrentDate()
{
	DateTime dt = DateTime.Now;
	return dt.ToString(""yyyy-MM-dd"", System.Globalization.CultureInfo.InvariantCulture);
}


public string DateAddDays(string date, string days)
{
	string retval = """";
	double db = 0;
	if (IsDate(date) && IsNumeric(days, ref db))
	{
		DateTime dt = DateTime.Parse(date);
		int d = (int) db;
		dt = dt.AddDays(d);
		retval = dt.ToString(""yyyy-MM-dd"", System.Globalization.CultureInfo.InvariantCulture);
	}
	return retval;
}


public bool IsNumeric(string val)
{
	if (val == null)
	{
		return false;
	}
	double d = 0;
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

public bool IsNumeric(string val, ref double d)
{
	if (val == null)
	{
		return false;
	}
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

public bool IsDate(string val)
{
	bool retval = true;
	try
	{
		DateTime dt = Convert.ToDateTime(val, System.Globalization.CultureInfo.InvariantCulture);
	}
	catch (Exception)
	{
		retval = false;
	}
	return retval;
}

public bool ValToBool(string val)
{
	if (val != null)
	{
		if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return true;
		}
		if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return false;
		}
		val = val.Trim();
		if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return true;
		}
		if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return false;
		}
		double d = 0;
		if (IsNumeric(val, ref d))
		{
			return (d > 0);
		}
	}
	return false;
}


]]></msxsl:script>
</xsl:stylesheet>";
        
        private const string _strArgList = @"<ExtensionObjects />";
        
        private const string _strSrcSchemasList0 = @"qbq.windeln.edi.NAVconnect_Fulfillment";
        
        private const global::qbq.windeln.edi.NAVconnect_Fulfillment _srcSchemaTypeReference0 = null;
        
        private const string _strTrgSchemasList0 = @"qbq.windeln.edi.EFACT_D96A_ORDERS";
        
        private const global::qbq.windeln.edi.EFACT_D96A_ORDERS _trgSchemaTypeReference0 = null;
        
        public override string XmlContent {
            get {
                return _strMap;
            }
        }
        
        public override string XsltArgumentListContent {
            get {
                return _strArgList;
            }
        }
        
        public override string[] SourceSchemas {
            get {
                string[] _SrcSchemas = new string [1];
                _SrcSchemas[0] = @"qbq.windeln.edi.NAVconnect_Fulfillment";
                return _SrcSchemas;
            }
        }
        
        public override string[] TargetSchemas {
            get {
                string[] _TrgSchemas = new string [1];
                _TrgSchemas[0] = @"qbq.windeln.edi.EFACT_D96A_ORDERS";
                return _TrgSchemas;
            }
        }
    }
}
