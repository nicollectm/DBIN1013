Task5.sql

-- 1
SELECT 
    s.first_name, 
    s.surname, 
    b.bill_date, 
    COUNT(b.bill_no) AS number_of_bills
FROM 
    restBill b
JOIN 
    restStaff s ON b.waiter_no = s.staff_no
GROUP BY 
    s.first_name, 
    s.surname, 
    b.bill_date
HAVING 
    COUNT(b.bill_no) >= 2;

-- 2
SELECT 
    room_name, 
    COUNT(table_no) AS num_tables
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3
SELECT 
    rm.room_name, 
    SUM(b.bill_total) AS total_bill_amount
FROM restBill b
JOIN restRoom_management rm ON b.bill_date = rm.room_date
JOIN restRest_table t ON b.table_no = t.table_no
WHERE t.room_name = rm.room_name
GROUP BY rm.room_name;

-- 4 
SELECT 
    h.first_name AS headwaiter_first_name,
    h.surname AS headwaiter_surname,
    SUM(b.bill_total) AS total_bill_amount
FROM restBill b
INNER JOIN restStaff s ON b.waiter_no = s.staff_no   
INNER JOIN restStaff h ON s.headwaiter = h.staff_no  
GROUP BY h.first_name, h.surname
ORDER BY total_bill_amount DESC;

-- 5 
SELECT 
    cust_name, 
    AVG(bill_total) AS avg_spent
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

-- 6
SELECT 
    w.first_name, 
    w.surname, 
    b.bill_date, 
    COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
GROUP BY b.waiter_no, b.bill_date
HAVING COUNT(b.bill_no) >= 3;

