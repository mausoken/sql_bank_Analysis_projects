CREATE DATABASE bank_transactions_analysis;

CREATE TABLE customers (
	CustomerID SERIAL PRIMARY KEY,
	CustomerDOB DATE,
	CustGender VARCHAR(10),
	CustLocation VARCHAR(20)
);

ALTER TABLE customers
ALTER COLUMN CustomerID TYPE VARCHAR(40) 

CREATE TABLE accounts (
	CustAccountBalance FLOAT,
	Age INT,
	CustomerID VARCHAR(40) REFERENCES customers(CustomerID)

);

DROP TABLE accounts

CREATE TABLE transactions (
	TransactionID VARCHAR(20),
	TransactionDate DATE,
	TransactionTime TIME,
	TransactionAmount FLOAT,
	CustomerID VARCHAR(40) REFERENCES customers(customerID)
);	
ALTER TABLE transactions
ADD PRIMARY KEY (transactionID);


CREATE TABLE stageTABLE (
	TransactionID TEXT,
	CustomerID TEXT,
	CustomerDOB TEXT,
	CustGender TEXT,
	CustLocation TEXT,
	CustAccountBalance TEXT,
	TransactionDate TEXT,
	TransactionTime TEXT,
	TransactionAmount TEXT,
	Age TEXT

);

ALTER TABLE stageTABLE
ALTER COLUMN TransactionID TYPE VARCHAR(100)
DROP TABLE stageTABLE


SELECT * FROM stageTABLE;
SELECT COUNT (*) FROM stageTABLE
WHERE stageTABLE IS NULL


INSERT INTO accounts(CustAccountBalance,Age,CustomerID)
SELECT
	CustAccountBalance::FLOAT,
	Age:: INT,
	CustomerID :: VARCHAR(40)
FROM stageTABLE;

INSERT INTO customers(CustomerID ,CustomerDOB ,CustGender, CustLocation)
SELECT
	CustomerID:: TEXT,
	CustomerDOB:: DATE,
	CustGender:: VARCHAR(10),
	CustLocation:: VARCHAR(20)
FROM stageTABLE
ON CONFLICT DO NOTHING;


INSERT INTO transactions(TransactionID,TransactionDate,TransactionTime,TransactionAmount,CustomerID)
SELECT
	TransactionID:: VARCHAR(20),
	TransactionDate:: DATE,
	TransactionTime:: TIME,
	REPLACE(TransactionAmount , ',', '.'):: FLOAT,
	CustomerID:: VARCHAR(40)
FROM stageTABLE;


DROP TABLE transactions

SELECT
	c.CustomerID,
	c.CustLocation,
	t.transactionID,
	t.transactionAmount
FROM Customers c
JOIN transactions t 
	ON c.CustomerID=t.CustomerID


SELECT
	c.CustomerID,
	c.CustLocation
FROM Customers c
LEFT JOIN transactions t 
	ON c.CustomerID=t.CustomerID
WHERE t.transactionID IS NULL


SELECT
	c.CustomerID,
	c.CustLocation,
	COALESCE(SUM(t.transactionAmount),0) AS total_spent 
FROM Customers c
LEFT JOIN transactions t 
	ON c.CustomerID=t.CustomerID
GROUP BY c.CustomerID,c.CustLocation
Order by total_spent desc


SELECT
	c.CustomerID,
	c.CustLocation,
	COUNT(t.transactionAmount) AS total_transactions
FROM Customers c
LEFT JOIN transactions t 
	ON c.CustomerID=t.CustomerID
GROUP BY c.CustomerID,c.CustLocation
Order by total_transactions desc


