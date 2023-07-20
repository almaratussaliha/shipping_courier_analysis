# Shipping Courier Performance Analysis
* Tableau Workbook: <a href="https://public.tableau.com/app/profile/almar.atss/viz/ShippingCourierAnalytics-notcompleted_16879451783470_16880478218090_16889985741060_16890904338800/Story1">Dashboard Shipping Courier Analysis</a>
* Data pre-processing using SQL: <a href="https://github.com/almaratussaliha/shipping_courier_analysis/blob/master/data_preprocessing.sql">HERE</a>
* data pre-processing using Python:  <a href="https://github.com/almaratussaliha/shipping_courier_analysis/blob/master/shipping.ipynb">HERE</a>
* Slide Presentation : <a href="https://github.com/almaratussaliha/shipping_courier_analysis/blob/master/Shipping%20Couerir%20Analysis_pdf.pdf">Slide in Bahasa Indonesia </a> 
### Background
As a data analyst in a small shop that acts as a distributor for shipping expeditions from the city to other cities. 
We were asked to examine each shipping service according to criteria such as mode of transport, weight of goods, price, etc. 
The data used in this project are only purchases of goods over 1 million.


### `Main Goals`
- Examine data: import data into PostgreSQL, and pre-process data (check for outliers, create new column).
- Create dashboards to know the performance of couriers in Indonesia.

### About the dataset
The data used is from a small shop (owned by Rakamin Academy) consisting of 2 tables: courier and mapping_province with 10.999 rows.
![alt text](https://github.com/almaratussaliha/shipping_courier_analysis/blob/master/img/erd.png?raw=true)

### Dashboard Development
`Executive Summary`

![alt text](https://github.com/almaratussaliha/shipping_courier_analysis/blob/master/img/dash1.png?raw=true)

`Number of orders (delay/on-time) and number of customer reviews`

![alt text](https://github.com/almaratussaliha/shipping_courier_analysis/blob/master/img/dash2.png?raw=true)

`Feature Correlation`

![alt text](https://github.com/almaratussaliha/shipping_courier_analysis/blob/master/img/dash3.png?raw=true)

### Insight and Recommendation
`Insight`
- Generally considered, the performance of goods delivery using freight forwarding services in Indonesia is still of poor quality,
especially in terms of delivery accuracy.
- Whether or not the goods are delivered on time is influenced by several factors, including the price discount offered,
the price of the goods, and the number of calls to CS.
- If the discounted price is over IDR 150,000, delivery will not be made on time.

`Recommendation`
- To determine which expedition is the best to send goods to, you can look at the province with the lowest total order delay,
or you can look at the number of 5 ratings from each expedition in each province.
- It is recommended that the delivery of the expedition package does not pay attention to the discount aspect of the ordered goods
so that the possibility of on-time delivery and quality rating of the expedition is maintained.
