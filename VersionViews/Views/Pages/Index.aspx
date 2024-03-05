<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="LIFESURGE3P.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server" >

<%
    var ticketUrl = SettingsManager.ContextSettings["Seminar.Template.Event.DestinationUrl--Event--", "#tickets"];
    var sessionLoaded = DtmContext.VisitorSessionId != Guid.Empty;

    if(sessionLoaded)
    {
        ticketUrl = ticketUrl.Replace("[#vsid#]", DtmContext.VisitorSessionId.ToString());
    }

    
%>
<%
    if(!sessionLoaded)
    {
        %>
        <script>
            addEventListener("SessionLoaded", function () {
               
                var qp = '';
                try {
                    var ref = window.location.href.split("?");
                    if (ref.length > 1 && ref[1].length > 0) {
                        qp = '&' + ref[1];
                    }
                    var expires = '<%=DateTime.UtcNow.AddDays(5).ToString("ddd, dd MMM yyyy HH:mm:ss GMT")%>'
                    document.cookie = "dtm_qp=" + qp + ";path=/" + ";expires=" + expires; 
                } catch (ex) { }
               

                $.ajax({
                    url: '/shared/services/visitorsession.ashx?covid=<%=DtmContext.VersionId%>',
                     data: '',
                     type: 'POST'
                }).always(function (data) {
                    var vsid = data;
                    var eles = document.getElementsByClassName('ticketUrl');

                    for (var i = 0; i < eles.length; i++) {
                        var origUrl = eles[i].href;
                        eles[i].href = origUrl.replace("[#vsid#]", vsid) + qp;
                    }
                });
            });
        </script>
    <%
        }
        else
        {
    %>
           <script>
               addEventListener("DOMContentLoaded", function () {
                   var qp = '';
                   var name = "dtm_qp=";
                   var ca = document.cookie.split(';');
                   for (var i = 0; i < ca.length; i++) {
                       var c = ca[i];
                       while (c.charAt(0) == ' ') {
                           c = c.substring(1);
                       }
                       if (c.indexOf(name) != -1) {
                           qp = c.substring(name.length, c.length);
                       }
                   }

                   if (qp.length > 0) {
                       var eles = document.getElementsByClassName('ticketUrl');

                       for (var i = 0; i < eles.length; i++) {
                           var origUrl = eles[i].href;
                           eles[i].href = origUrl + qp;
                       }
                   }
               });
           </script>
    <%
        }
%>
<!-- Main -->
<main aria-label="Hero" class="view hero hero--ticket section">
    <div class="view__anchor" id="main"></div>
    <div class="hero__bg-title bg bg--primary">
        <picture class="hero__bg">
            <source srcset="/images/hero/landing-page-640w.jpg" media="(max-width: 40rem)" />
            <img src="/images/hero/landing-page.jpg" alt="Presenting speakers like Tim Tebow, Willie Robertson and Auntie Anne Beiler standing in front of a crowd" />
        </picture>
        <h1 class="hero__title">
            <span data-title="America&rsquo;s #1 Christian Business Event"
                ><span>America&rsquo;s #1 Christian Business Event</span></span
            >
        </h1>
    </div>
    <div class="hero__banner">
        <div class="hero__text">
            <span>Willie robertson</span><span>Tim Tebow</span
            ><span>Auntie Anne Beiler + More!</span>
        </div>
        <nav aria-label="Main Interests" class="hero__nav">
            <a href="#speakers" class="button">View Full Line-Up</a>
            <a href="<%= ticketUrl %>" class="button hero__ticket-button ticketUrl"
                >Buy Tickets</a
            >
        </nav>
    </div>
</main>

