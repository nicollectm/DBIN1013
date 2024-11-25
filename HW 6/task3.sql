Task3.sql

-- 1

SELECT T2.first_name, T2.surname
FROM restBill T1
INNER JOIN restStaff T2
ON T1.waiter_no = T2.staff_no
WHERE T1.cust_name = "Tanya Singh";

-- 2
SELECT T1.room_date, T1.room_name
FROM restRoom_management T1
INNER JOIN restStaff T2
ON T1.headwaiter = T2.staff_no
WHERE T2.first_name = "Charles" 
AND T2.surname = "Watson" 
AND T1.room_name = "Green" 
AND T1.room_date BETWEEN 160201 AND 160229;



-- 3 
SELECT T2.first_name, T2.surname
FROM restStaff T2
INNER JOIN restStaff T1
ON T2.headwaiter = T1.staff_no
WHERE T1.first_name = "Zoe"
AND T1.surname = "Ball";


-- 4
SELECT T1.cust_name, T1.bill_total, CONCAT(T2.first_name, ' ', T2.surname) AS waiter_name
FROM restBill T1
INNER JOIN restStaff T2
    ON T1.waiter_no = T2.staff_no
ORDER BY T1.bill_total DESC;

-- 5 
SELECT DISTINCT T2.first_name, T2.surname
FROM restBill T1
INNER JOIN restStaff T2
    ON T1.waiter_no = T2.staff_no
WHERE T1.table_no IN (
    SELECT table_no
    FROM restBill
    WHERE bill_no IN (00014, 00017) );
      
-- 6
SELECT DISTINCT T2.first_name, T2.surname
FROM restRoom_management T1
INNER JOIN restStaff T2
    ON T1.headwaiter = T2.staff_no
LEFT JOIN restBill T3
    ON T3.table_no IN (
        SELECT table_no
        FROM restRest_table
        WHERE room_name = 'Blue'
    )
WHERE T1.room_name = 'Blue'
    AND T1.room_date = 160312;