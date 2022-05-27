--- Exercise 1
SELECT substring("Please find the substring in this string",17,9) AS "parsed";

--- Exercise 2
SELECT abs(-25.76823) as "abs", sign(-25.76823) as "sign", round(-25.76823, 2) as "round";

--- Exercise 3
SELECT extract(MONTH FROM CURRENT_DATE()) as "month";

--- Exercise 4
SET @string := 'Sorcer''s Stone';
SELECT @string;
SELECT replace(@string, "er", "erer") as "title";

--- Exercise 5
SET @string := '2024-02-29';
SELECT DATE(@string) AS "date";
SELECT date_format(DATE(@string),'%d-%b-%y') AS "date"; 