<!-- About -->
<section aria-label="About" class="defer view section">
    <div class="defer__progress view__in section__in">
        <div class="content content--title-subtitle">
            <h2 class="content__title">
                SURGE YOUR LIFE GOD&rsquo;S WAY
            </h2>
            <div class="content__subtitle">
                Business &bull; Career &bull; Wealth &bull; Impact
            </div>
        </div>
        <div class="content content--text-video">
            <div class="content__group">
                <div
                    class="contain contain--video content__video"
                    data-src-iframe="https://player.vimeo.com/video/553457028?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479"
                    data-attr='{ "title" : "Life Surge", "allow" : "autoplay; fullscreen; picture-in-picture", "allowfullscreen" : "true", "width" : "1920", "height" : "1080", "frameborder" : "0" }'
                ></div>
                <div class="content__text">
                    <p>
                        <b
                            >LIFE SURGE is a 1-day life-changing
                            event,</b
                        >
                        where thousands of local Christian business
                        leaders gather and connect to get inspired and
                        learn from today&rsquo;s leading Christian
                        business speakers.
                    </p>
                    <p>
                        We integrate best practices, Biblical
                        strategies, and the Holy Spirit to
                        <b
                            >succeed and achieve a tangible SURGE of
                            improvement</b
                        >
                        in our businesses, careers, wealth, impact and
                        LIFE.
                    </p>
                </div>
            </div>
        </div>
        <figure class="quote quote--bars">
            <blockquote>
                &ldquo;I AM THE LORD YOUR GOD, WHO TEACHES YOU HOW TO
                PROFIT, WHO LEADS YOU IN A WAY YOU SHOULD GO.&rdquo;
            </blockquote>
            <figcaption>ISAIAH 48:17</figcaption>
        </figure>
    </div>
</section>

<!-- Event Topics -->
<section aria-label="Event Topics" class="defer view section">
    <div class="view__anchor" id="topics"></div>
    <div class="defer__progress view__in section__in">
        <div class="content content--title-box">
            <h2 class="content__title">
                what you&rsquo;ll learn at the event
            </h2>
        </div>
        <div class="content content--icon-text-list-group">
            <div class="content__group">
                <div class="content content--icon-text-list">
                    <div class="content__group">
                        <picture
                            class="contain contain--icon"
                            data-src-img="/images/icons/business.png"
                            data-attr='{ "alt" : "", "role" : "presentation", "aria-hidden" : "true" }'
                        ></picture>
                        <div class="content__text">
                            <h3 class="content__title">BUSINESS</h3>
                            <ul>
                                <li>
                                    Post COVID Revenue Growth Strategies
                                </li>
                                <li>
                                    Biblical Strategies for Maximizing
                                    Profit
                                </li>
                                <li>
                                    Negotiating Secrets of the Apostle
                                    Paul
                                </li>
                                <li>How to Launch Your Next Idea</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="content content--icon-text-list">
                    <div class="content__group">
                        <picture
                            class="contain contain--icon"
                            data-src-img="/images/icons/career.png"
                            data-attr='{ "alt" : "", "role" : "presentation", "aria-hidden" : "true" }'
                        ></picture>
                        <div class="content__text">
                            <h3 class="content__title">Career</h3>
                            <ul>
                                <li>Your Personal Brand Makeover</li>
                                <li>
                                    Cultivating God&rsquo;s Favor with
                                    People
                                </li>
                                <li>
                                    Keys to a Healthy Work/Life Balance
                                </li>
                                <li>
                                    How to Pivot Into God&rsquo;s
                                    Calling
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="content content--icon-text-list">
                    <div class="content__group">
                        <picture
                            class="contain contain--icon"
                            data-src-img="/images/icons/wealth.png"
                            data-attr='{ "alt" : "", "role" : "presentation", "aria-hidden" : "true" }'
                        ></picture>
                        <div class="content__text">
                            <h3 class="content__title">Wealth</h3>
                            <ul>
                                <li>
                                    Wealth Building Secrets of Solomon
                                </li>
                                <li>
                                    Innovative Real Estate Investing
                                    Strategies
                                </li>
                                <li>
                                    Optimizing Stocks & Options Trading
                                </li>
                                <li>How to Fund Your Dream</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="content content--icon-text-list">
                    <div class="content__group">
                        <picture
                            class="contain contain--icon"
                            data-src-img="/images/icons/impact.png"
                            data-attr='{ "alt" : "", "role" : "presentation", "aria-hidden" : "true" }'
                        ></picture>
                        <div class="content__text">
                            <h3 class="content__title">Impact</h3>
                            <ul>
                                <li>Developing a Kingdom Mindset</li>
                                <li>
                                    Leveraging Your Calling for More
                                    Impact
                                </li>
                                <li>
                                    Changing the Marketplace for Christ
                                </li>
                                <li>
                                    How to Build for Tomorrow & Eternity
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Speaker Line-Up -->
<section
    aria-label="Speaker Line-Up"
    class="defer view speaker speaker--cards section"
