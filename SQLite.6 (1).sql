CREATE TABLE marketing_campaign(
  Month TEXT, Mobile_Spend INT,	Desktop_Spend INT,	Total_Spend INT, Clicks INT, Cost_per_Click DOUBLE, Transactions INT, Transaction_perc DOUBLE)
  
  INSERT INTO marketing_campaign(
  Month, Mobile_Spend,	Desktop_Spend, Total_Spend, Clicks, Cost_per_Click, Transactions, Transaction_perc) 
  VALUES('January', 35908455, 43888111, 79796566, 568213, 1.40, 1064, 0.19);
  
  INSERT INTO marketing_campaign(
  Month, Mobile_Spend,	Desktop_Spend, Total_Spend, Clicks, Cost_per_Click, Transactions, Transaction_perc) 
  VALUES('February', 29594520, 30802460, 60396980, 486398,	1.24, 984, 0.20);
  
  INSERT INTO marketing_campaign(
  Month, Mobile_Spend,	Desktop_Spend, Total_Spend, Clicks, Cost_per_Click, Transactions, Transaction_perc) 
  VALUES('March', 22883043, 29123874, 52006917, 459937, 1.13, 936, 0.20);
  
  INSERT INTO marketing_campaign(
  Month, Mobile_Spend,	Desktop_Spend, Total_Spend, Clicks, Cost_per_Click, Transactions, Transaction_perc) 
  VALUES('April', 37675067,	34776984, 72452051,	481632,	1.50, 990, 0.21);
 
 INSERT INTO marketing_campaign(
  Month, Mobile_Spend,	Desktop_Spend, Total_Spend, Clicks, Cost_per_Click, Transactions, Transaction_perc) 
  VALUES('May',	34322655, 34322655,	68645310, 478822, 1.43,	886, 0.19);
  
  INSERT INTO marketing_campaign(
  Month, Mobile_Spend,	Desktop_Spend, Total_Spend, Clicks, Cost_per_Click, Transactions, Transaction_perc) 
  VALUES('June', 16448135, 22714091, 39162225, 332313,	1.18, 711, 0.21);
  
  INSERT INTO marketing_campaign(
  Month, Mobile_Spend,	Desktop_Spend, Total_Spend, Clicks, Cost_per_Click, Transactions, Transaction_perc) 
  VALUES('July', 16130388, 26318002, 42448390, 289154, 1.47, 722, 0.25);
 
INSERT INTO marketing_campaign(
  Month, Mobile_Spend,	Desktop_Spend, Total_Spend, Clicks, Cost_per_Click, Transactions, Transaction_perc) 
  VALUES('August', 12717262, 23617772, 36335034, 224080, 1.62, 558, 0.25);
  
  INSERT INTO marketing_campaign(
  Month, Mobile_Spend,	Desktop_Spend, Total_Spend, Clicks, Cost_per_Click, Transactions, Transaction_perc) 
  VALUES('September', 11111397, 21569181, 32680578, 220951, 1.48, 464, 0.21);
  
  INSERT INTO marketing_campaign(
  Month, Mobile_Spend,	Desktop_Spend, Total_Spend, Clicks, Cost_per_Click, Transactions, Transaction_perc) 
  VALUES('October',	17480539, 27341357, 44821896, 268924, 1.67, 508, 0.19);
  
  INSERT INTO marketing_campaign(
  Month, Mobile_Spend,	Desktop_Spend, Total_Spend, Clicks, Cost_per_Click, Transactions, Transaction_perc) 
  VALUES('November', 21018102, 26750312, 47768414, 295562, 1.62, 582, 0.20);
  
  INSERT INTO marketing_campaign(
  Month, Mobile_Spend,	Desktop_Spend, Total_Spend, Clicks, Cost_per_Click, Transactions, Transaction_perc) 
  VALUES('December', 26467233, 31070230, 57537464, 330514, 1.74, 591, 0.18);


---Total Spend Across All Months 
SELECT '$' || ROUND(SUM(Total_Spend), 2)  AS total_spend_all_months
FROM marketing_campaign;

---Average Cost per Click ($/Click) by Month
SElect month, '$' || AVG(cost_per_click) AS AVG_Cost_per_Click
FROM marketing_campaign
Group by month
Order by Month;

---Month with the highest Mobile Spend
SELECT '$' || MAX(mobile_spend) as Highest_mobile_spend, month as Month_with_the_highest_mobile_spend
FROM marketing_campaign
GROUP by month
ORDER BY month
LIMIT 1; 

 ---Month with the Lowest Transaction Percentage
 SELECT Month AS Month_with_lowest_transsaction_percentage, MIN(transaction_perc) || '%'  AS Min_transaction_perc
 FROM marketing_campaign
 group by month
 ORDER BY month
 LIMIT 1;
 
 ---Total Clicks and Transactions for the First Half of the Year
 SELECT SUM(clicks) AS Total_clicks, SUM(transactions) AS Total_transactions
 FROM marketing_campaign
 WHERE month in('January', 'February', 'March', 'April', 'May', 'June'); 
 
 ---Difference in Total Spend Between July and December
 SELECT
( 
  (SELECT total_spend
  FROM marketing_campaign
  WHERE month = 'December')
  -
 (SELECT total_spend
  FROM marketing_campaign
  WHERE month = 'July')
)
  
  AS Total_spend_difference;
  
 --- Percentage of Desktop Spend Over Total Spend for Each Month

  SELECT month, ROUND(CAST(desktop_spend as DOUBLE)/(CAST(total_spend as DOUBLE)) * 100, 2) || '%' as desktop_spend_percentage
  FROM marketing_campaign
  Order by month;
  
---Months with transaction percentage over 0.2           
SELECT month, transaction_perc
FROM marketing_campaign
WHERE transaction_perc > 0.2
ORDER BY month;

---Cumulative spend over the year
SELECT SUM(total_spend) OVER(ORDER BY month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT row) AS Cummulative_spend
FROM marketing_campaign;

---Month with highest number of Clicks per Transaction
SELECT month, MAX(clicks)AS Highest_click
FROM marketing_campaign
ORDER BY clicks
LIMIT 1;
