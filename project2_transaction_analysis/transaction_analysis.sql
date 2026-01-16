CREATE DATABASE TransactionAnalysis;
CREATE TABLE FinancialTransactions (
	Transactionid VARCHAR(15),
	Date DATE, 
	Currency TEXT,
	Sender VARCHAR(30),
	Receiver VARCHAR(30),
	Amount INT,
	Fee INT,
	Type TEXT
);


select * from FinancialTransactions


SELECT 
	Sender,
	count(*) as total_transactions,
	sum(Amount) as total_sent
from FinancialTransactions
group by Sender
order by total_sent desc
limit 10


SELECT 
	Receiver,
	Count(*) AS total_transactions,
	SUM(Amount) as total_sent
FROM FinancialTransactions
GROUP BY Receiver 
ORDER BY total_sent desc
limit 10


SELECT 
	Sender,
	SUM(Fee) AS total_fees
FROM FinancialTransactions
GROUP BY sender
order by total_fees desc
limit 10