>
    <div class="view__anchor" id="speakers"></div>
    <div class="defer__progress view__in section__in">
        <div class="content content--title-box">
            <h2 class="content__title">Speaker Line-Up</h2>
        </div>
        <div class="speaker__in">
            <div class="speaker__group">
                <!-- Tim Tebow -->
                <figure class="card card--speaker">
                    <picture
                        class="contain contain--speaker"
                        data-src-img="/images/speakers/tim-tebow.jpg"
                        data-attr='{ "alt" : "Tim Tebow" }'
                    ></picture>
                    <figcaption>
                        <div class="card__name">Tim Tebow</div>
                        <div class="card__role">
                            Athlete, Entrepreneur & Philanthropist
                        </div>
                        <a aria-label="Learn More About Tim Tebow" href="Speakers<%= DtmContext.ApplicationExtension %>#tim-tebow">Learn More</a>
                    </figcaption>
                </figure>

                <!-- Willie Robertson -->
                <figure class="card card--speaker">
                    <picture
                        class="contain contain--speaker"
                        data-src-img="/images/speakers/willie-robertson.jpg"
                        data-attr='{ "alt" : "Willie Robertson" }'
                    ></picture>
                    <figcaption>
                        <div class="card__name">Willie Robertson</div>
                        <div class="card__role">
                            CEO of Duck Commander and Star of Duck
                            Dynasty
                        </div>
                        <a aria-label="Learn More About Willie Robertson" href="Speakers<%= DtmContext.ApplicationExtension %>#willie-robertson"
                            >Learn More</a
                        >
                    </figcaption>
                </figure>

                <!-- AUNTIE ANNE BEILER -->
                <figure class="card card--speaker">
                    <picture
                        class="contain contain--speaker"
                        data-src-img="/images/speakers/auntie-anne-beiler.jpg"
                        data-attr='{ "alt" : "AUNTIE ANNE BEILER" }'
                    ></picture>
                    <figcaption>
                        <div class="card__name">AUNTIE ANNE BEILER</div>
                        <div class="card__role">
                            Founder of Auntie Anne&rsquo;s Pretzels
                            1,800+ Locations Worldwide
                        </div>
                        <a aria-label="Learn More About Auntie Anne Beiler" href="Speakers<%= DtmContext.ApplicationExtension %>#auntie-anne-beiler"
                            >Learn More</a
                        >
                    </figcaption>
                </figure>

                <!-- Matthew West -->
                <figure class="card card--speaker">
                    <picture
                        class="contain contain--speaker"
                        data-src-img="/images/speakers/matthew-west.jpg"
                        data-attr='{ "alt" : "Matthew West" }'
                    ></picture>
                    <figcaption>
                        <div class="card__name">Matthew West</div>
                        <div class="card__role">
                            5X Grammy Nominee and Recording Artist
                        </div>
                        <a aria-label="Learn More About Matthew West" href="Speakers<%= DtmContext.ApplicationExtension %>#matthew-west"
                            >Learn More</a
                        >
                    </figcaption>
                </figure>

                <!-- The Benham Brothers -->
                <figure class="card card--speaker">
                    <picture
                        class="contain contain--speaker"
                        data-src-img="/images/speakers/the-benham-brothers.jpg"
                        data-attr='{ "alt" : "The Benham Brothers" }'
                    ></picture>
                    <figcaption>
                        <div class="card__name">
                            The Benham Brothers
                        </div>
                        <div class="card__role">
                            Nationally Acclaimed Kingdom Entrepreneurs
                        </div>
                        <a aria-label="Learn More About The Benham Brothers" href="Speakers<%= DtmContext.ApplicationExtension %>#the-benham-brothers"
                            >Learn More</a
                        >
                    </figcaption>
                </figure>

                <!-- Egypt Sherrod -->
                <figure class="card card--speaker">
                    <picture
                        class="contain contain--speaker"
                        data-src-img="/images/speakers/egypt-sherrod.jpg"
                        data-attr='{ "alt" : "Egypt Sherrod" }'
                    ></picture>
                    <figcaption>
                        <div class="card__name">Egypt Sherrod</div>
                        <div class="card__role">
                            HGTV Host of Property Virgins, Flipping
                            Virgins, & Real Estate State Expert
                        </div>
                        <a aria-label="Learn More About Egypt Sherrod" href="Speakers<%= DtmContext.ApplicationExtension %>#egypt-sherrod"
                            >Learn More</a
                        >
                    </figcaption>
                </figure>

                <!-- BRIG SORBER -->
                <figure class="card card--speaker">
                    <picture
                        class="contain contain--speaker"
                        data-src-img="/images/speakers/brig-sorber.jpg"
                        data-attr='{ "alt" : "BRIG SORBER" }'
                    ></picture>
                    <figcaption>
                        <div class="card__name">BRIG SORBER</div>
                        <div class="card__role">
                            Executive Chairman of Two Men and a Truck
                        </div>
                        <a aria-label="Learn More About Brig Sorber" href="Speakers<%= DtmContext.ApplicationExtension %>#brig-sorber"
                            >Learn More</a
                        >
                    </figcaption>
                </figure>

                <!-- DAVID SALYERS -->
                <figure class="card card--speaker">
                    <picture
                        class="contain contain--speaker"
                        data-src-img="/images/speakers/david-salyers.jpg"
                        data-attr='{ "alt" : "DAVID SALYERS" }'
                    ></picture>
                    <figcaption>
                        <div class="card__name">DAVID SALYERS</div>
                        <div class="card__role">
                            Original Chick-fil-A Marketing Executive and Pioneer
                        </div>
                        <a aria-label="Learn More About David Salyers" href="Speakers<%= DtmContext.ApplicationExtension %>#david-salyers"
                            >Learn More</a
                        >
                    </figcaption>
                </figure>

                <!-- Krish Dhanam -->
                <figure class="card card--speaker">
                    <picture
                        class="contain contain--speaker"
                        data-src-img="/images/speakers/krish-dhanam.jpg"
                        data-attr='{ "alt" : "Krish Dhanam" }'
                    ></picture>
                    <figcaption>
                        <div class="card__name">Krish Dhanam</div>
                        <div class="card__role">
                            Zig Ziglar Protege & One Of The
                            World&rsquo;s Best Speakers
                        </div>
                        <a aria-label="Learn More About Krish Dhanam" href="Speakers<%= DtmContext.ApplicationExtension %>#krish-dhanam"
                            >Learn More</a
                        >
                    </figcaption>
                </figure>

                <!-- Jamie & Ryan Smith -->
                <figure class="card card--speaker">
                    <picture
                        class="contain contain--speaker"
                        data-src-img="/images/speakers/jamie-and-ryan-smith.jpg"
                        data-attr='{ "alt" : "Jamie & Ryan Smith" }'
                    ></picture>
                    <figcaption>
                        <div class="card__name">Jamie & Ryan Smith</div>
                        <div class="card__role">
                            From Trailer Cash To Real Estate
                            Multi-Millionaires
                        </div>
                        <a aria-label="Learn More About Jamie and Ryan Smith" href="Speakers<%= DtmContext.ApplicationExtension %>#jamie-and-ryan-smith"
                            >Learn More</a
                        >
                    </figcaption>
                </figure>

                <!-- Michael Pink -->
                <figure class="card card--speaker">
                    <picture
                        class="contain contain--speaker"
                        data-src-img="/images/speakers/michael-pink.jpg"
                        data-attr='{ "alt" : "Michael Pink" }'
                    ></picture>
                    <figcaption>
                        <div class="card__name">Michael Pink</div>
                        <div class="card__role">
                            The World&rsquo;s Leading Biblical Sales &
                            Business Expert
                        </div>
                        <a aria-label="Learn More About Michael Pink" href="Speakers<%= DtmContext.ApplicationExtension %>#michael-pink"
                            >Learn More</a
                        >
                    </figcaption>
                </figure>

                <!-- Myron Golden -->
                <figure class="card card--speaker">
                    <picture
                        class="contain contain--speaker"
                        data-src-img="/images/speakers/myron-golden.jpg"
                        data-attr='{ "alt" : "Myron Golden" }'
                    ></picture>
                    <figcaption>
                        <div class="card__name">Myron Golden</div>
                        <div class="card__role">
                            10X Business Growth Strategist
                        </div>
                        <a aria-label="Learn More About Myron Golden" href="Speakers<%= DtmContext.ApplicationExtension %>#myron-golden"
                            >Learn More</a
                        >
                    </figcaption>
                </figure>
            </div>
        </div>
    </div>
