LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/payments.csv'
INTO TABLE mydb.payments
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';