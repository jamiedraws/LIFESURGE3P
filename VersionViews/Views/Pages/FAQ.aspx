<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<script runat="server">
    public class FAQ
    {
        public int DisplayRank { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
    var faqTickets = new List<FAQ> {
        new FAQ
        {
            DisplayRank = 1,
            Question = "CAN I ADD MORE TICKETS TO MY REGISTRATION?",
            Answer = @"Yes. Use the confirmation email to add additional tickets!"
        },
        new FAQ
        {
            DisplayRank = 2,
            Question = "DO YOU OFFER GROUP DISCOUNTS?",
            Answer = @"Yes. Executive tickets are discounted to $49 each when you purchase 3 or more. Group tickets are not offered on any other ticket section."
        },
        new FAQ
        {
            DisplayRank = 3,
            Question = "CAN I PURCHASE TICKETS AT THE DOOR/GATE/ENTRANCE?",
            Answer = @"Tickets need to be purchased prior to the day of the event. If tickets are still available the day of the event, all tickets will be full price at the door. If tickets are not available, entry will be denied day of the event."
        },
        new FAQ
        {
            DisplayRank = 4,
            Question = "CAN I PUT TICKETS ON HOLD?",
            Answer = @"No, at this time we are not allowing anyone to put tickets on hold."
        },
        new FAQ
        {
            DisplayRank = 5,
            Question = "WHAT TYPES OF PAYMENT DO YOU ACCEPT?",
            Answer = @"VISA, Master Card, AMEX, Discover, PayPal."
        },
        new FAQ
        {
            DisplayRank = 6,
            Question = "HOW WILL I GET MY TICKETS IF I BUY THEM ONLINE?",
            Answer = @"Your tickets will be sent to the email address you provided for registration during the transaction process. Be sure to save this message as it contains your confirmation and ticket information. If you can&apos;t find the confirmation email, check your junk/spam folder. If you&apos;re still having trouble, please reach out to <a href=""mailto:info@lifesurge.com"">info@lifesurge.com</a>."
        },
        new FAQ
        {
            DisplayRank = 7,
            Question = "IS THERE AN AGE LIMIT FOR THE EVENT? ",
            Answer = @"The event is intended for businesspeople and all attendees are required to have a ticket. We recommend young adults and older attend LIFE SURGE."
        },
        new FAQ
        {
            DisplayRank = 8,
            Question = " IS SEATING RESERVED?",
            Answer = @"It is open seating within each seating section. Arrive early to get the best possible seat in your section. Doors open 1 hour prior to the event start time."
        },
        new FAQ
        {
            DisplayRank = 9,
            Question = "WILL MY SEATS BE TOGETHER?",
            Answer = @"All seats are first come first serve within the section you have purchased. Arrive early to get the best seats and ensure your group doesn&apos;t get split up!"
        },
        new FAQ
        {
            DisplayRank = 10,
            Question = "CAN I GET MORE THAN ONE STANDARD TICKET?",
            Answer = @"No, sorry. Only one Standard ticket will be issued per registration."
        },          
        new FAQ
        {
            DisplayRank = 12,
            Question = "DO YOU HAVE APPROPRIATE SEATING FOR INDIVIDUALS WITH MEDICAL CONDITIONS, REQUIRE HANDICAP ACCESSIBLE SEATS, OR NEED DEAF/HARD OF HEARING ACCOMMODATIONS?",
            Answer = @"LIFE SURGE will ensure every event has proper seating for all attendees, but it will vary from venue to venue. Please visit the will call area day of the event for advice on wheelchair accessible seating. Please reach out to <a href=""mailto:info@lifesurge.com"">info@lifesurge.com</a> if you require special assistance for sign language interpreters or any other medical conditions that will require special seating."
        },      
        new FAQ
        {
            DisplayRank = 13,
            Question = "CAN I SHOW MY TICKETS ON MY PHONE AT THE DOOR OR DO I NEED TO HAVE THE PHYSICAL TICKETS WITH ME?",
            Answer = @"LIFE SURGE is doing everything we can to ensure it is a contactless event. To assist in expedition of entry, be sure to add your ticket to your Apple Wallet, Google Pay, or simply bring your e-registration on the day of the event to gain entry."
        },      
        new FAQ
        {
            DisplayRank = 14,
            Question = "WILL THERE BE OTHER LIFE SURGE EVENTS IN THE NEAR FUTURE?",
            Answer = @"Yes, but not in this city. LIFE SURGE will be brought directly to more than 100,000 Christian business owners and leaders in major cities across the country every year."
        },      
        new FAQ
        {
            DisplayRank = 15,
            Question = "WHAT IS THE CANCELLATION POLICY?",
            Answer = @"You will receive a 100% refund when the reservation is cancelled prior to 7 days of the event date. Registrations can be cancelled, upgraded, or modified via the confirmation email link. You may transfer your registration to another person up until the day prior to the event via the link in your most recent confirmation email.
                       In the event LIFE SURGE reschedules the event to another date at the same or another venue, the ticket will be transferred to the new scheduled event date and venue. If the event is cancelled by LIFE SURGE, the ticket will be refunded in full or can be transferred to another event.
                       The registrant agrees to comply with these terms and all additional terms, rules, and regulations included as part of this ticket purchase. "
        }
        
    };

    var faqEvent = new List<FAQ> {
        new FAQ
        {
            DisplayRank = 1,
            Question = "ARE THERE OPPORTUNITIES TO MEET THE SPEAKERS?",
            Answer = @"There are opportunities to meet certain speakers based on the ticket purchased. Please visit our Ticket section on our website for more information."
        },
        new FAQ
        {
            DisplayRank = 2,
            Question = "WILL LUNCH BE PROVIDED?",
            Answer = @"Lunch is only provided for VIP and ULTIMATE Ticket holders. We will have food available for purchase on site throughout the day. No outside food or beverage is permitted per the venue."
        },
        new FAQ
        {
            DisplayRank = 3,
            Question = "WHERE CAN I PARK? ",
            Answer = @"Parking is available at the Florida State Fairgrounds for $8 per vehicle. Parking for the disabled requires a designated license plate or hangtag."
        },
        new FAQ
        {
            DisplayRank = 4,
            Question = "WHAT SHOULD I WEAR?",
            Answer = @"We recommend business casual attire."
        },
        new FAQ
        {
            DisplayRank = 5,
            Question = "WILL THERE BE AN ATM ON SITE? ",
            Answer = @"Yes, there is an ATM at the event venue."
        },
        new FAQ
        {
            DisplayRank = 6,
            Question = "ARE SERVICE ANIMALS PERMITTED?",
            Answer = @"Yes, all service animals are permitted."
        },
        new FAQ
        {
            DisplayRank = 7,
            Question = "WILL HOTEL ACCOMODATIONS BE PROVIDED?",
            Answer = @"Because LIFE SURGE is a 1-day local event, hotel accommodations should not be needed and therefore, aren&apos;t provided."
        },
        new FAQ
        {
            DisplayRank = 8,
            Question = "WHAT ITEMS AM I NOT ALLOWED TO BRING INTO THE EVENT? ",
            Answer = @"All bags are subject to security search. No outside food, coolers etc. will be permitted inside the event. Food and beverage vendors will be available on location. Please view the venue website for their protocol and guidelines."
        },
        new FAQ
        {
            DisplayRank = 9,
            Question = "CAN I RECORD THE EVENT WITH MY PHONE OR ANY OTHER RECORDING DEVICE?",
            Answer = @"Out of respect for our speakers and other attendees, we request that you do not record the event."
        }    
    };

    var faqAbout = new List<FAQ> {
        new FAQ
        {
            DisplayRank = 1,
            Question = "WHAT IS LIFE SURGE?",
            Answer = @"LIFE SURGE is a Biblically-based business event, uniquely focused on helping business owners, salespeople, marketing leaders, and organizational leaders achieve real, measurable growth in themselves and in their organizations. Attendees will learn strategies from Christian experts in business growth, sales, and marketing while networking with hundreds of local and like-minded Christian businesspeople, all seeking a high return on their time and financial investment."
        },
        new FAQ
        {
            DisplayRank = 2,
            Question = "HOW IS THIS DIFFERENT FROM OTHER CHRISTIAN BUSINESS EVENTS?",
            Answer = @"Most Christian events focus on inspirational and/or theoretical content not directly related to business. LIFE SURGE provides practical strategies and techniques you can apply right away to your business, helping you realize quantifiable professional and personal results, while growing your faith."
        },
        new FAQ
        {
            DisplayRank = 3,
            Question = "HOW IS LIFE SURGE DIFFERENT FROM OTHER BUSINESS EVENTS?",
            Answer = @"Instead of hosting an annual national event like so many conferences and tradeshows, LIFE SURGE brings the magnitude and excitement of national events to local markets across the nation, throughout the year.
                    Additionally, not only are our speakers leading experts in their field, covering everything from sales techniques to effective marketing, leading to business and personal growth, but they come from a Christian worldview, and endeavor to live out their faith and values openly.
                    They will inspire you with their journey while helping to teach practical, relevant lessons focused on achieving your professional and personal goals. We&rsquo;re also bringing together local businesspeople for an opportunity to network and build connections, hopefully leading to a larger community of Christian businesspeople. Finally, tickets are affordably priced, making LIFE SURGE both a great product and a great value. "
        },
        new FAQ
        {
            DisplayRank = 4,
            Question = "WHO IS PRODUCING LIFE SURGE?",
            Answer = @"LIFE SURGE is produced by OXLOS, a Florida-based company known for excellence in developing and producing life-enriching business events and specialty functions."
        },
        new FAQ
        {
            DisplayRank = 5,
            Question = "ARE THERE SPONSORSHIP OPPORTUNITIES AVAILABLE?",
            Answer = @"You can learn more about becoming a sponsor by emailing <a href=""mailto:sponsorships@oxlos.com"">sponsorships@oxlos.com</a>. Being a sponsor gives you the opportunity to connect with a multitude of Christian business owners and organizational leaders across the country and within your local area, too."
        }
    };

    faqTickets = faqTickets.OrderBy(f => f.DisplayRank).ToList();
    faqAbout = faqAbout.OrderBy(f => f.DisplayRank).ToList();
    faqEvent = faqEvent.OrderBy(f => f.DisplayRank).ToList();
%>

<main class="view section">
    <div class="view__anchor" id="main"></div>
    <div class="view__in section__in">
        <div class="content content--title-box">
            <h1 class="content__title">
                FREQUENTLY ASKED QUESTIONS
            </h1>
        </div>  
        <div class="faq" itemscope itemtype="https://schema.org/FAQPage">
            <h2 class="faq__title">ABOUT TICKETS</h2>
            <dl class="faq__list">
            <% foreach (var faq in faqTickets) { %>
                <div class="faq__block" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
                    <dt class="faq__question" itemprop="name"><%= faq.Question %></dt>
                    <dd class="faq__answer" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
                        <div itemprop="text"><%= faq.Answer %></div>
                    </dd>
                </div>
            <% } %>
            </dl>

            <h2 class="faq__title">ABOUT THE DAY OF THE EVENT</h2>
            <dl class="faq__list">
                <% foreach (var faq in faqEvent) { %>
                    <div class="faq__block" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
                        <dt class="faq__question" itemprop="name"><%= faq.Question %></dt>
                        <dd class="faq__answer" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
                            <div itemprop="text"><%= faq.Answer %></div>
                        </dd>
                    </div>
                <% } %>
            </dl>

            <h2 class="faq__title">ABOUT US</h2>
            <dl class="faq__list">
                <% foreach (var faq in faqAbout) { %>
                    <div class="faq__block" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
                        <dt class="faq__question" itemprop="name"><%= faq.Question %></dt>
                        <dd class="faq__answer" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
                            <div itemprop="text"><%= faq.Answer %></div>
                        </dd>
                    </div>
                <% } %>
            </dl>
        </div>
   </div> 
</main>

</asp:Content>