</section>

<!-- Location Details -->
<section
    aria-label="Location Details"
    class="defer view section bg bg--accent"
>
    <div class="view__anchor" id="location"></div>
    <div class="defer__progress view__in section__in">
        <div class="content content--title-text">
            <h2 class="content__title">Location details</h2>
            <p class="content__pill-box">
                JULY 16, 2021 FROM 8:00AM TO 5:00PM<br />THE FLORIDA
                STATE FAIRGROUNDS EXPO HALL
            </p>
        </div>
        <div class="content content--text-map">
            <div class="content__group">
                <div class="content__text">
                    <h3 class="content__title">
                        FLORIDA STATE FAIRGROUNDS<br />EXPO HALL
                    </h3>
                    <ul>
                        <li>4800 US-301, Tampa, FL 33610</li>
                        <li>Near the I-4 and I-75 Intersection</li>
                        <li>
                            Located next to The MidFlorida Credit Union
                            Amphitheatre and across the street from The
                            Seminole Hard Rock Hotel & Casino Tampa
                        </li>
                    </ul>
                    <a href="<%= ticketUrl %>" class="button button--contrast ticketUrl">
                        Click Here To Buy Tickets

                    </a>
                </div>
                <div
                    class="content__map contain contain--map"
                    data-src-iframe="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d452402.35679839854!2d-82.5466729514563!3d27.643297414129513!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88c2cf34619314dd%3A0x917ca1676443ed84!2s4800%20US-301%2C%20Tampa%2C%20FL%2033610!5e0!3m2!1sen!2sus!4v1622041830908!5m2!1sen!2sus%22"
                    data-attr='{ "title" : "Map", "frameborder" : "0", "width" : "500", "height" : "281" }'
                ></div>
            </div>
        </div>
    </div>
