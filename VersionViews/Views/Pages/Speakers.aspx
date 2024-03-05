<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<!-- Speaker Line-Up -->
<main aria-label="Speaker Line-Up" class="view speaker speaker--cards section">
    <div class="view__anchor" id="main"></div>
    <div class="view__in section__in">
        <div class="content content--title-box">
            <h2 class="content__title">Speakers</h2>
        </div>
        <div class="speaker__in">
            <div class="speaker__group">
                <!-- Tim Tebow -->
                <figure class="view speaker speaker--picture-text">
                    <div class="view__anchor" id="tim-tebow"></div>
                    <div class="speaker__group">
                        <picture
                            class="contain contain--speaker"
                            data-src-img="/images/speakers/tim-tebow.jpg"
                            data-attr='{ "alt" : "Tim Tebow" }'
                        ></picture>
                        <figcaption class="speaker__text">
                            <h3 class="speaker__title">TIM<br />TEBOW</h3>
                            <h4 class="speaker__role">
                                ATHLETE, ENTREPRENEUR, AND PHILANTHROPIST
                            </h4>
                            <p>
                                Tim Tebow is a two-time national champion,
                                first-round NFL draft pick and Heisman Trophy
                                winner, entrepreneur, author, and
                                philanthropist. His drive, both on and off the
                                field, has led him to accomplish greatness in
                                the midst of adversity and to keep moving
                                forward to make an impact for the Kingdom of
                                God.
                            </p>
                            <p>
                                In 2010, he established the Tim Tebow Foundation
                                to bring faith, hope, and love to those needing
                                a brighter day in their darkest hour. His story
                                is guaranteed to motivate you to make an impact
                                with both businesses, and your personal calling,
                                like never before.
                            </p>
                        </figcaption>
                    </div>
                </figure>

                <!-- Willie Robertson -->
                <figure class="view speaker speaker--picture-text">
                    <div class="view__anchor" id="willie-robertson"></div>
                    <div class="speaker__group">
                        <picture
                            class="contain contain--speaker"
                            data-src-img="/images/speakers/willie-robertson.jpg"
                            data-attr='{ "alt" : "Willie Robertson" }'
                        ></picture>
                        <figcaption class="speaker__text">
                            <h3 class="speaker__title">
                                WILLIE<br />ROBERTSON
                            </h3>
                            <h4 class="speaker__role">
                                CEO OF DUCK COMMANDER AND STAR OF DUCK DYNASTY
                            </h4>
                            <p>
                                Willie Robertson expanded his family&rsquo;s
                                business from a living room operation to a
                                multi-million dollar enterprise. His insights
                                and drive were the sparkplugs to launch the
                                innovative A&E television series Duck Dynasty,
                                which shattered all previous cable reality TV
                                shows ratings records.
                            </p>
                            <p>
                                Willie led a team of over 100 employees with
                                more than one million duck calls sold annually.
                                Duck Commander is the best-selling duck call
                                brand in the U.S. Duck Commander and Buck
                                Commander are highly popular brands focused on
                                apparel, hunting gear, food items, and more.
                            </p>
                            <p>
                                Willie is also the New York Times best-selling
                                author of the American Entrepreneur and The Duck
                                Commander Family: How Faith, Family, and Ducks
                                Built a Dynasty. Willie&rsquo;s story is a
                                remarkable example of kingdom based
                                entrepreneurship and dedication built on hard
                                work, faith, and family.
                            </p>
                        </figcaption>
                    </div>
                </figure>

                <!-- AUNTIE ANNE BEILER -->
                <figure class="view speaker speaker--picture-text">
                    <div class="view__anchor" id="auntie-anne-beiler"></div>
                    <div class="speaker__group">
                        <picture
                            class="contain contain--speaker"
                            data-src-img="/images/speakers/auntie-anne-beiler.jpg"
                            data-attr='{ "alt" : "AUNTIE ANNE BEILER" }'
                        ></picture>
                        <figcaption class="speaker__text">
                            <h3 class="speaker__title">
                                AUNTIE ANNE<br />BEILER
                            </h3>
                            <h4 class="speaker__role">
                                FOUNDER OF AUNTIE ANNE&rsquo;S PRETZELS 1,800+
                                LOCATIONS WORLDWIDE
                            </h4>
                            <p>
                                In just one year, Auntie Anne&rsquo;s Pretzels
                                grew from a small side hustle to over 100 stores
                                nationwide. Founded on Christian principles, the
                                company is today the world&rsquo;s largest
                                pretzel franchise with over 1,800 stores.
                            </p>
                            <p>
                                In this unforgettable presentation, Anne Beiler
                                shares the power of endurance in pursuing her
                                vision and reveals her personal struggle to move
                                from pain to purpose and growth. You&rsquo;ll
                                hear how her faith saved her life, led her to
                                success, and helped her reach past her own
                                despair to help others. In the end, Anne&rsquo;s
                                story is about the true freedom that comes to
                                those willing to break free from the
                                enemy&rsquo;s stronghold.
                            </p>
                        </figcaption>
                    </div>
                </figure>

                <!-- Matthew West -->
                <figure class="view speaker speaker--picture-text">
                    <div class="view__anchor" id="matthew-west"></div>
                    <div class="speaker__group">
                        <picture
                            class="contain contain--speaker"
                            data-src-img="/images/speakers/matthew-west.jpg"
                            data-attr='{ "alt" : "Matthew West" }'
                        ></picture>
                        <figcaption class="speaker__text">
                            <h3 class="speaker__title">
                                EMCEE<br />MATTHEW WEST
                            </h3>
                            <h4 class="speaker__role">
                                5X GRAMMY NOMINEE AND RECORDING ARTIST
                            </h4>
                            <p>
                                Matthew West is a five-time GRAMMY nominee,
                                American Music Award winner, a Billboard Music
                                Award winner, and has been named
                                Billboard&rsquo;s Hot Christian Songwriter of
                                the Year. He has more than 130 songwriting
                                credits to his name including cuts by Rascal
                                Flatts, Michael W. Smith, Casting Crowns,
                                Mandisa, and others. In February 2020, he
                                released his studio album, Brand New, which
                                includes the multiple-week No. 1 single, The God
                                Who Stays, and his most recent No. 1 single,
                                Truth Be Told.
                            </p>
                            <p>
                                Matthew is passionate about providing hope and
                                healing through the power of prayer and story.
                                Along with his father, Pastor Joe West, they
                                founded popwe, a non-profit ministry helping
                                others craft, share, and live a more meaningful
                                life. At LIFE SURGE, Matthew West will be our
                                emcee and will lead worship throughout the
                                event.
                            </p>
                        </figcaption>
                    </div>
                </figure>

                <!-- The Benham Brothers -->
                <figure class="view speaker speaker--picture-text">
                    <div class="view__anchor" id="the-benham-brothers"></div>
                    <div class="speaker__group">
                        <picture
                            class="contain contain--speaker"
                            data-src-img="/images/speakers/the-benham-brothers.jpg"
                            data-attr='{ "alt" : "The Benham Brothers" }'
                        ></picture>
                        <figcaption class="speaker__text">
                            <h3 class="speaker__title">THE BENHAM<br />BROTHERS</h3>
                            <h4 class="speaker__role">
                                NATIONALLY ACCLAIMED KINGDOM ENTREPRENEURS
                            </h4>
                            <p>
                                Twin brothers, David and Jason Benham, are
                                former professional baseball players, nationally
                                acclaimed entrepreneurs, and best-selling
                                authors. Their rise to success came with their
                                first company, which grew to 100 offices in 35
                                states, and catapulted them onto the national
                                stage. They topped charts like Inc.
                                Magazine&rsquo;s fastest-growing companies,
                                Franchise 500&rsquo;s top new franchises, Ernst
                                & Young&rsquo;s Entrepreneur of the year
                                finalists, The Wall Street Journal&rsquo;s top
                                five real estate agents in America list, and US
                                Chamber of Commerce&rsquo;s top small business
                                of the year.
                            </p>
                            <p>
                                The brothers launched the I Will Stand Strong
                                initiative with a ministry partner, to inspire
                                and equip young people around the nation to
                                stand strong for their faith &mdash; like the
                                prophet Daniel, in the midst of a morally
                                declining culture.
                            </p>
                        </figcaption>
                    </div>
                </figure>

                <!-- Egypt Sherrod -->
                <figure class="view speaker speaker--picture-text">
                    <div class="view__anchor" id="egypt-sherrod"></div>
                    <div class="speaker__group">
                        <picture
                            class="contain contain--speaker"
                            data-src-img="/images/speakers/egypt-sherrod.jpg"
                            data-attr='{ "alt" : "Egypt Sherrod" }'
                        ></picture>
                        <figcaption class="speaker__text">
                            <h3 class="speaker__title">EGYPT<br />SHERROD</h3>
                            <h4 class="speaker__role">
                                HGTV HOST & REAL ESTATE EXPERT
                            </h4>
                            <p>
                                Coming from humble beginnings and rooted in the
                                belief that where we are today is a reflection
                                of seeds we&rsquo;ve sown yesterday, Egypt
                                invested in prayer, hard work, and
                                uncompromising integrity to become an
                                award-winning real estate broker & CEO of the
                                Atlanta based Egypt Sherrod Real Estate Group.
                            </p>
                            <p>
                                She took over the role of host of Property
                                Virgins, went on to host and produce Flipping
                                Virgins, and today is considered the queen of
                                HGTV. Her personal story of faith, work,
                                creativity, and effort will leave you knowing
                                that anything is possible.
                            </p>
                        </figcaption>
                    </div>
                </figure>

                <!-- BRIG SORBER -->
                <figure class="view speaker speaker--picture-text">
                    <div class="view__anchor" id="brig-sorber"></div>
                    <div class="speaker__group">
                        <picture
                            class="contain contain--speaker"
                            data-src-img="/images/speakers/brig-sorber.jpg"
                            data-attr='{ "alt" : "BRIG SORBER" }'
                        ></picture>
                        <figcaption class="speaker__text">
                            <h3 class="speaker__title">BRIG<br />SORBER</h3>
                            <h4 class="speaker__role">
                                Executive Chairman of Two Men and a Truck
                            </h4>
                            <p>
                                Two Men and A Truck started with an old pickup
                                truck, as a way for Brig and his younger brother
                                to make extra money in high school. These teens,
                                guided by their encouraging mother and older
                                sister, took something as basic as moving
                                furniture and added compassion to become the
                                global brand they are today.
                            </p>
                            <p>
                                Using Biblical principles at an early age, they
                                gave their first $1000 profit to ten local
                                charities, hence their motto, Movers Who Care.
                                Now 35 years later, as Christ followers applying
                                Biblical principles to their business, they are
                                leaders in the moving industry with 380
                                locations worldwide, 2,800 full size moving
                                trucks, and nearly half a billion in annual
                                revenues!
                            </p>
                        </figcaption>
                    </div>
                </figure>

                <!-- DAVID SALYERS -->
                <figure class="view speaker speaker--picture-text">
                    <div class="view__anchor" id="david-salyers"></div>
                    <div class="speaker__group">
                        <picture
                            class="contain contain--speaker"
                            data-src-img="/images/speakers/david-salyers.jpg"
                            data-attr='{ "alt" : "DAVID SALYERS" }'
                        ></picture>
                        <figcaption class="speaker__text">
                            <h3 class="speaker__title">DAVID<br />SALYERS</h3>
                            <h4 class="speaker__role">
                                Original Chick-fil-A Marketing Executive and Pioneer
                            </h4>
                            <p>
                                David Salyers, a true, original marketing
                                pioneer, spent 37 years at Chick-fil-A, helping
                                it become the incredible multi-billion-dollar
                                iconic brand that it is today. During his time
                                at Chick-fil-A, David led the growth and
                                development of the iconic &lsquo;cow
                                campaign&rsquo;, which took Chick-fil-A to
                                annual sales of over $10 Billion collectively.
                                David helped champion a marketing department
                                that rose to international prominence and
                                prestige. He is known for his marketing mind,
                                his servant&rsquo;s heart, and his
                                entrepreneurial spirit.
                            </p>
                            <p>
                                Having worked at Chick-fil-A his entire career,
                                he saw the principles of servant leadership and
                                creating remarkable customer experiences play
                                out in the growth of more than 2,300 Chick-fil-A
                                restaurants around the USA. Today, this
                                multi-billion-dollar company is recognized as
                                one of America&rsquo;s most successful,
                                powerful, and beloved brands.
                            </p>
                        </figcaption>
                    </div>
                </figure>

                <!-- Krish Dhanam -->
                <figure class="view speaker speaker--picture-text">
                    <div class="view__anchor" id="krish-dhanam"></div>
                    <div class="speaker__group">
                        <picture
                            class="contain contain--speaker"
                            data-src-img="/images/speakers/krish-dhanam.jpg"
                            data-attr='{ "alt" : "Krish Dhanam" }'
                        ></picture>
                        <figcaption class="speaker__text">
                            <h3 class="speaker__title">KRISH<br />DHANAM</h3>
                            <h4 class="speaker__role">
                                ZIG ZIGLAR PROT&eacute;G&eacute; & WORLD CLASS
                                SPEAKER
                            </h4>
                            <p>
                                The personal prot&eacute;g&eacute; of Zig Ziglar
                                and acclaimed sales training expert, Krish has
                                spoken to millions of people. He&rsquo;s also
                                authored several books, including his
                                contribution to Top Performance with Zig Ziglar.
                            </p>
                            <p>
                                In many ways, Krish Dhanam is the epitome of the
                                American Dream. A native of India, he arrived in
                                the United States with nine dollars in his
                                pocket and a belief in himself that he could
                                succeed. With the confidence of a consummate
                                salesperson, Krish shows the practical and
                                real-world ways in which the American Dream is
                                still alive and well.
                            </p>
                        </figcaption>
                    </div>
                </figure>

                <!-- Jamie & Ryan Smith -->
                <figure class="view speaker speaker--picture-text">
                    <div class="view__anchor" id="jamie-and-ryan-smith"></div>
                    <div class="speaker__group">
                        <picture
                            class="contain contain--speaker"
                            data-src-img="/images/speakers/jamie-and-ryan-smith.jpg"
                            data-attr='{ "alt" : "Jamie & Ryan Smith" }'
                        ></picture>
                        <figcaption class="speaker__text">
                            <h3 class="speaker__title">JAMIE & RYAN SMITH</h3>
                            <h4 class="speaker__role">
                                FROM TRAILER CASH TO REAL ESTATE
                                MULTI-MILLIONAIRES
                            </h4>
                            <p>
                                Jamie and Ryan Smith are a force of nature in
                                the world of real estate investing. Casting
                                their bread on many waters, they have
                                considerable experience in single family
                                residential development, billboards, and storage
                                units.
                            </p>
                            <p>
                                They are best known for their prowess in the
                                manufactured housing community niche, where
                                using multiple investment funds, they now
                                participate in the ownership and/or management
                                of over 20,000 mobile home lots. They have a
                                unique ability to create well-run and highly
                                profitable mobile home communities with reliable
                                cash flow.
                            </p>
                        </figcaption>
                    </div>
                </figure>

                <!-- Michael Pink -->
                <figure class="view speaker speaker--picture-text">
                    <div class="view__anchor" id="michael-pink"></div>
                    <div class="speaker__group">
                        <picture
                            class="contain contain--speaker"
                            data-src-img="/images/speakers/michael-pink.jpg"
                            data-attr='{ "alt" : "Michael Pink" }'
                        ></picture>
                        <figcaption class="speaker__text">
                            <h3 class="speaker__title">MICHAEL<br />PINK</h3>
                            <h4 class="speaker__role">
                                THE WORLD&rsquo;S LEADING BIBLICAL SALES &
                                BUSINESS EXPERT
                            </h4>
                            <p>
                                Best-selling author of Biblically based sales
                                and marketing strategy classics like Selling
                                Among Wolves, Michael has over 30 years of
                                experience and is the leading expert in applying
                                Biblical solutions to sales and marketing
                                growth.
                            </p>
                            <p>
                                From startups to Fortune 100 companies, Michael
                                helps accelerate success by helping companies
                                follow Biblically based sales training methods.
                                Michael recently helped transform a fledgling
                                sales organization with just three struggling
                                agents to the fastest growing real estate
                                brokerage in America.
                            </p>
                        </figcaption>
                    </div>
                </figure>

                <!-- Myron Golden -->
                <figure class="view speaker speaker--picture-text">
                    <div class="view__anchor" id="myron-golden"></div>
                    <div class="speaker__group">
                        <picture
                            class="contain contain--speaker"
                            data-src-img="/images/speakers/myron-golden.jpg"
                            data-attr='{ "alt" : "Myron Golden" }'
                        ></picture>
                        <figcaption class="speaker__text">
                            <h3 class="speaker__title">MYRON<br />GOLDEN</h3>
                            <h4 class="speaker__role">
                                10X BUSINESS GROWTH STRATEGIST
                            </h4>
                            <p>
                                Myron Golden is a dynamic speaker, business
                                trainer, and author who has over 30 years of
                                experience in helping businesses scale to
                                another level using unique sales and marketing
                                strategies. Dr. Golden helps business owners
                                hack their revenue growth quickly and
                                effectively, by a factor of 2X, 5X or even 10X
                                what they are currently producing.
                            </p>
                            <p>
                                As a speaker, he has dazzled audiences with his
                                unique business growth strategies, sharing the
                                platform with people like Grant Cardone, Tony
                                Robbins, John Maxwell, Russel Brunson, Daymond
                                John, Jim Rohn, and others. He is also a best
                                selling author of several books on the subjects
                                of business and finance. His book &ldquo;From
                                The Trash Man To The Cash Man&rdquo; has sold
                                over 140,000 copies in the first two years of
                                being in print.
                            </p>
                        </figcaption>
                    </div>
                </figure>
            </div>
        </div>
    </div>
</main>
    
</asp:Content>