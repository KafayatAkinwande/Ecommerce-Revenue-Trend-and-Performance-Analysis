# Ecommerce Revenue Trend and Performance Analysis

## BACKGROUND AND OVERVIEW

**Olist** is a Brazilian-based e-commerce company that serves as a marketplace for the sale of wide range consumer and business products . Olist connects small businesses from all over Brazil to customers in brazil by listing their products on the Olist marketplace.

The totals sales value from the dataset is **R$ 13.2M**, 74 unique product categories sold by 3,095 unique sellers. Overall customer is 32K which account  for over 96K transactions.

This report is directed to the Head of Finance and VP of Strategy to inform resource allocation, category investment decisions, and geographic expansion priorities. It shows where the business is growing and where opportunities exist.

## DATA STRUCTURE AND OVERVIEW

The database structure as seen below consists of four tables: orders, order items, products, and customers, with a total row count of over 110K records spanning September 2016 to August 2018.

<img width="1536" height="1024" alt="ERD" src="https://github.com/user-attachments/assets/035e1d67-46e0-4122-8f0d-d0444e1d85eb" />


### Data Quality Notes:
- **Analysis Period:** January 2017 - August 2018 (20 months)
- **Exclusions:** September-December 2016 (incomplete and inconsistent data)
- **Delivered Orders Only:** Excludes cancelled/pending orders
- **Missing Categories:** 1.85% of products lack category classification (handled as 'unknown_category')


### North Star Metrics:
- **Sales Trend:** Monthly revenue, number of orders, average order value (AOV)
- **Growth Rates:** MoM and YoY growth in revenue; annualized run rate (projected annual revenue based on recent months)
- **Revenue Concentration:** % of sales from top 10 product categories
- **Geographic Distribution:** % of sales from top 10 customer states

## EXECUTIVE SUMMARY

<img width="1300" height="729" alt="Project Dashboard" src="https://github.com/user-attachments/assets/b6c5af3e-7595-4271-b8ee-2c1e36e1e038" />

### Business Context
This analysis examines revenue trends, growth rates, and performance drivers across product categories and geographic markets for the Olist Brazilian e-commerce marketplace. The goal is to identify opportunities for resource allocation, category investment, and geographic expansion.

### Key Findings
1. Revenue Growth: The marketplace achieved 114% year-over-year growth, with revenue increasing from R$2.99M (Jan-Aug 2017) to R$7.22M (Jan-Aug 2018). Current run rate based on Q3 2018 suggests annualized revenue of R$10.25M.

2. Volume-Driven Growth: Growth is primarily volume-driven, with order count surging from 21.9K to 52.7K orders (+140%), while AOV remained relatively stable (R$120 average), indicating successful customer acquisition strategy.

3. Geographic Concentration Risk: Revenue is heavily concentrated in São Paulo (38.3% of customer orders), with top 3 states accounting for 63% of revenue.
   However, emerging markets like Roraima show exceptional growth (+500% YoY).
   Healthy Category Diversification: Top 3 categories represent only 25.9% of revenue, indicating balanced portfolio with reduced concentration risk across 70+ product categories.

### Top Priority Recommendation
Invest in geographic expansion beyond SP/RJ/MG corridor while maintaining category diversification. Specifically, scale customer acquisition in high-growth emerging states (RR, AP, AM) and optimize logistics to support 140% order volume growth trajectory.

## ANALYSIS & FINDINGS

### A. Overall Revenue Performance
#### High-Level Metrics


