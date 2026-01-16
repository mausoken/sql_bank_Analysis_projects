create database revenue_analysis;

CREATE TABLE info_transaction(
	Transactionid VARCHAR(15),
	Date DATE, 
	Currency TEXT,
	Sender VARCHAR(30),
	Receiver VARCHAR(30),
	Amount INT,
	Fee INT,
	Type TEXT

);


SELECT * FROM info_transaction;


SELECT
	DATE_TRUNC('month', Date) AS month_started,
	COUNT(*) AS total_transactions,
	SUM(Amount) AS total_amount,
	SUM(Fee) AS total_fee
FROM info_transaction
GROUP BY month_started
ORDER BY month_started;


SELECT 
	DATE_TRUNC('month', Date) AS month,
	AVG(Amount) AS avg_transactions
FROM info_transaction
GROUP BY month
ORDER BY month;

SELECT
	DATE_TRUNC('month',Date) as month,
	type,
	COUNT(*) AS Transaction_Count,
	SUM(Amount) AS Total_amount
FROM info_transaction
GROUP BY month,type
ORDER BY month;