</section>

<!-- Tickets -->
<% var countdown = ViewData["OfferCountdown"] as OfferCountdown ?? new OfferCountdown(); %>
<section aria-label="Tickets" class="view section">
    <div class="view__anchor" id="tickets"></div>
    <div class="defer">
    <div class="defer__progress view__in section__in">
        <div class="content content--title-box">
            <a href="<%= ticketUrl %>" class="content__title ticketUrl">Tickets</a>
        </div>
        <div class="ticket ticket--list">
            <div class="ticket__group">
                <!-- Standard Ticket -->
                <div
                    class="
                        content content--ticket
                        ticket ticket--sold-out
                    "
                >
                    <div class="ticket__status">Limited</div>
                    <div class="content__group">
                        <h3 class="content__title">Standard Ticket</h3>
                        <div class="content__title">
                            Price: $19
                        </div>
                        <% if (!countdown.IsExpired()) { %>
                        <div class="offer offer--flag-text">
                            <div class="offer__text">
                                BOGO Free Ticket Sale,<br />Ends June 14. <span class="offer__disclaimer">Ultimate Plus tickets not included in sale.</span>
                            </div>
                        </div>
                        <% } %>
                        <div
                            class="
                                content__text-list
                                content
                                content--text-list
                            "
                        >
                            <ul>
                                <li>1 Standard Section Ticket</li>
                                <li>Newly Expanded Standard Seating</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Executive Ticket -->
                <div class="content content--ticket ticket">
                    <div class="content__group">
                        <h3 class="content__title">Executive Ticket</h3>
                        <div class="content__title">
                            Price:
                            <% if (!countdown.IsExpired()) { %>
                            <div class="markdown-price">$79</div>
                            $49
                            <% } else { %>
                            $79
                            <% } %>
                        </div>
                        <% if (!countdown.IsExpired()) { %>
                        <div class="offer offer--flag-text">
                            <div class="offer__text">
                                BOGO Free Ticket Sale,<br />Ends June 14. <span class="offer__disclaimer">Ultimate Plus tickets not included in sale.</span>
                            </div>
                        </div>
                        <% } %>
                        <div
                            class="
                                content__text-list
                                content
                                content--text-list
                            "
                        >
                            <div class="content__title">
                                Executive Benefits 
                            </div>
                            <ul>
                                <li>1 Executive Section Ticket (Good Seats)</li>
                                <li>THE BIBLE INCORPORATED: The Pocket Bible for Business</li>
                                <li>All Instant Downloads</li>
                            </ul>
                        </div>
                        <div class="content__callout">
                            <div class="callout">
                                Selling Fast!
                            </div>
                        </div>
                    </div>
                </div>

                <!-- VIP Ticket -->
                <div class="content content--ticket ticket">
                    <div class="content__group">
                        <h3 class="content__title">VIP Ticket</h3>
                        <div class="content__title">
                            Price:
                            <% if (!countdown.IsExpired()) { %>
                            <div class="markdown-price">$399</div>
                            $249
                            <% } else { %>
                            $399
                            <% } %>
                        </div>
                        <% if (!countdown.IsExpired()) { %>
                        <div class="offer offer--flag-text">
                            <div class="offer__text">
                                BOGO Free Ticket Sale,<br />Ends June 14. <span class="offer__disclaimer">Ultimate Plus tickets not included in sale.</span>
                            </div>
                        </div>
                        <% } %>
                        <div
                            class="
                                content__text-list
                                content
                                content--text-list
                            "
                        >
                            <div class="content__title">
                                VIP Benefits
                            </div>
                            <ul>
                                <li>1 VIP Section Ticket (Great Seats)</li>
                                <li>Access to VIP Lounge</li>
                                <li>Meet Speakers* in VIP Breakfast</li>
                                <li>Meet Speakers in VIP Lounge Throughout the Day</li>
                                <li>Meet Speakers in VIP Lounge After-Party</li>
                                <li>VIP Lunch with Speaker Panel</li>
                                <li>VIP Swag Bag </li>
                                <li>Priority VIP Entry into the Event</li>
                                <li>Tim Tebow’s Book THIS IS THE DAY</li>
                                <li>Willie Robertson’s Book THE DUCK COMMANDER FAMILY</li>
                            </ul>

                            <div class="content__title">
                                +All Executive Benefits 
                            </div>
                            <ul>
                                <li>THE BIBLE INCORPORATED: The Pocket Bible for Business</li>
                                <li>All Instant Downloads</li>
                            </ul>
                        </div>
                        <div class="content__callout">
                            <div class="callout">
                                Selling Out!
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tim Tebow Ultimate -->
                <div class="content content--ticket ticket ticket--sold-out">
                    <div class="ticket__status">Sold Out</div>
                    <div class="content__group">
                        <h3 class="content__title">
                            Tim Tebow Ultimate
                        </h3>
                        <div class="content__title">Price: $899</div>
                        <div
                            class="
                                content__text-list
                                content
                                content--text-list
                            "
                        >
                            <div class="content__title">
                                Ultimate Benefits
                            </div>
                            <ul>
                                <li>1 Ultimate Section Ticket (Best Seats)</li>
                                <li>Meet Tim Tebow</li>
                                <li>Your Picture Taken with Tim Tebow</li>
                                <li>Tim Tebow Autographed Football</li>
                                <li>Tim Tebow’s Book THIS IS THE DAY</li>
                            </ul>

                            <div class="content__title">
                                +All VIP Benefits
                            </div>
                            <ul>
                                <li>Access to VIP Lounge</li>
                                <li>Meet Speakers* in VIP Breakfast </li>
                                <li>Meet Speakers in VIP Lounge Throughout the Day</li>
                                <li>Meet Speakers in VIP Lounge After-Party</li>
                                <li>VIP Lunch with Speaker Panel</li>
                                <li>VIP Swag Bag </li>
                                <li>Priority VIP Entry into the Event</li>
                            </ul>

                            <div class="content__title">
                                +All Executive Benefits 
                            </div>
                            <ul>
                                <li>THE BIBLE INCORPORATED: The Pocket Bible for Business</li>
                                <li>All Instant Downloads</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Willie Robertson Ultimate -->
                <div class="content content--ticket ticket ticket--sold-out">
                    <div class="ticket__status">Sold Out</div>
                    <div class="content__group">
                        <h3 class="content__title">
                            Willie Robertson Ultimate
                        </h3>
                        <div class="content__title">Price: $899</div>
                        <div
                            class="
                                content__text-list
                                content
                                content--text-list
                            "
                        >
                            <div class="content__title">
                                Ultimate Benefits
                            </div>
                            <ul>
                                <li>1 Ultimate Section Ticket (Best Seats)</li>
                                <li>Meet Willie Robertson</li>
                                <li>Your Picture Taken with Willie Robertson</li>
                                <li>Willie Robertson Autographed Duck Call</li>
                                <li>Willie Robertson’s Book THE DUCK COMMANDER FAMILY</li>
                            </ul>

                            <div class="content__title">
                                +All VIP Benefits
                            </div>
                            <ul>
                                <li>Access to VIP Lounge</li>
                                <li>Meet Speakers* in VIP Breakfast </li>
                                <li>Meet Speakers in VIP Lounge Throughout the Day</li>
                                <li>Meet Speakers in VIP Lounge After-Party</li>
                                <li>VIP Lunch with Speaker Panel</li>
                                <li>VIP Swag Bag </li>
                                <li>Priority VIP Entry into the Event</li>
                            </ul>

                            <div class="content__title">
                                +All Executive Benefits 
                            </div>
                            <ul>
                                <li>THE BIBLE INCORPORATED: The Pocket Bible for Business</li>
                                <li>All Instant Downloads</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Ultimate Plus -->
                <div class="content content--ticket ticket">
                    <div class="content__group">
                        <h3 class="content__title">Ultimate Plus</h3>
                        <div class="content__title">Price: $1299</div>
                        <div
                            class="
                                content__text-list
                                content
                                content--text-list
                            "
                        >
                            <div class="content__title">
                                Ultimate Benefits
                            </div>
                            <ul>
                                <li>1 Ultimate Section Ticket (Best Seats)</li>
                                <li>Meet Tim Tebow</li>
                                <li>Your Picture Taken with Tim Tebow</li>
                                <li>Meet Willie Robertson</li>
                                <li>Your Picture Taken with Willie Robertson</li>
                                <li>Tim Tebow Autographed Football</li>
                                <li>Tim Tebow’s Book THIS IS THE DAY</li>
                                <li>Willie Robertson Autographed Duck Call</li>
                                <li>Willie Robertson’s Book THE DUCK COMMANDER FAMILY</li>
                            </ul>

                            <div class="content__title">
                                +All VIP Benefits
                            </div>
                            <ul>
                                <li>Access to VIP Lounge</li>
                                <li>Meet Speakers* in VIP Breakfast </li>
                                <li>Meet Speakers in VIP Lounge Throughout the Day</li>
                                <li>Meet Speakers in VIP Lounge After-Party</li>
                                <li>VIP Lunch with Speaker Panel</li>
                                <li>VIP Swag Bag </li>
                                <li>Priority VIP Entry into the Event</li>
                            </ul>

                            <div class="content__title">
                                +All Executive Benefits 
                            </div>
                            <ul>
                                <li>THE BIBLE INCORPORATED: The Pocket Bible for Business</li>
                                <li>All Instant Downloads</li>
                            </ul>
                        </div>
                        <div class="content__callout">
                            <div class="callout">
                                Almost Sold Out!
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="ticket ticket--nav">
        <a href="<%= ticketUrl %>" class="button button--can-scale ticketUrl">Buy Tickets</a>
    </div>
</section>

</asp:Content>