![KPI](https://github.com/KafayatAkinwande/Ecommerce-Revenue-Trend-and-Performance-Analysis/blob/main/KPIs.png)

##### Insight:
The marketplace processed over 96K delivered orders across 74 unique products, demonstrating significant scale and product diversity. The average order value of R$119 suggests a mix of low-to-mid value purchases typical of mass-market e-commerce.

#### Revenue Growth Trajectory

![Sales Revenue Trend](https://github.com/KafayatAkinwande/Ecommerce-Revenue-Trend-and-Performance-Analysis/blob/main/Sales%20Revenue.png)

##### Key Findings:

- Sustained Growth: Revenue shows consistent upward trajectory from Jan 2017 through Aug 2018
- Seasonal Patterns:

Peak Performance Drivers in November 2017. (R$987K - highest month): Black Friday effect drove 1.5-2x increase across all categories
Watches & Gifts: R$95K (AOV R$205) **and** Bed Bath Table: 961 units sold, R$87K revenue
  
January 2018 (R$920K) and March 2018 show strong post-holiday and spring demand

Mid-Year Promotions: May 2017 peak led by Health & Beauty (R$46K) suggests successful seasonal campaigns

##### Predictable Decline Pattern:
- Consistent post-peak drops: December -26%, February -10%
- June dips in both 2017 and 2018 indicate seasonal slowdown

##### Strategic Implication:
Clear seasonal cycles enable proactive inventory planning, campaign timing optimization, and category-specific promotional strategies (e.g., Watches & Gifts for Black Friday, Health & Beauty for mid-year).

- Acceleration: Growth rate appears to accelerate in H2 2018, with recent months showing highest revenue

#### Year-over-Year Growth Analysis

##### Strategic Insight:
The 114% year-over-year revenue growth is exceptional for an established marketplace. More importantly, this growth is volume-driven (order count +140%) rather than price-driven (AOV -1%), indicating successful customer acquisition and retention strategies. The stable AOV suggests we're maintaining product mix and not chasing high-ticket items at the expense of accessibility.

##### Run Rate Projection:
Based on Q3 2018 performance (Jun-Aug), the annualized run rate is R$10.25M, suggesting potential full-year 2018 revenue of R$10-11M if momentum continues.

### B. Product Category Performance

#### Category Revenue Distribution
!![Top product categories](https://github.com/KafayatAkinwande/Ecommerce-Revenue-Trend-and-Performance-Analysis/blob/main/Top%2010%20Categories.png)

##### Product Diversification:

Top 3 categories (Health & Beauty, Watches & Gifts, Bed Bath Table) represent **only 25.9%** of total revenue, indicating **healthy diversification**. 

**This distribution is significantly healthier than typical e-commerce** where top 3 categories often exceed 50% of revenue. This balanced portfolio reduces category-specific risk and protects against market shocks in any single category. 

##### Category Insights:

Health & Beauty (Leader): High order volume with moderate AOV suggests mass-market appeal
Watches & Gifts (High AOV): Lower volume but higher-value purchases; potential for targeted marketing
Bed Bath Table: Strong volume indicating household goods demand
Computers (High AOV = R$1,098): Premium category with only 30 products sold generating R$218K - opportunity for expansion

##### Volume vs. Value Analysis:

Volume leaders: Bed Bath Table (3,029 orders) drives sales through quantity
Value leaders: Computers (AOV R$1,098) and Watches command premium prices
Balanced performers: Health & Beauty combines solid volume (2,444) with above-average spend

### C. Geographic Performance Analysis

![Top 10 State](https://github.com/KafayatAkinwande/Ecommerce-Revenue-Trend-and-Performance-Analysis/blob/main/Top%2010%20state.png)

#### State-Level Revenue Distribution

##### Geographic Concentration Risk:

- São Paulo dominates with **38.3%** of revenue
- Top 3 states (SP, RJ, MG) account for 63.3% of total revenue
- Southeast region concentration creates logistics efficiency but market dependency risk

#### Seller Geographic Distribution & Logistics Opportunity

Current Seller Concentration:
- São Paulo: 64% of sellers
- Top 3 states (SP, PR, MG): 81% of sellers

Logistics Trade-off:

Current Advantage: Seller concentration in SP enables bulk logistics, lower costs for serving Southeast customers (63% of orders)

Emerging Opportunity: High customer growth in Northern states (+100-300%) currently served by distant SP sellers creates:
- Longer delivery times (15-20 days SP→RR vs. 3-5 days local)
- Higher shipping costs (reduces margins)
- Customer satisfaction risk in growth markets

**Strategic Recommendation:** Recruit sellers in high-growth Northern markets (RR, AP, AM) to optimize regional fulfillment, reduce delivery times, and improve customer experience in fastest-growing segments.

##### Regional Patterns:

High AOV states: High AOVs >R$150 are amonngst the lowest revenue generating state suggests, lower income demography concentration
Volume states: SP leads in order count, indicating established market penetration
Underserved regions: Northern and Central-West states show lower penetration despite population size

#### State Growth Rate Analysis
![State Growth Rate](https://github.com/KafayatAkinwande/Ecommerce-Revenue-Trend-and-Performance-Analysis/blob/main/Customer%20State%20Growth.png))

##### Emerging Market Opportunity:

- Roraima (RR) shows exceptional 299% growth (R$1.4K → R$5.6K), though from small base
- Northern states (RR, AP, AM) display double digit growth rates, indicating early-stage market penetration
- Established markets (SP, and MG) show >15% growth, demonstrating continued strong performance

##### Expansion Recommendation:
While absolute revenue in emerging states is small, the explosive growth rates suggest:

- Untapped market potential in Northern/Central-West regions
- Logistics improvements have enabled reach to previously underserved areas
- Opportunity to capture market share before competitors scale

##### Risk Mitigation:
The 63% concentration in top 3 states creates dependency risk. Economic downturn or regional disruption in Southeast could significantly impact revenue. Diversification into high-growth emerging markets would balance portfolio.

87.5% (7 out of 8) of states experiencing negative growth rates are located in the North and NorthEast Region. Though the value or percentage decrease is not signitficant. It can be looked into further the reason for the concentration in that region.

##  STRATEGIC INSIGHTS 
Olist Ecommerce is a High-Growth Marketplace with Strong Fundamentals. The market is experiencing exceptional growth (114% YoY) driven by successful customer acquisition and volume expansion. With 70+ product categories generating revenue, the platform demonstrates healthy diversification that reduces concentration risk. However, geographic concentration in the Southeast region (63% of revenue) and product concentration presents both an operational advantage and a strategic vulnerability.

### Critical Success Factors
#### What's Working Well:

- Exceptional Volume Growth (+140% orders): Customer acquisition strategy is highly effective
- Balanced Category Portfolio (Top 3 = 26%): Diversification protects against category-specific shocks
- Stable Unit Economics (AOV R$119): Pricing strategy maintains value without sacrificing growth
- Accelerating Momentum (Q3 run rate R$10.25M): Recent performance suggests continued expansion

#### Areas of Concern:

1. Geographic Over-Concentration (63% customer revenue in 3 states): Creates regional dependency risk

2. Customer Market Erosion (18.6% revenue exposure):
   Eight customer states show declining demand, most severely AC (-49.9%), AL (-18.2%), and SE (-11.6%). Root causes unclear but warrant immediate investigation:
   - Increased competition from regional competitors
   - Logistics/delivery challenges in these states
   - Insufficient marketing investment
   - Economic conditions in these regions
   - Platform awareness/brand recognition gaps

3. Slight AOV Decline (-1%): Warrants monitoring to ensure margin preservation

4. Data Limitations: Analysis limited to Aug 2018; recent trends unknown

#### Key Surprises

- RR's(Roraima) 299% Growth: Small state showing explosive growth from R$1.4K to R$5.6K - early indicator of Northern region opportunity
- Computers Category Efficiency: Only 30 products sold generated R$218K (AOV R$1,098) - demonstrates high-value, low-volume opportunity
  
## BUSINESS RECOMMENDATION

### _Short-Term Initiatives_

### 1. Launch Northern Region Pilot Campaign:
The marketing team should allocate 15% of Q4 marketing budget to targeted campaigns in RR, AP, AM states. These states show potential growth from small bases and created early mover advantage. The expected Impact of this is to capture 5-10% revenue diversification from Southeast in 6 months.

### 2. Optimize Computers Category Supply:
Recruit 10-15 new sellers in Computer Accessories (current: 30 sold generating R$218K). As this is the highest AOV category (R$1,098) with limited inventory depth
This could result in an expected incremental revenue in 6 months.

### _Medium to Long-Term Initiatives_

### 3. Geographic Risk Mitigation Program
Reduce Top 3 state concentration from 63% to <55% through the following tactics:

- Launch state-specific promotional campaigns in RS, PR, SC (established but underweighted)
- Partner with regional logistics providers to improve delivery times in Central-West
- Create localized marketing content for Northern/Northeast regions

This can further be achieved by reallocating 20% of SP-focused spend to diversification initiatives, resulting in revenue shift to emerging regions
Expected Impact: 8-10% revenue shift to emerging regions

### 4. Category Portfolio Optimization
Maintain healthy 25-30% concentration in Top 3 categories while scaling total revenue through the following tactics:

- Quarterly category performance reviews
- Proactive seller recruitment in underrepresented categories
- Category-specific marketing budget allocation based on growth potential

**Expected Impact:** Increased sustained diversification as marketplace scales to R$20M+

### 5. Investigate Secondary Market Customer Declines

18.6% of revenue comes from 8 declining customer markets (AC -50%, AL -18%, SE -12%, RO -11%, PA -4%, CE -3%, MA -2%, RJ -0.2%)

1. **Root Cause Analysis:**
   - Survey lost customers in AC, AL, SE (severe declines)
   - Benchmark delivery times vs. competitors in these states
   - Analyze marketing spend allocation vs. customer acquisition
   - Review competitor activity (new entrants, pricing, promotions)

2. **Targeted Interventions:**
   - **If logistics issue:** Partner with regional carriers to improve delivery speed
   - **If awareness issue:** Increase digital marketing spend in declining states
   - **If price sensitivity:** Test state-specific promotions or free shipping thresholds

**Rationale:** Protecting  annual revenue base in at-risk markets

**Expected Impact:** Reverse declines in recoverable markets; minimize losses in non-viable markets


