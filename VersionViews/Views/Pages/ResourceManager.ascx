<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    var v = 5;
    var url = "{0}?v={1}";

    var preload = ViewData["preload"] as bool? ?? false;
    var defer = ViewData["defer"] as bool? ?? false;
    var all = ViewData["all"] as bool? ?? true;

    var isIndex = DtmContext.PageCode == "Index";
    var isBenefits = DtmContext.PageCode == "Benefits";
    var isSpeakers = DtmContext.PageCode == "Speakers";
    var isFAQ = DtmContext.PageCode == "FAQ";

    // inform browser to preload all critical resources ahead of schedule
    if (preload || all)
    {
        var images = new List<string> {
            "/images/logo.png"
        };

        foreach (var image in images) {
            var resource = String.Format(url, image, v);
            %>
            <link rel="preload" href="<%= image %>" as="image">
            <%
        }

        // preload critical images
        if (isIndex)
        {
            %>
            <link rel="preload" href="/images/hero/landing-page-640w.jpg" as="image" imagesrcset="/images/hero/landing-page-640w.jpg 640w, /images/hero/landing-page.jpg 1500w" imagesizes="(max-width: 40rem) 40vw, 1500px">
            <%
        }

        // preload critical stylesheets
        var styles = new List<string>
        {
            "/css/default/shell.css"
        };

        if (isIndex)
        {
            styles.Add("/css/default/index.css");
        }

        if (isSpeakers) {
            styles.Add("/css/default/speakers.css");
        }

        if (isBenefits)
        {
            styles.Add("/css/default/benefits.css");
        }

        if (isFAQ)
        {
            styles.Add("/css/default/faq.css");
        }

        styles.Add("https://use.typekit.net/hcy0zto.css");

        foreach (var style in styles)
        {
            var resource = String.Format(url, style, v);
            %>
            <link rel="preload" href="<%= resource %>" as="style">
            <%
        }

        // preload critical fonts
        var fonts = new List<string>
        {
            // trade-gothic-next | 700
            "https://use.typekit.net/af/e7065f/00000000000000007735ba3f/30/l?primer=7cdcb44be4a7db8877ffa5c0007b8dd865b3bbc383831fe2ea177f62257a9191&fvd=n7&v=3",
            // trade-gothic-next-compressed | 700
            "https://use.typekit.net/af/370ed2/00000000000000007735ba41/30/l?primer=7cdcb44be4a7db8877ffa5c0007b8dd865b3bbc383831fe2ea177f62257a9191&fvd=n7&v=3",
            // karla regular
            "/fonts/Karla-Regular.woff2",
            // karla bold
            "/fonts/Karla-Bold.woff2",
            // karla extra-bold
            "/fonts/Karla-ExtraBold.woff2"
        };

        foreach (var font in fonts)
        {
            %>
            <link rel="preload" href="<%= font %>" as="font" type="font/woff2" crossorigin="">
            <%
        }

        // preload critical scripts
        var scripts = new List<string>
        {

        };

        foreach (var script in scripts)
        {
            var resource = String.Format(url, script, v);
            %>
            <link rel="preload" href="<%= resource %>" as="script">
            <%
        }
    }

    // inform browser to request resources on document parse. dispatch as critical resources
    if (!preload && !defer || all)
    {
        // request critical stylesheets
        var styles = new List<string>
        {
            "https://use.typekit.net/hcy0zto.css",
            "/css/default/shell.css"
        };

        if (isIndex) {
            styles.Add("/css/default/index.css");
        }

        if (isSpeakers) {
            styles.Add("/css/default/speakers.css");
        }

        if (isBenefits)
        {
            styles.Add("/css/default/benefits.css");
        }

        if (isFAQ)
        {
            styles.Add("/css/default/faq.css");
        }

        foreach (var style in styles)
        {
            var resource = String.Format(url, style, v);
            %>
            <link rel="stylesheet" href="<%= resource %>">
            <%
        }


        // request critical scripts. inform browser to defer script execution to document parse completion
        var scripts = new List<string>
        {
            
        };

        foreach (var script in scripts)
        {
            var resource = String.Format(url, script, v);
            %>
            <script src="<%= resource %>"></script>
            <%
        }
    }

    // inform browser to request resources on document parse. dispatch as deferred resources
    if (!preload && defer || all)
    {
        // request deferred stylesheets
        var styles = new List<string> {

        };

        foreach (var style in styles)
        {
            var resource = String.Format(url, style, v);
            %>
            <link rel="stylesheet" href="<%= resource %>" media="print" onload="this.media='all'; this.onload=null;">
            <noscript>
                <link rel="stylesheet" href="<%= resource %>">
            </noscript>
            <%
        }


        // request deferred scripts. inform browser to defer script execution to document parse completion
        var scripts = new List<string>
        {
            "/js/app.js",
            "/js/observer.js",
            "/js/lazy.js",
            "/js/page.js",
            "/Shared/js/ModalMaster/modal.js",
            "/shared/js/common.js"
        };

        foreach (var script in scripts)
        {
            var resource = String.Format(url, script, v);
            %>
            <script defer src="<%= resource %>"></script>
            <%
        }
    }
%>