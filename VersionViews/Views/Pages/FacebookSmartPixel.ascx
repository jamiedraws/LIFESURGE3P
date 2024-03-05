<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Dtm.Framework.Models.Ecommerce.Repositories" %>
<%
    var pageCode = ViewData["pageCode"].ToString();
    var controlId = ViewData["ControlId"].ToString();
    var jsCustomScript = ViewData["CUSTOMSCRIPT"] != null ? ViewData["CUSTOMSCRIPT"].ToString() : string.Empty;
    var facebookId = ViewData["FacebookId"].ToString();
    var siteMode = (ViewData["MODE"] ?? "").ToString().ToUpper();
    bool convertOnlyOnConfirmation = bool.TryParse((ViewData["CONVERTONLYONCONFIRMATION"] ?? "").ToString(), out convertOnlyOnConfirmation) && convertOnlyOnConfirmation;
    bool enableAssistedPurchase = bool.TryParse((ViewData["ENABLEASSISTEDPURCHASE"] ?? "").ToString(), out enableAssistedPurchase) && enableAssistedPurchase;
    bool passOrderItemDetails = bool.TryParse((ViewData["PASSORDERITEMDETAILS"] ?? "").ToString(), out passOrderItemDetails) && passOrderItemDetails;
    bool passUTMParameters = bool.TryParse((ViewData["PASSUTMPARAMS"] ?? "").ToString(), out passUTMParameters) && passUTMParameters;
    var completeStatuses = new[] { 2, 3, 11, 12 };

    var conversionPages = (ViewData["ConversionPages"] ?? "").ToString().ToLower();
    var pagesArray = conversionPages.Split(',');
    bool isOnConfirmationPage = (pageCode.ToLower().Contains("confirmation") || pageCode.ToLower().Contains("ordersummary") || DtmContext.Page.PageTypeId == 23);  //PageTypeId 23: Review
    for (int i = 0; i < pagesArray.Count(); i++)
    {
        isOnConfirmationPage = isOnConfirmationPage || pageCode.ToLower().Equals(pagesArray[i].Trim(), StringComparison.InvariantCultureIgnoreCase);
    }

    var pageControlKey = controlId;
    bool refireAllowedSale = bool.TryParse(ViewData["refireAllowed"] as string ?? "false", out refireAllowedSale) && refireAllowedSale;
    bool fireOnUpsell = bool.TryParse(ViewData["fireOnUpsell"] as string ?? "true", out fireOnUpsell) && fireOnUpsell;
    var vendorCode = DtmContext.Traffic != null && !string.IsNullOrEmpty(DtmContext.Traffic.VendorCode) ? DtmContext.Traffic.VendorCode : string.Empty;

    bool isFB = vendorCode.Equals("Facebook");

    var hasFiredSale = DtmContext.FiredConversionCodes.Any(p => p.Equals(pageControlKey, StringComparison.InvariantCultureIgnoreCase));

    var firePixelSale = DtmContext.PageCode == "FacebookConversion";
    var contentsString = string.Empty;
    var utmString = string.Empty;

    if (firePixelSale)
    {
        string conversionLabel = "FacebookConversion" + facebookId;
        var vsRepo = new VisitorSessionRepository();
        var conversionValue = vsRepo.GetVisitorSessionData(DtmContext.VisitorSessionId, conversionLabel);
        const string coversionExpectedValue = "1";
        var hasAlreadyConverted = conversionValue == coversionExpectedValue;
        if (hasAlreadyConverted)
        {
            firePixelSale = false;
        }
        else
        {
            vsRepo.SaveVisitorSessionData(DtmContext.VisitorSessionId, conversionLabel, coversionExpectedValue);
        }

        if (passOrderItemDetails)
        {
            contentsString = string.Format(", contents: [{0}], content_type: 'product'",
                string.Join(", ", DtmContext.Order.OrderItems
                    .Select(x =>
                        string.Format("{{ id: '{0}', quantity: {1}, item_price: {2:0.00} }}",
                        x.ProductSku,
                        x.Quantity,
                        x.Price))));
        }

        if (passUTMParameters)
        {
            try
            {
                dynamic vsData = vsRepo.Get(DtmContext.VisitorSessionId);
                utmString = string.Format(", utm_source: '{0}', utm_medium: '{1}', utm_campaign:'{2}', utm_term: '{3}', utm_content: '{4}'",
                    vsData.UTM_Source,
                    vsData.UTM_Medium,
                    vsData.UTM_Campaign,
                    vsData.UTM_Term,
                    vsData.UTM_Content);
            }
            catch { }
        }
    }

    var pageId = string.Empty;
    if(DtmContext.Page != null)
    {
        pageId = DtmContext.Page.PageId.ToString();
    }

    bool visitorSessionLoaded = DtmContext.VisitorSessionId != Guid.Empty;

