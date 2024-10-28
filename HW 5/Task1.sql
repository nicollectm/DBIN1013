
-- 1

SELECT bill_total, bill_date, cust_name
FROM restBill
WHERE cust_name = "Bob Crow";


-- 2 

SELECT DISTINCT cust_name 
FROM restBill
WHERE cust_name LIKE "%Smith"
ORDER BY cust_name DESC;


-- 3

SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE "% C%";


-- 4 

SELECT DISTINCT first_name, surname
FROM restStaff T1
INNER JOIN restRoom_management T2
ON T1.staff_no = T2.headwaiter;


-- 5 

SELECT * FROM restBill
WHERE bill_date > 160200 AND bill_date < 160300


-- 6 

SELECT DISTINCT bill_date
FROM restBill
WHERE bill_date LIKE "15%"
ORDER BY bill_date ASC;