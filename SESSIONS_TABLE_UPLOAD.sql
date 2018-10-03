LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sessions.csv'
INTO TABLE mydb.sessions
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';