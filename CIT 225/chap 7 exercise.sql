--- Exercise 7
Set @string := '2024-02-29';
SELECT DATE(@string) AS "date";
SELECT date_format(DATE(@string),'%d-%b-%y') AS "date"; 