%>
<!-- Begin Impression -->
<script>
    !function (f, b, e, v, n, t, s) {
        if (f.fbq) return; n = f.fbq = function () {
            n.callMethod ?
                n.callMethod.apply(n, arguments) : n.queue.push(arguments)
        };
        if (!f._fbq) f._fbq = n; n.push = n; n.loaded = !0; n.version = '2.0';
        n.queue = []; t = b.createElement(e); t.async = !0;
        t.src = v; s = b.getElementsByTagName(e)[0];
        s.parentNode.insertBefore(t, s)
    }(window, document, 'script',
        'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '<%= facebookId %>');
    fbq('trackSingle', '<%= facebookId %>', 'PageView');
    fbq('trackSingle', '<%= facebookId %>', 'ViewContent');
</script>
<noscript>
    <img height="1" width="1" style="display: none"
        src="https://www.facebook.com/tr?id=<%= facebookId %>&ev=PageView&noscript=1" />
</noscript>
<!-- End Impression -->
<% 
    if (firePixelSale)
    { %>
<!-- Begin Conversion -->
<script>
	var handleFBPurchase = function() { 
	<% if (isFB || (!enableAssistedPurchase)) {
        if (!passUTMParameters)
        {%>
        fbq('trackSingle', '<%= facebookId %>', 'Purchase', {
            value: <%=DtmContext.Order.OrderTotal.ToString("0.00")%>,
            currency: '<%=DtmContext.OfferVersion.CurrencyCode %>'<%= contentsString%>
        }, { eventID: '<%=DtmContext.OrderId%>' });
    <% }
    else
    { %>
        fbq('trackSingleCustom', '<%= facebookId %>', 'Purchase', {
            value: <%=DtmContext.Order.OrderTotal.ToString("0.00")%>,
            currency: '<%=DtmContext.OfferVersion.CurrencyCode %>'<%= contentsString %><%= utmString %>
        }, { eventID: '<%=DtmContext.OrderId%>' });
    <% }
    }%>
	<% else {%>
	fbq('trackSingleCustom', '<%= facebookId %>', 'AssistedPurchase', {
        value: <%=DtmContext.Order.OrderTotal.ToString("0.00")%>,
        currency: '<%=DtmContext.OfferVersion.CurrencyCode %>'<%= contentsString%><%= utmString%>
    }, { eventID: '<%=DtmContext.OrderId%>' });
	<% }%>
	}
	
	handleFBPurchase();
</script>
<!-- End Conversion -->
<%}%>

<%if (DtmContext.Page.IsStartPageType)
    { %>
<script>
    var __hasFiredAddPaymentInfo = false;
    var __hasFiredAddToCart = false;
	var __checkoutInitialized = false;

    var handleFBAddToCart = function () {
        __hasFiredAddToCart = true;
        fbq('trackSingle', '<%= facebookId %>', 'AddToCart');
    }

    var handleFBInitiateCheckout = function () {
        __checkoutInitialized = true;
        fbq('trackSingle', '<%= facebookId %>', 'InitiateCheckout');
    }

    var handleFBAddPaymentInfo = function () {
        var isValid = true;
        $('#CardNumber, #CardExpirationMonth, #CardExpirationYear, #CardCvv2')
            .each(function () {
                if ($(this).val() == '') {
                    isValid = false;
                }
            });
        if (isValid && !__hasFiredAddPaymentInfo) {
            __hasFiredAddPaymentInfo = true;
            fbq('trackSingle', '<%= facebookId %>', 'AddPaymentInfo');
        }
    }
    
    if (window.Receiver) {
        var fbReceiver = window.Receiver("Facebook");
        fbReceiver.onPaymentInfoChange = handleFBAddPaymentInfo;
        fbReceiver.onZipChange = function() {
            if ($('#BillingZip').val() != '' && !__hasFiredAddToCart) {
                handleFBAddToCart();
            }
            handleFBInitiateCheckout();
        };
    }
    //ShoppingCart
    else {
        $('#CardNumber, #CardExpirationMonth, #CardExpirationYear, #CardCvv2').one('keyup input change', handleFBAddPaymentInfo);

        <%

    switch (siteMode)
    {
        case "SHOPPINGCART":

            if (pageCode.ToLower() == "shoppingcart")
            {%>

                handleFBInitiateCheckout();
            <%}%>

                $(document).one('click', '[data-code]', function () {
                    if (!__hasFiredAddToCart) {
                        handleFBAddToCart();
                    }
                });

            <%       
            break;

        case "MICROSITE":
            %>
            $('#BillingZip').one('keyup input', function () {
                if ($('#BillingZip').val() != '' && !__hasFiredAddToCart) {
                    handleFBAddToCart();
                }
                handleFBInitiateCheckout();
            });
            <%

            break;

        case "CUSTOM":
            %>

        <%=jsCustomScript%>
		
        <%
        break;

        default:
            break;
    }%>

 }
</script>
<%} %>