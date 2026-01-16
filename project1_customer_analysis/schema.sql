CREATE TABLE customers (
	CustomerID SERIAL PRIMARY KEY,
	CustomerDOB DATE,
	CustGender VARCHAR(10),
	CustLocation VARCHAR(20)
);

CREATE TABLE accounts (
	CustAccountBalance FLOAT,
	Age INT,
	CustomerID VARCHAR(40) REFERENCES customers(CustomerID)

);

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
